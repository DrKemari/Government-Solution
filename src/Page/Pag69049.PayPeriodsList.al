#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69049 "Pay Periods List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Payroll PeriodX";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("New Fiscal Year"; Rec."New Fiscal Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Fiscal Year field.';
                }
                field("Pay Date"; Rec."Pay Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Job Book Lock Date"; Rec."Job Book Lock Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Book Lock Date field.';
                }
                field("Job Book Locked?"; Rec."Job Book Locked?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Book Locked? field.';
                }
                field("Job Book Start Date"; Rec."Job Book Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Book Start Date field.';
                }
                field("Job Book End Date"; Rec."Job Book End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Book End Date field.';
                }
                field("Close Pay"; Rec."Close Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Close Pay field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000014; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000015; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Payroll Costs Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Costs Analysis';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Payroll Costs Analysis action.';
                    trigger OnAction()
                    begin

                        // PayrollCost.GetDateFilters(Rec."Starting Date", CalcDate('-1M', Rec."Starting Date"));
                        //  PayrollCost.Run;
                    end;
                }
            }
        }
    }

    var
    //  ClosingFunction: Report "Close Pay period";
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    // PayrollCost: Report "Payroll Cost Analysis";
}

#pragma implicitwith restore

