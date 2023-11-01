Page 50200 "PR Header Salary Card - ALL"
{
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Employee";

    layout
    {
        area(content)
        {
            group(EmployeeDetails)
            {
                Caption = 'Employee Details';
                Editable = false;
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Full Name"; "FullName")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

                field(IDNumber; "ID Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NSSFNo; "NSSF No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NHIFNo; "NHIF No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PIN No."; "P.I.N")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ContractType; "Contract Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PayrollPostingGroup"; "Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeType; "Employee Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("On Probation"; "On Probation")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
            }
            part(PaymentInfo; "PR Salary Information")
            {
                Caption = 'Payment Information';
                ShowFilter = true;
                ApplicationArea = All;
                SubPageLink = "Employee Code" = field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Transactions)
            {
                Caption = 'Employee Transactions';
                action(AssignEarningDeductions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Assign Earning/Deductions';
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "PR Employee Transactions";
                    RunPageLink = "Employee Code" = field("No.");
                }
                action(TransHistory)
                {
                    ApplicationArea = Basic;
                    Caption = 'Transactions History';
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "PR Employee Transactions Hist.";
                    RunPageLink = "Employee Code" = field("No.");
                }

            }
        }
        area(processing)
        {
            action(ViewPayslip)
            {
                ApplicationArea = Basic;
                Caption = 'View Payslip';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    PRSalARYCard.SetRange("Employee Code", "No.");
                    PRSalARYCard.SetRange(PRSalARYCard."Period Filter", SelectedPeriod);
                    Report.Run(Report::"PR Individual Payslip", true, false, PRSalARYCard);
                end;
            }
            action(PREmployeePayslip)
            {
                Caption = 'PR Employee Payslip';
                Image = Accounts;
                ApplicationArea = Basic, Suite;
                trigger OnAction()
                var
                    PRPeriodTrans: Record "PR Period Transactions";
                begin
                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    PRPeriodTrans.Reset();
                    PRPeriodTrans.SetRange("Employee Code", "No.");
                    PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", SelectedPeriod);
                    Report.Run(Report::"PR Employee Payslip", true, false, PRPeriodTrans);
                end;
            }
        }
    }

    trigger OnInit()
    begin

        ObjPeriod.Reset;
        ObjPeriod.SetRange(ObjPeriod.Closed, false);
        if ObjPeriod.FindFirst() then begin
            SelectedPeriod := ObjPeriod."Date Opened";
            PeriodName := ObjPeriod."Period Name";
            PeriodMonth := ObjPeriod."Period Month";
            PeriodYear := ObjPeriod."Period Year";
        end;
    end;

    var
        // objEmp: Record UnknownRecord70134812;
        SalCard: Record "PR Salary Card";
        PRPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit "PR Payroll Processing";
        HrEmployee: Record "Employee";
        ProgressWindow: Dialog;
        HREmpPR: Record "Employee";
        ObjPeriod: Record "PR Payroll Periods";
        PRSalARYCard: Record "PR Salary Card";
}

