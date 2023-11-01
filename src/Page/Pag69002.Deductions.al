#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69002 "Deductions"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = DeductionsX;
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
                field(Statutory; Rec.Statutory)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Statutory field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Tax deductible"; Rec."Tax deductible")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax deductible field.';
                }
                field("Balance Type"; Rec."Balance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance Type field.';
                }
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Code field.';
                }
                field("PAYE Code"; Rec."PAYE Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PAYE Code field.';
                }
                field("Applies to All"; Rec."Applies to All")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies to All field.';
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Block field.';
                }
                field("Pension Scheme"; Rec."Pension Scheme")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Scheme field.';
                }
                field("Pension Limit Percentage"; Rec."Pension Limit Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Limit Percentage field.';
                }
                field("Pension Limit Amount"; Rec."Pension Limit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Limit Amount field.';
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
                field("Voluntary Percentage"; Rec."Voluntary Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Voluntary Percentage field.';
                }
                field("Show on Master Roll"; Rec."Show on Master Roll")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on Master Roll field.';
                }
                field("Show on Payslip Information"; Rec."Show on Payslip Information")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on Payslip Information field.';
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
                field("Flat Amount Employer"; Rec."Flat Amount Employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Flat Amount Employer field.';
                }
                field("Maximum Amount"; Rec."Maximum Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Amount field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Total Amount Employer"; Rec."Total Amount Employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount Employer field.';
                }
                field("Show Balance"; Rec."Show Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show Balance field.';
                }
                field("Deduction Table"; Rec."Deduction Table")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deduction Table field.';
                }
                field("Show on report"; Rec."Show on report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on report field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000034; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000035; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000036; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        Rec.TestField("Total Amount", 0);
    end;
}

#pragma implicitwith restore

