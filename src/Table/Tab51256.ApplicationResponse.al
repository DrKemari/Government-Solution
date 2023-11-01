#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51256 "Application Response"
{

    fields
    {
        field(1;"Application No.";Code[350])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Accreditation Question";Text[350])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Accreditation Questions".Description;

            trigger OnValidate()
            var
                AccreditationAnswers: Record "Accreditation Answers";
            begin
            end;
        }
        field(3;"Question Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Option Text,Text,Attachment';
            OptionMembers = "Option Text",Text,Attachment;
        }
        field(4;"Accreditation Answers";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Accreditation Answers" where (Category=field("Question Type"));

            trigger OnValidate()
            var
                AccreditationAnswers: Record "Accreditation Answers";
            begin
                AccreditationAnswers.Reset;
                AccreditationAnswers.SetRange(Code,"Accreditation Answers");
                if AccreditationAnswers.FindSet then begin
                Response:=AccreditationAnswers.Response;
                end
            end;
        }
        field(5;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;Response;Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Description;Text[350])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Question Code";Code[350])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Accreditation Questions";

            trigger OnValidate()
            begin
                AccreditationQuestions.Reset;
                AccreditationQuestions.SetRange(Code,"Question Code");
                if AccreditationQuestions.FindFirst then begin
                  "Accreditation Question":=AccreditationQuestions.Description;
                  "Question Type":=AccreditationQuestions."Question Type";
                  "Chapter Code":=AccreditationQuestions."Chapter Code";
                end
            end;
        }
        field(9;"Chapter Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AccreditationQuestions: Record "Accreditation Questions";
}

