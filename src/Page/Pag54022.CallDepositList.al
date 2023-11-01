#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54022 "Call Deposit List"
{
    ApplicationArea = Basic;
    CardPageID = "Call Deposit Card";
    Editable = false;
    PageType = List;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type" = const("Money Market"),
                            "Investment Type" = const('04'),
                            "Deposit Type" = const(Call));
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
                field("FDR Number"; Rec."FDR Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FDR Number field.';
                }
                field("Investment Type"; Rec."Investment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Type field.';
                }
                field("Deposit Type"; Rec."Deposit Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deposit Type field.';
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

