page 51196 "HR PAYROLL ROLECENTRE"
{
    PageType = RoleCenter;
    Caption = 'Human Resource and Payroll Management RC';

    layout
    {
        area(rolecenter)
        {
            // part(Headline; "HR Headline")
            // {
            //     ApplicationArea = Basic, Suite;
            // }


            part("PR Payroll Activities Cue"; "PR Payroll Activities Cue")
            {
                Caption = 'PAYROLL ACTIVITIES';
                ApplicationArea = Basic, Suite;
            }
            part("HR Activities Cue"; "HR Activities Cue")
            {
                Caption = 'HUMAN RESOURCE ACTIVITIES';
                ApplicationArea = Basic, Suite;
            }
            // part("My Approval Entries"; "Requests to Approve")
            // {
            //     ApplicationArea = basic;
            //     Caption = 'My Approval Entries';
            // }

            part(Control46; "Team Member Activities No Msgs")
            {
                ApplicationArea = Suite;
            }


        }
    }

    actions
    {
        area(embedding)
        {

            action(PayrollPeriodAct)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Period Management';
                Image = Employee;
                RunObject = Page "PR Payroll Periods";
            }
        }

        area(processing)
        {
        }
        area(sections)
        {
            group(JobsManagement)
            {
                Caption = 'Jobs Management';
                Image = HumanResources;
                action("Jobs Management")
                {
                    ApplicationArea = Basic;
                    Caption = 'Jobs List';
                    Image = Employee;
                    RunObject = Page Positions;
                    ToolTip = 'List the Jobs.';
                }
                action("Jobs Grade")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Grades';
                    Image = Employee;
                    RunObject = Page "Job Grades";
                    ToolTip = 'List the Jobs.';
                }
                action("Salary Pointers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Salary Pointers';
                    Image = Employee;
                    RunObject = Page "Salary pointers";
                    ToolTip = 'List the Jobs.';
                }
            }

            group(PayrollGroup)
            {
                Caption = 'Payroll Management';
                Image = AdministrationSalesPurchases;

                action("Open Paychange Advice")
                {
                    Caption = 'Open Paychange Advice';
                    ApplicationArea = basic;
                    RunObject = Page "prPCA list";
                    RunPageView = WHERE(Status = FILTER(Open));
                }
                action("Pending Paychange Advice")
                {
                    Caption = 'Pending Paychange Advice';
                    ApplicationArea = basic;
                    RunObject = Page "prPCA list";
                    RunPageView = WHERE(Status = FILTER("Pending Approval"));
                }
                action("Approved Paychange Advice")
                {
                    Caption = 'Approved Paychange Advice';
                    ApplicationArea = basic;
                    RunObject = Page "prPCA list";
                    RunPageView = WHERE(Status = FILTER(Approved));
                }
                action(PRSalaryList)
                {
                    Caption = 'PR Salary List';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Salary List (ALL)";
                }
                action(PRPeriodTransactions)
                {
                    Caption = 'PR Period Transactions';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Period Transaction List";
                    RunPageMode = view;
                }


                action(PRPayrollTransactions)
                {
                    Caption = 'PR Transaction Codes';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Transaction Codes List";
                    RunPageMode = View;
                }

                action(PRPayrollThirdParty)
                {
                    Caption = 'PR Third Party Charges';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Third Party Charges";
                    RunPageMode = View;
                }
                action(PREmployeeTransactions)
                {
                    Caption = 'PR Employee Transactions';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Employee Transactions";
                    RunPageMode = View;
                }

                action(HRBankSummary)
                {
                    Caption = 'HR Bank Summary';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "HR Bank Summary";
                    RunPageMode = View;
                }


                action(PRPayrollBuffer)
                {
                    Caption = 'PR Payroll Buffer';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Payroll Buffer List";
                    RunPageMode = view;
                }


                action(PayrollJournal)
                {
                    ApplicationArea = All;
                    Caption = 'Payroll Journal';
                    Image = Journal;
                    RunObject = page "General Journal";
                }
                action(ConfigPackage)
                {
                    ApplicationArea = All;
                    Caption = 'Config. Packages';
                    Image = SendConfirmation;
                    RunObject = page "Config. Packages";
                }
                action(StaffAdance)
                {
                    ApplicationArea = All;
                    Caption = 'Staff Advance';
                    Image = Apply;
                    RunObject = page "Staff Advance";
                }
            }

            group(Approvals)
            {
                Caption = 'Approvals';
                Image = Alerts;

                action("Pending My Approval")
                {
                    Caption = 'Pending My Approval';
                    ApplicationArea = all;
                    RunObject = Page "Requests to Approve";
                }
                action("My Approval requests")
                {
                    Caption = 'My Approval requests';
                    ApplicationArea = all;
                    RunObject = Page "Approval Request Entries";
                }
            }

        }


        area(Creation)
        {

            group(HRSetupGroup)
            {
                Caption = 'Human Resource Setups';
                Image = HumanResources;
                action(HRLookupValuesAct)
                {
                    Caption = 'HR Lookup Values';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "HR Lookup Values List";
                }
                action(HRSetup)
                {
                    Caption = 'HR Setup Card';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Human Resources Setup";
                }
                action(HRSetupList)
                {
                    Caption = 'HR Setup List';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "HR SetUp List";
                }


            }
            group(PayrollSetups)
            {

                Caption = 'Payroll Setups';

                action(PREmployeePostingGroups)
                {
                    Caption = 'PR Employee Posting Groups';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Employee Posting Group";
                }

                action(PRThirdPartyCharges)
                {
                    Caption = 'PR Third Party Charges';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Third Party Charges";
                }

                action(PRTransCodeGrp)
                {
                    Caption = 'PR Transaction Code Groups';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Transaction Code Groups";
                }
                action(PRAccessRights)
                {
                    Caption = 'PR Access Rights';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Payroll Access Rights";
                }
                action(PRApprovers)
                {
                    Caption = 'Payroll Approvers';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Payroll Approvers";
                }

                action(PRTransCodes)
                {
                    Caption = 'PR Transaction Codes';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Transaction Codes List";
                }


                action(PRRatesandCeilings)
                {
                    Caption = 'PR Rates and Ceilings';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Rates & Ceilings";
                }

                action(BankAccounts)
                {
                    Caption = 'PR Bank Accounts';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Bank Accounts";
                }

                action(BankBranches)
                {
                    Caption = 'PR Bank Branches';
                    RunObject = Page "PR Bank Branches";
                }
                action(PayrollPeriods)
                {
                    Caption = 'PR Payroll Periods';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Payroll Periods";
                }

                action(PRPayeSetup)
                {
                    Caption = 'PR PAYE Setup';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR PAYE Setup";
                }

                action(PRNHIF)
                {
                    Caption = 'PR NHIF';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR NHIF Setup";
                }
                action(PRNSSF)
                {
                    Caption = 'PR NSSF';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR NSSF Setup";
                }
            }

            group(ApplicationSetups)
            {

                Caption = 'Application Setups ';

                action(ConfigPackages)
                {
                    Caption = 'Configuration Packages';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Config. Packages";

                }

                action(CompanyInfo)
                {
                    Caption = 'Company Information';
                    ApplicationArea = basic, suite;
                    RunObject = page "Company Information";
                }

                action(Workflow)
                {
                    Caption = 'Workflow';
                    ApplicationArea = basic, suite;
                    RunObject = page Workflow;
                }

                action(WorkflowTableRelations)
                {
                    Caption = 'Workflow - Table Relations';
                    ApplicationArea = basic, suite;
                    RunObject = page "Workflow - Table Relations";
                }
                action(WorkflowEventCombinations)
                {
                    Caption = 'Workflow Event Combinations';
                    ApplicationArea = basic, suite;
                    RunObject = page "WF Event/Response Combinations";
                }
                action(ReportLayouts)
                {
                    Caption = 'Report Layouts';
                    ApplicationArea = basic, suite;
                    RunObject = page "Report Layout Selection";
                }
                action(Extensions)
                {
                    Caption = 'Extensions';
                    ApplicationArea = basic, suite;
                    RunObject = page "Extension Management";
                }

                action(Users)
                {
                    Caption = 'Users';
                    ApplicationArea = basic, suite;
                    RunObject = page Users;
                }

            }

            group(ApprovalEntriesGrp)
            {

                Caption = 'Request to Approve';

                action(MyApprovalEntries)
                {
                    Caption = 'Request to Approve';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "Requests to Approve";

                }
            }

        }

        area(Reporting)
        {

            Group(PayrollReports)
            {
                Caption = 'Payroll Reports';

                action(PayrollCompanyPayslip7)
                {
                    Caption = 'Payroll Summary';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Company Payroll Summary";
                }

                action(PRDeductionsPosting)
                {
                    Caption = 'PR Deductions Posting';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Deductions Posting";
                }
                action(PRLedgerPosting)
                {
                    Caption = 'PR Ledger Posting';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Ledger Posting";
                }

                action(PayrollSummaryGrouped)
                {
                    Caption = 'PR Payroll Summary - Summary';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Payroll Summary - Grouped";
                }
                action(PRBankSummaryReport)
                {
                    Caption = 'PR Net Pay Bank Summary';
                    Image = Accounts;
                    ApplicationArea = Basic, Suite;
                    // RunObject = report "PR Bank Summary";
                }
                action(PRDeductionsSummary)
                {
                    Caption = 'PR Deductions Summary';
                    Image = Accounts;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Deductions Summary";
                }
                action(PRInvidualPayslipReport)
                {
                    Caption = 'PR Individual Payslip';
                    Image = Accounts;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Individual Payslip";
                }

                action(PREmployeePayslip)
                {
                    Caption = 'PR Employee Payslip';
                    Image = Accounts;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Employee Payslip";
                }

                action(PRNHIFRemmitance)
                {
                    Caption = 'PR NHIF Remmitance';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR NHIF Report";
                }

                action(PRNSSSFRemmitance)
                {
                    Caption = 'PR NSSF Remmitance';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR NSSF Report";
                }
                action("PR Housing Levy")
                {
                    Caption = 'PR Housing Levy';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Housing Levy";
                }
                action(PRPAYERemmitance)
                {
                    Caption = 'PR PAYE Remmitance';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    // RunObject = report "PR Monthly PAYE Report";
                }

                action(PRPensionReport)
                {
                    Caption = 'PR Pension Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Pension Report";
                }
                action(PRSummaryReport)
                {
                    Caption = 'Payroll Summary Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Payroll Summary";
                }
                action(PRSummaryReportINt)
                {
                    Caption = 'Payroll Summary Report-Interns';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Payroll Summary-Interns";
                }


            }
            group(SummaryReports)
            {
                Caption = 'Management Reports 1';
                action(PayrollCompanyPayslip77)
                {
                    Caption = 'Payroll Summary';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Company Payroll Summary";
                }

                action(PayrollCompanyPayslip87)
                {
                    Caption = 'Employee Bank Transfer';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Employee Bank Transfer";
                }

                action(PayrollCompanyPayslip8)
                {
                    Caption = 'Company Payslip Totals';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Company Payslip Totals";
                }
                action(PRPaymentDeductions)
                {
                    Caption = 'PR Payment and Deductions Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Payments and Deductions";
                }

                action(PREarningandDeductions)
                {
                    Caption = 'PR Earning and Deductions';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Earning and Deductions";
                }

                action(PRCombined2)
                {
                    Caption = 'PR Net Pay Combined';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Combined Net Pay Report";
                }

                action(PRSaccoNet)
                {
                    Caption = 'PR Sacco Net Pay Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    //RunObject = report "PR Sacco Net Pay";
                }


                action(PayrollVarianceNEW2)
                {
                    Caption = 'Payroll Variance Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PRVariance";
                }

                action(MonthlyPAYE)
                {
                    Caption = 'Monthly PAYE Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Monthly PAYE Report";
                }

                action(PRPensionReport2)
                {
                    Caption = 'PR Pension Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Pension Report";
                }

                action(NHIFReport)
                {
                    Caption = 'PR NHIF Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR NHIF Report";
                }
                action(PRThirdRuleReport)
                {
                    Caption = 'Payroll Third Rule Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR third Rule Report";
                }

                action(PRPayrollSummaryGroupCodes2)
                {
                    Caption = 'PR Payroll Summary - Group Codes';
                    Image = Accounts;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Payroll Summary-Group Codes";
                }

                action(PRNSSSFRemmitance22)
                {
                    Caption = 'PR NSSF Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR NSSF Report";
                }

                action(PayrollCompanyPayslip2)
                {
                    Caption = 'PR Earning and Deductions';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Earning and Deductions";
                }
                action(PRSummaryDetailed)
                {
                    Caption = 'Master Roll Report';
                    Image = Transactions;
                    ApplicationArea = basic, suite;
                    RunObject = report "PR Master Roll Report";
                }
                action(PREmpPayslip)
                {
                    Caption = 'PR Employee Payslip';
                    Image = Transactions;
                    ApplicationArea = basic, suite;
                    RunObject = report "PR Employee Payslip";
                }
            }

            group(SummaryReports2)
            {
                Caption = 'Management Reports 2';
                action(PayrollCompanyPayslip78)
                {
                    Caption = 'Non Pensionable';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Non Pensionable";
                }
                action(P10A)
                {
                    Caption = 'P10A';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "P10A.";
                }

                action(PItax)
                {
                    Caption = 'PR iTax Report Final"';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR iTax Report Final";
                }

            }

            group(AnnualReports)
            {
                Caption = 'Annual Reports';
                action(P9Report)
                {
                    Caption = 'P9';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "P9 Report (Final)";
                }

                action(P10Report2)
                {
                    Caption = 'P10';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "P10A.";
                }

                action(P10Report)
                {
                    Caption = 'P10A';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "P10A.";
                }

                action(PItax2)
                {
                    Caption = 'PR iTax Report Final"';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR iTax Report Final";
                }

            }

            group(SalaryIncrements)
            {
                Caption = 'Salary Increments';
                Image = GeneralLedger;

                action(PREmployeesSalaryScale)
                {
                    Caption = 'PR Employees Salary Scale';
                    ApplicationArea = all;
                    Image = SelectReport;
                    // RunObject = page "PR Employee Salary Rates List";
                }

                action(PREmployeesSalaryScale2)
                {
                    Caption = 'PR Employee Salary Increments';
                    ApplicationArea = all;
                    Image = SelectReport;
                    // RunObject = report "PR Employee Salary Increments";
                }
            }
            group(JournalTransfer)
            {
                Caption = 'Journal Transfer';
                Image = GeneralLedger;

                action(TransferPayrollToFinanceJournal)
                {
                    Caption = 'Batch Journal Transfer';
                    Image = Transactions;
                    ApplicationArea = basic, suite;
                    RunObject = report "PR Transfer To Journal Batch";
                }
                action(TransferPayrollToJournal)
                {
                    Caption = 'Employee Journal Transfer';
                    Image = Transactions;
                    ApplicationArea = basic, suite;
                    // RunObject = report prPayrollJournalTransfer;
                }

                action(GeneralJournal)
                {
                    Caption = 'General Journal';
                    Image = Transactions;
                    ApplicationArea = basic, suite;
                    RunObject = page "General Journal";
                }
            }

        }
    }
}



