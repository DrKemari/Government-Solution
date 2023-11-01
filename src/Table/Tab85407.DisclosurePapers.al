#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85407 "Disclosure Papers"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            var
                Courses: Record Courses;
            begin
                Courses.Reset;
                Courses.SetRange(Code, Examination);
                if Courses.FindFirst then begin
                    "Examination Name" := Courses.Description;
                end
            end;
        }
        field(4; "Examination Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level;
        }
        field(6; "Paper Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
                Papers.Reset;
                Papers.SetRange(Code, "Paper Code");
                if Papers.FindFirst then begin
                    Examination := Papers.Course;
                    Validate(Examination);
                    "Paper Name" := Papers.Description;
                    Level := Papers.Level;
                end
            end;
        }
        field(7; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; Set; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Set = true then begin
                    Papers.Reset;
                    Papers.SetRange(Code, "Paper Code");
                    if Papers.FindFirst then begin
                        "Setting Amount" := Papers."Setting Amount";
                        "Total Amount" := "Setting Amount" + "Solution Amount";
                    end
                end else begin
                    "Setting Amount" := 0;

                    "Total Amount" := "Setting Amount" + "Solution Amount";
                end;
            end;
        }
        field(9; "Setting Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; Solution; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Solution = true then begin
                    Papers.Reset;
                    Papers.SetRange(Code, "Paper Code");
                    if Papers.FindFirst then begin
                        "Solution Amount" := Papers."Solution Amount";

                        "Total Amount" := "Setting Amount" + "Solution Amount";
                    end
                end else begin
                    "Solution Amount" := 0;

                    "Total Amount" := "Setting Amount" + "Solution Amount";
                end;
            end;
        }
        field(11; "Solution Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Papers: Record Papers;
}
