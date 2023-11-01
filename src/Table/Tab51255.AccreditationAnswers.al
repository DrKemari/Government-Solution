#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51255 "Accreditation Answers"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Category;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Option Text,Text,Attachment';
            OptionMembers = "Option Text",Text,Attachment;
        }
        field(3;Response;Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Code",Response)
        {
        }
    }
}

