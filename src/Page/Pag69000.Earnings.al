#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69000 "Earnings"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = EarningsX;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Show on Master Roll"; Rec."Show on Master Roll")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on Master Roll field.';
                }
                field("Basic Pay Arrears"; Rec."Basic Pay Arrears")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay Arrears field.';
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Salary Code field.';
                }
                field("KRA Classification"; Rec."KRA Classification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KRA Classification field.';
                }
                field("Responsibility Allowance Code"; Rec."Responsibility Allowance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Allowance Code field.';
                }
                field("Commuter Allowance Code"; Rec."Commuter Allowance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commuter Allowance Code field.';
                }
                field("House Allowance Code"; Rec."House Allowance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the House Allowance Code field.';
                }
                field("Earning Type"; Rec."Earning Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Earning Type field.';
                }
                field("Fluctuation Type"; Rec."Fluctuation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fluctuation Type field.';
                }
                field("Applies to All"; Rec."Applies to All")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies to All field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Block field.';
                }
                field("Pay Type"; Rec."Pay Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Type field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Calculation Method"; Rec."Calculation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calculation Method field.';
                }
                field("Flat Amount"; Rec."Flat Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Flat Amount field.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
                field("Percentage Employer"; Rec."Percentage Employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage Employer field.';
                }
                field("Calculate Excess Pension"; Rec."Calculate Excess Pension")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calculate Excess Pension field.';
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable field.';
                }
                field("Reduces Tax"; Rec."Reduces Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reduces Tax field.';
                }
                field("Non-Cash Benefit"; Rec."Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non-Cash Benefit field.';
                }
                field("Low Interest Benefit"; Rec."Low Interest Benefit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Low Interest Benefit field.';
                }
                field("Minimum Limit"; Rec."Minimum Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Limit field.';
                }
                field("Maximum Limit"; Rec."Maximum Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Limit field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Show Balance"; Rec."Show Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show Balance field.';
                }
                field("Show on Report"; Rec."Show on Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on Report field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000036; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000037; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000038; Links)
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

