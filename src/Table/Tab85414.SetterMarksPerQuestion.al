#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85414 "Setter Marks Per Question"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Question No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Setter Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Setter Code");
                if Resource.FindFirst then begin
                    "Setter Name" := Resource.Name;
                end
            end;
        }
        field(6; "Setter Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Marks Awarded"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Contributed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Application and Analysis"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Evaluation and Creativity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Comments; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Action Taken"; Text[250])
        {
            DataClassification = ToBeClassified;
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
        field(27; "Paper Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
                // Papers.RESET;
                // Papers.SETRANGE(Code,"Paper Code");
                // IF Papers.FINDFIRST THEN BEGIN
                //  "Paper Name":=Papers.Description;
                // END
            end;
        }
        field(28; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(30; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level;
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
        field(40; References; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Knowledge and Comprehension"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(43; "Topic Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Setup"."Topic Code" where("Paper Code" = field("Paper Code"));

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                // PaperTopicArea.RESET;
                // PaperTopicArea.SETRANGE(Code,"Topic Code");
                // IF PaperTopicArea.FINDFIRST THEN BEGIN
                //  "Topic Name":=PaperTopicArea.Description;
                // END;
                //
                // IF Rec."Topic Code"<>'' THEN BEGIN
                // SetterHeader.RESET;
                // SetterHeader.SETRANGE("Document No.","Document No.");
                // SetterHeader.SETRANGE("Document Type",SetterHeader."Document Type"::"Setter Specification");
                // IF SetterHeader.FINDFIRST THEN BEGIN
                //  SetterTopics.RESET;
                //  SetterTopics.SETRANGE("Document No.","Document No.");
                //  SetterTopics.SETRANGE("Topic Code","Topic Code");
                //  IF NOT SetterTopics.FINDSET THEN BEGIN
                //    SetterTopics2.INIT;
                //    SetterTopics2."Document No.":="Document No.";
                //    SetterTopics3.RESET;
                //    IF SetterTopics3.FINDLAST THEN
                //    SetterTopics2."Line No.":=SetterTopics3."Line No."+1;;
                //    SetterTopics2."Topic Code":="Topic Code";
                //    SetterTopics2."Topic Name":=PaperTopicArea.Description;
                //    SetterTopics2.INSERT(TRUE);
                //
                //    END;
                //
                // END;
                // END;
                // IF xRec<>'' THEN BEGIN
                //  SetterTopi.RESET;
                //  SetterTopi.SETRANGE("Document No.","Document No.");
                //  SetterTopi.SETRANGE()
                //
                //
                // END;
            end;
        }
        field(44; "Topic Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(45; Remarks; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(46; Contribution; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
