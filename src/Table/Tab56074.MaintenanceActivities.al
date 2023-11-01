#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56074 "Maintenance Activities"
{

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Maintenance Activities".Code;

            trigger OnValidate()
            begin
                ICTMaintenanceActivities.Reset;
                ICTMaintenanceActivities.SetRange(Code,Code);
                if ICTMaintenanceActivities.FindSet then
                  Activity:=ICTMaintenanceActivities.Activity;
                Type:=ICTMaintenanceActivities.Type;
            end;
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
        field(4;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Maintenance Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Document No","Maintenance Code")
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

    var
        ICTMaintenanceActivities: Record "ICT Maintenance Activities";
}

