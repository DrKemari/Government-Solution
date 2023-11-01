#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51254 "Accreditation Questions"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[416])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Question Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Option Text,Text,Attachment,Table,Label';
            OptionMembers = "Option Text",Text,Attachment,"Table",Label;
        }
        field(4;"Question No.";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application Question Nos.";

            trigger OnValidate()
            begin
                ApplicationQuestionNos.Reset;
                ApplicationQuestionNos.SetRange(Code,"Question No.");
                if ApplicationQuestionNos.FindFirst then begin
                  "Chapter Code":=ApplicationQuestionNos.Chapter;
                  end
            end;
        }
        field(5;"Chapter Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code",Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ApplicationQuestionNos: Record "Application Question Nos.";
}

