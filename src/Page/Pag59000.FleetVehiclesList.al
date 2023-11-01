#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59000 "Fleet Vehicles List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Vehicle Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Fleet Vehicles.";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fixed Asset List-flt";
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Passenger Capacity"; Rec."Passenger Capacity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passenger Capacity field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Operation Setups";
                    LookupPageID = "Operation Setups";
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Vehicle Model List";
                    LookupPageID = "Vehicle Model List";
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Chassis Serial No."; Rec."Chassis Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chassis Serial No. field.';
                }
                field("Engine Serial No."; Rec."Engine Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engine Serial No. field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

