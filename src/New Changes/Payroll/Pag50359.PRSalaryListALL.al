Page 50202 "PR Salary List (ALL)"
{
    CardPageID = "PR Header Salary Card - ALL";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions';
    SourceTable = "Employee";
    SourceTableView = where(Status = filter(Active));
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTextExp;
                }

                field("Old Staff No."; "No.")
                {
                    ApplicationArea = ALL;

                }
                field(FullName; Rec.FullName())
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTextExp;
                }

                field(Grade; "Current Job Grade")
                {
                    ApplicationArea = all;
                }

                // field("Date of First Appointment"; "Date of First Appointment")
                // {
                //     ApplicationArea = ALL;
                // }
                field("Salary Incremental Month"; Rec."Incremental Month")
                {
                    ApplicationArea = all;
                }
                // field("From IPPD"; "From IPPD")
                // {
                //     ApplicationArea = all;
                // }


                field("User ID"; "User ID")
                {
                    ApplicationArea = all;
                }
                field(PostingGroup; "Posting Group")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTextExp;
                }

                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTextExp;
                }
            }
        }

    }

    actions
    {
        area(navigation)
        {
            group(Transactions)
            {
                action(AssignEarningDeductions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Assign Earning/Deductions';
                    Image = AssessFinanceCharges;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "PR Employee Transactions";
                    RunPageLink = "Employee Code" = field("No.");
                }
                action(UpdateStaffAdvance)
                {
                    ApplicationArea = Basic;
                    Caption = 'Update Salary Advance';
                    Image = AssessFinanceCharges;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Report "Update Salary Advance";

                }
            }
        }
        area(processing)
        {
            action(ViewPayslip)
            {
                ApplicationArea = Basic;
                Caption = 'View Payslip';
                Image = Report;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PRPeriodTrans: Record "PR Period Transactions";
                    PRSalaryCard: Record "PR Salary Card";
                begin
                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    //Display payslip report
                    PRSalaryCard.SetRange("Employee Code", "No.");
                    PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);
                    Report.Run(Report::"PR Individual Payslip", true, false, PRSalaryCard);


                    // //Display payslip report
                    // PRPeriodTrans.SetRange("Employee Code", "No.");
                    // PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", SelectedPeriod);
                    // Report.Run(Report::"PR Employee Payslip", true, false, PRPeriodTrans);
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
            action(ProcessPayroll)
            {
                ApplicationArea = Basic;
                Caption = 'Process Payroll';
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var

                begin
                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;



                    //Mark Employee as in In Active if Curr Period Opened is > than Date of Separtion
                    //fn_AutoDeactivateStaff;

                    //Ensure all the Transaction Codes marked as Mandatory have been assigned to All Employees
                    fn_EnsureMandatoryTransCodesAssignedToAllStaff(SelectedPeriod);
                    ProcessPayroll.fnClearCurrentPeriod(SelectedPeriod, SelectedPeriod, '');
                    if PRSalaryCard.Get("No.") then begin
                        Clear("Employee");
                        "Employee".reset;
                        "Employee".setrange(Status, Status::Active);
                        if "Employee".Find('-') then begin
                            ProgressWindow.Open('Processing Salary #1#################################################################');
                            repeat
                                "Employee".TestField("Employee"."Posting Group");

                                ProgressWindow.Update(1, "Employee"."No." + ':' + "Employee"."FullName");
                                if PRSalaryCard.Get("Employee"."No.") then begin
                                    ProcessPayroll.fnProcesspayroll("Employee"."No.", "Employee"."Date Of Join"
                                    , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                    , SelectedPeriod, SelectedPeriod, '', '', "Employee"."Date Of Leaving", true,
                                    "Employee"."Global Dimension 2 Code", PRSalaryCard."Insurance Certificate?");



                                end else begin
                                    //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                end;
                            until "Employee".Next = 0;
                            ProgressWindow.Close;
                        end;



                        //CODEUNIT
                        Commit();
                        if Confirm('Processing complete. Run the Company Payslip Report for %1', true, PRPeriod."Period Name") = true then
                          //  Report.Run(Report::prPeriodTran, true, false);
                        Report.Run(Report::"PR Company Payslip Summary", true, false);
                    end;
                end;
            }
            action(ProcessCurrent)
            {
                ApplicationArea = Basic;
                Caption = 'Process Current';
                Image = Period;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Text000: label '@1@@@@@@@@@@@@@@@@@@@@@';
                begin

                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    //Mark Employee as in In Active if Curr Period Opened is > than Date of Separtion
                    //fn_AutoDeactivateStaff;
                    //Mark Employee as in InActive if Curr Period Opened is > than Date of Separtion

                    if PRSalaryCard.Get("No.") then begin
                        Clear("Employee");
                        ProcessPayroll.fnClearCurrentPeriod(SelectedPeriod, SelectedPeriod, "No.");
                        "Employee".SetRange("Employee".Status, "Employee".Status::Active);
                        "Employee".SetRange("Employee"."No.", "No.");
                        if "Employee".FindFirst() then begin
                            ProgressWindow.Open('Processing Salary #1############################################');
                            repeat
                                ProgressWindow.Update(1, "Employee"."No." + ':' + "Employee"."FullName");
                                if PRSalaryCard.Get("Employee"."No.") then begin
                                    ProcessPayroll.fnProcesspayroll("Employee"."No.", "Employee"."Employment Date"
                                    , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                    , SelectedPeriod, SelectedPeriod, '', '', "Employee"."Date Of Leaving", true,
                                    "Employee"."Global Dimension 1 Code", PRSalaryCard."Insurance Certificate?");
                                end else begin
                                    //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                end;

                            until "Employee".Next = 0;
                            ProgressWindow.Close;
                        end;

                        Commit();
                        PRSalaryCard.SetRange("Employee Code", "No.");
                        PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);
                        Report.Run(Report::"PR Individual Payslip", true, false, PRSalaryCard);

                    end;
                end;
            }
            action(ProcessCurrent2)
            {
                ApplicationArea = Basic;
                Caption = 'Process Current Group';
                Image = Period;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Text000: label '@1@@@@@@@@@@@@@@@@@@@@@';
                    EmpRec: Record "Employee";
                begin

                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    //Mark Employee as in In Active if Curr Period Opened is > than Date of Separtion
                    //fn_AutoDeactivateStaff;
                    //Mark Employee as in InActive if Curr Period Opened is > than Date of Separtion

                    if PRSalaryCard.Get("No.") then begin
                        Clear("Employee");
                        EmpRec.get("No.");

                        "Employee".SetRange("Employee".Status, "Employee".Status::Active);
                        "Employee".SetRange("Employee"."Posting Group", EmpRec."Posting Group");
                        if "Employee".FindFirst() then begin
                            ProgressWindow.Open('Processing ' + EmpRec."Posting Group" + ' Salary #1############################################');
                            repeat
                                ProcessPayroll.fnClearCurrentPeriod(SelectedPeriod, SelectedPeriod, "Employee"."No.");
                                ProgressWindow.Update(1, "Employee"."No." + ':' + "Employee"."FullName");
                                if PRSalaryCard.Get("Employee"."No.") then begin
                                    ProcessPayroll.fnProcesspayroll("Employee"."No.", "Employee"."Employment Date"
                                    , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                    , SelectedPeriod, SelectedPeriod, '', '', "Employee"."Date Of Leaving", true,
                                    "Employee"."Global Dimension 1 Code", PRSalaryCard."Insurance Certificate?");
                                end else begin
                                    //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                end;

                            until "Employee".Next = 0;
                            ProgressWindow.Close;
                        end;

                        Commit();
                        PRSalaryCard.SetRange("Employee Code", "No.");
                        PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);
                        Report.Run(Report::"PR Individual Payslip", true, false, PRSalaryCard);

                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if Format(Status) = 'Active' then StyleTextExp := 'None' else StyleTextExp := 'Attention';
    end;


    var
        Text000: label 'ROUND(%1, %2, %3) returns %4';
        PRSalaryCard: Record "PR Salary Card";
        PRPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit "PR Payroll Processing";
        "Employee": Record "Employee";
        ProgressWindow: Dialog;
        PREmployeeTrans: Record "PR Employee Transactions";
        HREmp: Record "Employee";
        i: Integer;
        PRPeriodT: Record "PR Period Transactions";
        PRTransCodes: Record "PR Transaction Codes";
        PrevPayrollPeriod: Date;
        LoanStatus: Option " ","Fully Paid","Partly Paid";
        LoanTransCode: Code[10];
        InterestTransCode: Code[10];
        PREmployeeTrans_2: Record "PR Employee Transactions";
        PREmployeeTrans_3: Record "PR Employee Transactions";
        PREmployeeTrans_4: Record "PR Employee Transactions";
        PRTransCodes_2: Record "PR Transaction Codes";
        LoanTransCode_2: Code[10];
        InterestTransCode_2: Code[10];
        ApprovalEntry: Record "Approval Entry";
        //HRCodeunit: Codeunit "HR Codeunit";
        Direction: Text;
        Precision: Decimal;
        Result: Decimal;
        DecimalToRound: Decimal;
        StyleTextExp: Text;
        //HRChangeLog: Record "HR Change Entries";
        HRBankSumm: Record "HR Bank Summary";
        HREmpBA: Record "HR Employee Bank Accounts";
        curr_MonthDateOfLeaving: Integer;
        curr_YearDateOfLeaving: Integer;

    procedure fnLastLineNo() LastLineNo: Integer
    var
      // HRChangeLog_2: Record "HR Change Entries";
    begin
       /*  HRChangeLog_2.Reset;
        if HRChangeLog_2.FindLast then begin
            LastLineNo := HRChangeLog_2."Line No";
        end else begin
            LastLineNo := 1;
        end; */
    end;


    local procedure fn_EnsureMandatoryTransCodesAssignedToAllStaff(CurrPayrollPeriod: Date)
    var
        PRTransCode_4: Record "PR Transaction Codes";
        PREmpTrans_4: Record "PR Employee Transactions";
        HREmp_4: Record "Employee";
    begin
        PRTransCode_4.Reset();
        PRTransCode_4.SetRange(Mandatory, true);
        if PRTransCode_4.FindSet(false, false) then begin
            repeat
                HREmp_4.Reset();
                HREmp_4.SetRange(Status, Status::Active);
                if HREmp_4.FindSet(false, false) then begin
                    repeat
                        PREmpTrans_4.SetRange("Payroll Period", CurrPayrollPeriod);
                        PREmpTrans_4.SetRange("Employee Code", HREmp_4."No.");
                        PREmpTrans_4.SetRange("Transaction Code", PRTransCode_4."Transaction Code");
                        if not PREmpTrans_4.FindFirst() then begin
                            Error('[ %1 ] has not been assigned to [ %2 ] during payroll period [ %3 ]',
                                 PRTransCode_4."Transaction Name", HREmp_4."FullName", CurrPayrollPeriod);
                        end ELSE begin
                            PREmpTrans_4.TestField(Amount);
                        end;
                    until HREmp_4.Next() = 0;
                end;

            until PRTransCode_4.Next() = 0;
        end;
    end;

    local procedure fn_AutoDeactivateStaff()
    var
        curr_MonthDate_Leaving: Integer;
        curr_YearDate_Leaving: Integer;
        curr_PayPeriod_Month: Integer;
        curr_PayPeriod_Year: Integer;
        PayrollPeriod30D: Date;
    begin
        //Mark Employee as in In Active if Curr Period Opened is > than Date of Separtion
        Clear(HREmp);
        HREmp.SetFilter(HREmp."Date Of Leaving", '<>%1', 0D);

        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
        if HREmp.FindFirst() then begin
            repeat
                //Don't Disable an Employee if he is exiting in the same Month and Same Year as the current Payroll Period
                curr_MonthDate_Leaving := Date2dmy(HREmp."Date Of Leaving", 2);
                curr_YearDate_Leaving := Date2dmy(HREmp."Date Of Leaving", 3);

                curr_PayPeriod_Month := Date2dmy(PRPeriod."Date Opened", 2);
                curr_PayPeriod_Year := Date2dmy(PRPeriod."Date Opened", 3);

                //1. Check if the year is the same
                if curr_PayPeriod_Year = curr_YearDate_Leaving then begin
                    //Check if Month of Leaving is Same as Current Period Month and Period Year
                    if curr_MonthDate_Leaving = curr_PayPeriod_Month then begin
                        //We dont remove him
                    end else begin
                        if HREmp."Date Of Leaving" < PRPeriod."Date Opened" then begin
                            HREmp.Status := HREmp.Status::InActive;
                            HREmp.Modify;

                          //  HRChangeLog.Init;

                            /*  HRChangeLog."Line No." := fnLastLineNo + 10;
                             HRChangeLog."Date Modified" := HREmp."Date Of Leaving the Company";
                             HRChangeLog."Modified by" := 'AUTO SYSTEM CHANGE';
                             HRChangeLog."No." := HREmp."No.";
                             HRChangeLog."Old Value" := '';
                             HRChangeLog."New Value" := Format(HREmp."Date Of Leaving the Company");
                             HRChangeLog."Field Changed" := 'Date Of Leaving the Company';
                             HRChangeLog."Payroll Period" := SelectedPeriod; */

                           // HRChangeLog.Insert;
                        end;
                    end;
                end else begin
                    if HREmp."Date Of Leaving" < PRPeriod."Date Opened" then begin
                        HREmp.Status := HREmp.Status::InActive;
                        HREmp.Modify;

                        // HRChangeLog.Init;

                        // HRChangeLog."Line No" := fnLastLineNo + 10;
                        // HRChangeLog."Change Date" := HREmp."Date Of Leaving";
                        // HRChangeLog.UserID := 'AUTO SYSTEM CHANGE';
                        // HRChangeLog."employee No" := HREmp."No.";
                        // HRChangeLog."Old Value" := '';
                        // HRChangeLog."New Value" := Format(HREmp."Date Of Leaving");
                        // //HRChangeLog."Reason for Change":=HREMP."Termination Grounds";
                        // HRChangeLog."Change Description" := 'Date Of Leaving the Company';
                        // // HRChangeLog.p := SelectedPeriod;

                        // HRChangeLog.Insert;
                    end;
                end;
            until HREmp.Next = 0;

        end;
        //Mark Employee as in InActive if Curr Period Opened is > than Date of Separtion
    end;

    trigger OnOpenPage()
    var
        PRPayrollRights: Record "PR Payroll Access Rights";
    begin
        PRPayrollRights.Reset();
        PRPayrollRights.SetRange("User ID", UserId());
        if PRPayrollRights.IsEmpty() then begin
            Error('You are not authorized to access this page. Please contact HR department');
        end;
    end;
}

