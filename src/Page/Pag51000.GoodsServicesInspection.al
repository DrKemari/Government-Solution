#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51000 "Goods & Services Inspection"
{
    ApplicationArea = Basic;
    Caption = 'Goods & Services Inspection';
    Editable = false;
    PageType = List;
    SourceTable = "Goods & Services Inspection";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Shipment No.';
                    ToolTip = 'Specifies the value of the Vendor Shipment No. field.';
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Invoice No. field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Committee Role"; Rec."Committee Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Role field.';
                }
                field(Decision; Rec.Decision)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Decision field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Buy-from Vendor No. field.';
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Buy-from Vendor Name field.';
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date-Time Sent for Approval field.';
                }
                field("Assigned By"; Rec."Assigned By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned By field.';
                }
                field("Assignment Date-Time"; Rec."Assignment Date-Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assignment Date field.';
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000010; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000011; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

