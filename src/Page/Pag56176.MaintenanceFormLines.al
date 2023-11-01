#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56176 "Maintenance Form Lines"
{
    PageType = ListPart;
    SourceTable = "Maintenance Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Maintenance Area"; Rec."Maintenance Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Area field.';
                }
                field("ICT Inventory No."; Rec."ICT Inventory No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Inventory No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Maintenance Period"; Rec."Maintenance Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Period field.';
                }
                field(Period; Rec.Period)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period field.';
                }
                field("Period Date"; Rec."Period Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Date field.';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Type field.';
                }
                field("Inventory Category"; Rec."Inventory Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Inventory Category field.';
                }
                field("ICT Sub Category"; Rec."ICT Sub Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ICT Sub Category field.';
                }
                field(Brand; Rec.Brand)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Brand field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Tag No"; Rec."Tag No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Tag No field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Maintenance Action")
            {
                ApplicationArea = Basic;
                Image = ItemTrackingLines;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Maintenance Form Activities";
                RunPageLink = "Document No" = field("Document No"),
                              "Maintenance Area" = field("Maintenance Area"),
                              "ICT Inventory No." = field("ICT Inventory No."),
                              "Maintenance Schedule" = field("Maintenance Schedule");
                ToolTip = 'Executes the Maintenance Action action.';
            }
        }
    }
}

#pragma implicitwith restore

