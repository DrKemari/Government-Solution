#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85410 "Disclosure Paper Submitted"
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
            begin
                Papers.Reset;
                Papers.SetRange(Code, "Paper Code");
                if Papers.FindFirst then begin
                    "Paper Name" := Papers.Description;
                    Examination := Papers.Course;
                    Validate(Examination);
                    Level := Papers.Level;
                end
            end;
        }
        field(7; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Question No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Topic Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Area";

            trigger OnValidate()
            begin
                PaperTopicArea.Reset;
                PaperTopicArea.SetRange(Code, "Topic Code");
                if PaperTopicArea.FindFirst then begin
                    "Topic Name" := PaperTopicArea.Description;
                end
            end;
        }
        field(10; "Topic Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Question Paper"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Suggested Solution"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Completeness Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Complete,Not Complete, ';
            OptionMembers = Complete,"Not Complete"," ";
        }
        field(16; "Topic 2 Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Setup"."Topic Code" where("Paper Code" = field("Paper Code"));

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                // PaperTopicArea.RESET;
                // PaperTopicArea.SETRANGE(Code,"Topic 2 Code");
                // IF PaperTopicArea.FINDFIRST THEN BEGIN
                //  "Topic 2 Name":=PaperTopicArea.Description;
                // END;
                // IF Rec."Topic 2 Code"<>'' THEN BEGIN
                // SetterHeader.RESET;
                // SetterHeader.SETRANGE("Document No.","Document No.");
                // SetterHeader.SETRANGE("Document Type",SetterHeader."Document Type"::"Setter Specification");
                // IF SetterHeader.FINDFIRST THEN BEGIN
                //  SetterTopics.RESET;
                //  SetterTopics.SETRANGE("Document No.","Document No.");
                //  SetterTopics.SETRANGE("Topic Code","Topic 2 Code");
                //  IF NOT SetterTopics.FINDSET THEN BEGIN
                //    SetterTopics2.INIT;
                //    SetterTopics2."Document No.":="Document No.";
                //    SetterTopics3.RESET;
                //    IF SetterTopics3.FINDLAST THEN
                //    SetterTopics2."Line No.":=SetterTopics3."Line No."+1;;
                //    SetterTopics2."Topic Code":="Topic 2 Code";
                //    SetterTopics2."Topic Name":=PaperTopicArea.Description;
                //    SetterTopics2.INSERT(TRUE);
                //
                //    END;
                //
                // END;
                // END;
            end;
        }
        field(17; "Topic 2 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Topic 2 References"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Topic 3 Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Setup"."Topic Code" where("Paper Code" = field("Paper Code"));

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                // PaperTopicArea.RESET;
                // PaperTopicArea.SETRANGE(Code,"Topic 3 Code");
                // IF PaperTopicArea.FINDFIRST THEN BEGIN
                //  "Topic 3 Name":=PaperTopicArea.Description;
                // END;
                // IF Rec."Topic 3 Code"<>'' THEN BEGIN
                // SetterHeader.RESET;
                // SetterHeader.SETRANGE("Document No.","Document No.");
                // SetterHeader.SETRANGE("Document Type",SetterHeader."Document Type"::"Setter Specification");
                // IF SetterHeader.FINDFIRST THEN BEGIN
                //  SetterTopics.RESET;
                //  SetterTopics.SETRANGE("Document No.","Document No.");
                //  SetterTopics.SETRANGE("Topic Code","Topic 3 Code");
                //  IF NOT SetterTopics.FINDSET THEN BEGIN
                //    SetterTopics2.INIT;
                //    SetterTopics2."Document No.":="Document No.";
                //    SetterTopics3.RESET;
                //    IF SetterTopics3.FINDLAST THEN
                //    SetterTopics2."Line No.":=SetterTopics3."Line No."+1;;
                //    SetterTopics2."Topic Code":="Topic 3 Code";
                //    SetterTopics2."Topic Name":=PaperTopicArea.Description;
                //    SetterTopics2.INSERT(TRUE);
                //
                //    END;
                //
                // END;
                // END;
            end;
        }
        field(32; "Topic 3 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Topic 3 References"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Topic 4 Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Setup"."Topic Code" where("Paper Code" = field("Paper Code"));

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                // PaperTopicArea.RESET;
                // PaperTopicArea.SETRANGE(Code,"Topic 4 Code");
                // IF PaperTopicArea.FINDFIRST THEN BEGIN
                //  "Topic 4 Name":=PaperTopicArea.Description;
                // END;
                // IF Rec."Topic 4 Code"<>'' THEN BEGIN
                // SetterHeader.RESET;
                // SetterHeader.SETRANGE("Document No.","Document No.");
                // SetterHeader.SETRANGE("Document Type",SetterHeader."Document Type"::"Setter Specification");
                // IF SetterHeader.FINDFIRST THEN BEGIN
                //  SetterTopics.RESET;
                //  SetterTopics.SETRANGE("Document No.","Document No.");
                //  SetterTopics.SETRANGE("Topic Code","Topic 4 Code");
                //  IF NOT SetterTopics.FINDSET THEN BEGIN
                //    SetterTopics2.INIT;
                //    SetterTopics2."Document No.":="Document No.";
                //    SetterTopics3.RESET;
                //    IF SetterTopics3.FINDLAST THEN
                //    SetterTopics2."Line No.":=SetterTopics3."Line No."+1;;
                //    SetterTopics2."Topic Code":="Topic 4 Code";
                //    SetterTopics2."Topic Name":=PaperTopicArea.Description;
                //    SetterTopics2.INSERT(TRUE);
                //
                //    END;
                //
                // END;
                // END;
            end;
        }
        field(35; "Topic 4 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(36; "Topic 4 References"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Topic 5 Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Setup"."Topic Code" where("Paper Code" = field("Paper Code"));

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                // PaperTopicArea.RESET;
                // PaperTopicArea.SETRANGE(Code,"Topic 5 Code");
                // IF PaperTopicArea.FINDFIRST THEN BEGIN
                //  "Topic 5 Name":=PaperTopicArea.Description;
                // END;
                // IF Rec."Topic 5 Code"<>'' THEN BEGIN
                // SetterHeader.RESET;
                // SetterHeader.SETRANGE("Document No.","Document No.");
                // SetterHeader.SETRANGE("Document Type",SetterHeader."Document Type"::"Setter Specification");
                // IF SetterHeader.FINDFIRST THEN BEGIN
                //  SetterTopics.RESET;
                //  SetterTopics.SETRANGE("Document No.","Document No.");
                //  SetterTopics.SETRANGE("Topic Code","Topic 5 Code");
                //  IF NOT SetterTopics.FINDSET THEN BEGIN
                //    SetterTopics2.INIT;
                //    SetterTopics2."Document No.":="Document No.";
                //    SetterTopics3.RESET;
                //    IF SetterTopics3.FINDLAST THEN
                //    SetterTopics2."Line No.":=SetterTopics3."Line No."+1;;
                //    SetterTopics2."Topic Code":="Topic 5 Code";
                //    SetterTopics2."Topic Name":=PaperTopicArea.Description;
                //    SetterTopics2.INSERT(TRUE);
                //
                //    END;
                //
                // END;
                // END;
            end;
        }
        field(38; "Topic 5 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39; "Topic 5 References"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(40; Set; Boolean)
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
        field(41; "Setting Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(42; Solution; Boolean)
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
        field(43; "Solution Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(44; "Total Amount"; Decimal)
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
        PaperTopicArea: Record "Paper Topic Area";
        Papers: Record Papers;
        Courses: Record Courses;
}
