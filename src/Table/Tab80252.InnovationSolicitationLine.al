#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80252 "Innovation Solicitation Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Innovation Invitation,Idea Response';
            OptionMembers = "Innovation Invitation","Idea Response";
        }
        field(2;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Solicitation"."Document No" where ("Document Type"=field("Document Type"));
        }
        field(3;"Record Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Overview,Objective,"Additional Notes";
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Record Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

