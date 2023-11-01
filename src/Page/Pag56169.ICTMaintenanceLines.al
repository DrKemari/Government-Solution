#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56169 "ICT Maintenance Lines"
{
    PageType = ListPart;
    SourceTable = "ICT Maintenance Lines";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Inventory Category"; Rec."Inventory Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inventory Category field.';
                }
                field("No. of Planned Periods"; Rec."No. of Planned Periods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planned Periods field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Maintenance Periods")
            {
                ApplicationArea = Basic;
                Image = PeriodEntries;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Maintenance Periods";
                RunPageLink = "Document No" = field("Document No"),
                              "Maintenance Code" = field("Maintenance Area");
                ToolTip = 'Executes the Maintenance Periods action.';
            }
            action("Maintenance Activities")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Maintenance Activities";
                RunPageLink = "Document No" = field("Document No"),
                              "Maintenance Code" = field("Maintenance Area");
                ToolTip = 'Executes the Maintenance Activities action.';
            }
            action("ICT Inventory")
            {
                ApplicationArea = Basic;
                Image = FixedAssetLedger;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "ICT Maintenance Inventory";
                RunPageLink = "Document No" = field("Document No"),
                              "Mainatenance Code" = field("Maintenance Area");
                ToolTip = 'Executes the ICT Inventory action.';
            }
        }
    }
}

#pragma implicitwith restore

