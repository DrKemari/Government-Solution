#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51273 "Application Sub-Ques Response"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Question Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Accreditation Questions";

            trigger OnValidate()
            var
                AccreditationAnswers: Record "Accreditation Answers";
            begin
            end;
        }
        field(3;"Subquestion Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application SubQuestion" where ("Question Code"=field("Question Code"));

            trigger OnValidate()
            begin
                ApplicationSubQuestion.Reset;
                ApplicationSubQuestion.SetRange(Code,"Subquestion Code");
                if ApplicationSubQuestion.FindFirst then begin
                 Description:=ApplicationSubQuestion.Description;
                  "Question Type":=ApplicationSubQuestion."Question Type";
                  end;
            end;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                AccreditationAnswers: Record "Accreditation Answers";
            begin
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
        field(7;"Question Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Option Text,Text,Attachment';
            OptionMembers = "Option Text",Text,Attachment;
        }
        field(8;"Accreditation Answers";Code[30])
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
    }

    keys
    {
        key(Key1;"Application No.","Entry No","Question Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ApplicationSubQuestion: Record "Application SubQuestion";
        AccreditationAnswers: Record "Accreditation Answers";
        AccreditationQuestions: Record "Accreditation Questions";
}

