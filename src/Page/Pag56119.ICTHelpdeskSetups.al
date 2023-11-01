#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56119 "ICT Helpdesk Setups"
{
    ApplicationArea = Basic;
    CardPageID = "ICT Helpdesk Setup Card";
    PageType = Card;
    SourceTable = "ICT Helpdesk Global Parameters";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General Details';
                field("User Feedback Duration"; Rec."User Feedback Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Feedback Duration field.';
                }
                field("Assigned Issue Duration"; Rec."Assigned Issue Duration")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Assigned Issue Duration field.';
                }
                field("ICT Email"; Rec."ICT Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Email field.';
                }
                field(Delegate; Rec.Delegate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delegate field.';
                }
            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("ICT Issuance Voucher Nos."; Rec."ICT Issuance Voucher Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Issuance Voucher Nos. field.';
                }
                field("ICT Maintenance Schedule Nos."; Rec."ICT Maintenance Schedule Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Maintenance Schedule Nos. field.';
                }
                field("ICT Inventory Nos"; Rec."ICT Inventory Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Inventory Nos field.';
                }
                field("Project Meeting Register Nos"; Rec."Project Meeting Register Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Meeting Register Nos field.';
                }
                field("ICT Project Nos"; Rec."ICT Project Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Project Nos field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

