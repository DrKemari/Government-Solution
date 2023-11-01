#pragma implicitwith disable
page 81005 "Loan Repayment Schedules"
{
    ApplicationArea = All;
    Caption = 'Loan Repayment Schedule';
    PageType = List;
    SourceTable = "Loan Repayment Schedules";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                    ApplicationArea = All;
                }
                field("Loan No"; Rec."Loan No")
                {
                    ToolTip = 'Specifies the value of the Loan No field.';
                    ApplicationArea = All;
                }

                field("Instalment No"; Rec."Instalment No")
                {
                    ApplicationArea = all;
                }
                field("Repayment Date"; Rec."Repayment Date")
                {
                    ApplicationArea = All;
                    Caption = 'Due Date';
                }



                // field("Employee Name"; Rec."Employee Name")
                // {
                //     ToolTip = 'Specifies the value of the Employee Name field.';
                //     ApplicationArea = All;
                // }
                // field("Loan Amount"; Rec."Loan Amount")
                // {
                //     ToolTip = 'Specifies the value of the Loan Amount field.';
                //     ApplicationArea = All;
                // }

                field("Principal Repayment"; Rec."Principal Repayment")
                {
                    ApplicationArea = all;
                }
                field("Monthly Interest"; Rec."Monthly Interest")
                {
                    ToolTip = 'Specifies the value of the Monthly Interest field.';
                    ApplicationArea = All;
                }

                field("Loan Balance";Rec."Loan Balance")
                {
                    ApplicationArea = all;
                }

                field("Monthly Repayment"; Rec."Monthly Repayment")
                {
                    ToolTip = 'Specifies the value of the Monthly Repayment field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}

#pragma implicitwith restore
