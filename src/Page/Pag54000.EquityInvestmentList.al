#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54000 "Equity Investment List"
{
    ApplicationArea = Basic;
    CardPageID = "Equity Card";
    Editable = false;
    PageType = List;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type" = const(Equity),
                            UnitTrust = const(false),
                            Offshore = const(false));
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Custodian Code field.';
                }
                field("Investment Type"; Rec."Investment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Type field.';
                }
                field("No.Of Units"; Rec."No.Of Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No.Of Units field.';
                }
                field("Acquisition Cost"; Rec."Acquisition Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acquisition Cost field.';
                }
                field("Current Value"; Rec."Current Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Value field.';
                }
                field("Dividend Receivable"; Rec."Dividend Receivable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dividend Receivable field.';
                }
                field("Revaluations (FCY)"; Rec."Revaluations (FCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revaluations (FCY) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

