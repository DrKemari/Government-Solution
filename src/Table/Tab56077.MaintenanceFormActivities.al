#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56077 "Maintenance Form Activities"
{
    DrillDownPageID = "ICT Maintenance Activities";
    LookupPageID = "ICT Maintenance Activities";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Maintenance Activities".Code where ("Document No"=field("Maintenance Schedule"),
                                                                 "Maintenance Code"=field("Maintenance Area"));

            trigger OnValidate()
            begin
                MaintenanceActivities.Reset;
                MaintenanceActivities.SetRange("Document No","Maintenance Schedule");
                MaintenanceActivities.SetRange("Maintenance Code","Maintenance Area");
                MaintenanceActivities.SetRange(Code,Code);
                if MaintenanceActivities.FindSet then
                  Activity:=MaintenanceActivities.Activity;
                Type:=MaintenanceActivities.Type;
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
        field(5;"Maintenance Area";Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // ICTMaintenanceAreas.RESET;
                // ICTMaintenanceAreas.SETRANGE(Code,"Maintenance Area");
                // IF ICTMaintenanceAreas.FINDSET THEN
                //  Description:=ICTMaintenanceAreas.Description;
                // "Inventory Category":=ICTMaintenanceAreas."Inventory  Category";
            end;
        }
        field(6;"ICT Inventory No.";Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // ICTMaintenanceInventory.RESET;
                // ICTMaintenanceInventory.SETRANGE("Document No","Maintenance Schedule");
                // ICTMaintenanceInventory.SETRANGE("Mainatenance Code","Maintenance Area");
                // ICTMaintenanceInventory.SETRANGE("ICT Inventory","ICT Inventory No.");
                // IF ICTMaintenanceInventory.FINDSET THEN
                //  Description:=ICTMaintenanceInventory.Description;
                // "Inventory Category":=ICTMaintenanceInventory."ICT Category";
                // ICTMaintenanceSchedule.RESET;
                // ICTMaintenanceSchedule.SETRANGE(Code,"Maintenance Schedule");
                // IF ICTMaintenanceSchedule.FINDSET THEN
                //  "Year Code":=ICTMaintenanceSchedule."Year Code";
                // ICTInventory.RESET;
                // ICTInventory.SETRANGE(Code,"ICT Inventory No.");
                // IF ICTInventory.FINDSET THEN
                //  Brand:=ICTInventory.Brand;
                // "Serial No.":=ICTInventory."Serial No.";
                // "Tag No":=ICTInventory."Tag No";
            end;
        }
        field(7;"Maintenance Schedule";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Done,Not Done,Pending';
            OptionMembers = Done,"Not Done",Pending;
        }
        field(9;Comments;Text[500])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Maintenance Area","ICT Inventory No.","Maintenance Schedule","Code")
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
        MaintenanceActivities: Record "Maintenance Activities";
}

