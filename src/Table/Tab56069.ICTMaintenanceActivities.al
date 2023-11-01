#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56069 "ICT Maintenance Activities"
{
    DrillDownPageID = "ICT Maintenance Activities";
    LookupPageID = "ICT Maintenance Activities";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Activity;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preventive,Corrective';
            OptionMembers = Preventive,Corrective;
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
        fieldgroup(DropDown;"Code",Activity)
        {
        }
    }
}

