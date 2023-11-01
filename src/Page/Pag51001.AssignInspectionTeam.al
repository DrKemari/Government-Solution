#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51001 "Assign Inspection Team"
{
    PageType = List;
    SourceTable = "Goods & Services Inspection";
    SourceTableView = sorting("No.", "User ID")
                      order(ascending)
                      where(Decision = filter(" "));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Shipment No. field.';
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Invoice No. field.';
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

