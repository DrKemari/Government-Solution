#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85454 "Audit Report Lines"
{

    fields
    {
        field(1;"Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Situation Found";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Recommendation;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            var
                Courses: Record Courses;
            begin
                Courses.Reset;
                Courses.SetRange(Code,Examination);
                if Courses.FindFirst then begin
                  "Examination Name":=Courses.Description;
                end
            end;
        }
        field(6;"Examination Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Evidence and Analysis";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Causes;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Effect;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Department;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
    }

    keys
    {
        key(Key1;"Header No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;Department,Recommendation)
        {
        }
    }
}

