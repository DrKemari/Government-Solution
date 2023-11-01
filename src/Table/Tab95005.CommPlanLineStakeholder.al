#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95005 "Comm Plan Line Stakeholder"
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
        field(5;"Stakeholder ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No",Category,"Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

