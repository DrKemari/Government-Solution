#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95004 "Comm Plan Meeting Schedule"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional,Project';
            OptionMembers = " ",Corporate,Functional,Project;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Category;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Meeting,Status Report';
            OptionMembers = " ",Meeting,"Status Report";
        }
        field(4;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Meeting ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Communication Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Frequency;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,None,Once,Weekly,Monthly,Quarterly,Half-Yearly,Yearly';
            OptionMembers = " ","None",Once,Weekly,Monthly,Quarterly,"Half-Yearly",Yearly;
        }
        field(9;"Meeting Medium";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Face to Face,Online';
            OptionMembers = " ","Face to Face",Online;
        }
        field(10;"Primary Owner";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Planned Meeting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No",Category,"Meeting ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

