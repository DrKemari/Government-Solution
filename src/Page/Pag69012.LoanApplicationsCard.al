#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69012 "Loan Applications Card"
{
    Editable = true;
    SourceTable = "Loan Application";

    layout
    {
        area(content)
        {
            field("Loan No"; Rec."Loan No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Loan No field.';
            }
            field("Description."; Rec."Description.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Description. field.';
            }
            field("Employee No"; Rec."Employee No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee No field.';
            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee Name field.';
            }
            field("Application Date"; Rec."Application Date")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Application Date field.';
            }
            field("Amount Requested"; Rec."Amount Requested")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Amount Requested field.';
            }
            field("Approved Amount"; Rec."Approved Amount")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Approved Amount field.';
            }
            field("Loan Status"; Rec."Loan Status")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Loan Status field.';
            }
            field("Issued Date"; Rec."Issued Date")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Issued Date field.';
            }
            field(Instalment; Rec.Instalment)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Instalment field.';
            }
            field(Repayment; Rec.Repayment)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Repayment field.';
            }
            field("Flat Rate Principal"; Rec."Flat Rate Principal")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Flat Rate Principal field.';
            }
            field("Flat Rate Interest"; Rec."Flat Rate Interest")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Flat Rate Interest field.';
            }
            field("Interest Rate"; Rec."Interest Rate")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Interest Rate field.';
            }
            field("Interest Calculation Method"; Rec."Interest Calculation Method")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Interest Calculation Method field.';
            }
            field("Payroll Group"; Rec."Payroll Group")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Payroll Group field.';
            }
            field("Opening Loan"; Rec."Opening Loan")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Opening Loan field.';
            }
            field("Total Repayment"; Rec."Total Repayment")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Total Repayment field.';
            }
            field("Period Repayment"; Rec."Period Repayment")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Period Repayment field.';
            }
            field("Interest Amount"; Rec."Interest Amount")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Interest Amount field.';
            }
            field("External Document No"; Rec."External Document No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the External Document No field.';
            }
            field(Receipts; Rec.Receipts)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Receipts field.';
            }
            field("HELB No."; Rec."HELB No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the HELB No. field.';
            }
            field("University Name"; Rec."University Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the University Name field.';
            }
            field("Stop Loan"; Rec."Stop Loan")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Stop Loan field.';
            }
            field("Refinanced From Loan:"; Rec."Refinanced From Loan:")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Refinanced From Loan: field.';
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Create Schedule';
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Create Schedule action.';
                trigger OnAction()
                begin
                    LM.GenerateRepaymentSchedule(Rec);
                end;
            }
            action("Preview Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Preview Schedule';
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Loan Repayment Schedule";
                RunPageLink = "Loan No." = field("Loan No"),
                              "Employee No." = field("Employee No");
                RunPageView = sorting("Loan No.", "Instalment No", "Employee No.")
                              order(ascending);
                ToolTip = 'Executes the Preview Schedule action.';
                trigger OnAction()
                begin
                    //   LM.GenerateRepaymentSchedule(Rec);
                end;
            }
            action("Issue Loan")
            {
                ApplicationArea = Basic;
                Caption = 'Issue Loan';
                Image = IssueFinanceCharge;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Issue Loan action.';
                trigger OnAction()
                begin
                    //   LM.GenerateRepaymentSchedule(Rec);


                    if Rec."Loan Status" = Rec."loan status"::Issued then
                        Error('Loan Already Issued');

                    if Rec."Issued Date" = 0D then
                        Error('You must specify the issue date before issuing the loan');

                    if Rec."Approved Amount" = 0 then
                        Error('You must specify the Approved amount before issuing the loan');



                    if Rec."Opening Loan" = false then begin
                        /*Schedule.RESET;
                        Schedule.SETRANGE("Loan No","Loan No");
                        Schedule.SETRANGE(Schedule."Employee No","Employee No");
                        IF NOT Schedule.FIND('-') THEN
                          ERROR('No schedule created yet'); */
                        Emp.Get(Rec."Employee No");
                        AssMatrix.Init;
                        AssMatrix."Employee No" := Rec."Employee No";
                        AssMatrix.Type := AssMatrix.Type::Deduction;
                        AssMatrix."Reference No" := Rec."Loan No";
                        if Rec."Deduction Code" = '' then
                            Error('Loan %1 must be associated with a deduction', Rec."Loan Product Type")
                        else
                            AssMatrix.Code := Rec."Deduction Code";
                        AssMatrix."Payroll Period" := Rec."Issued Date";

                        AssMatrix.Description := Rec.Description;
                        AssMatrix."Payroll Group" := Emp."Posting Group";
                        AssMatrix."Department Code" := Emp."Global Dimension 1 Code";
                        AssMatrix.Amount := Rec.Repayment;
                        AssMatrix."Next Period Entry" := true;
                        AssMatrix.Validate(AssMatrix.Amount);
                        AssMatrix.Insert;

                        Rec."Loan Status" := Rec."loan status"::Issued;
                        Rec.Modify;
                        Message('Loan Issued');
                    end else begin

                        Emp.Get(Rec."Employee No");
                        AssMatrix.Init;
                        AssMatrix."Employee No" := Rec."Employee No";
                        AssMatrix.Type := AssMatrix.Type::Deduction;
                        AssMatrix.Code := Rec."Deduction Code";
                        AssMatrix."Payroll Period" := Rec."Issued Date";
                        AssMatrix."Reference No" := Rec."Loan No";
                        AssMatrix.Description := Rec.Description;
                        AssMatrix."Payroll Group" := Emp."Posting Group";
                        AssMatrix."Department Code" := Emp."Global Dimension 1 Code";
                        AssMatrix.Amount := Rec.Repayment;
                        AssMatrix.Validate(AssMatrix.Amount);
                        AssMatrix."Next Period Entry" := true;
                        AssMatrix.Insert;

                        Rec."Loan Status" := Rec."loan status"::Issued;
                        Rec.Modify;
                        Message('Loan Issued');

                    end;

                end;
            }
            action("Delete Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Delete Schedule';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Delete Schedule action.';
                trigger OnAction()
                begin
                    // LM.GenerateRepaymentSchedule(Rec);
                    LM.DeleteRepaymentSchedule(Rec);
                end;
            }
        }
    }

    var
        LoanProduct: Record "Loan Product Type";
        EmpRec: Record Employee;
        PreviewShedule: Record "Repayment Schedule";
        RunningDate: Date;
        AssMatrix: Record "Assignment Matrix-X";
        Schedule: Record "Repayment Schedule";
        Emp: Record Employee;
        LM: Codeunit LoansManagement;
        GroupCode: Code[20];
        CUser: Code[20];
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        EmpRec2: Record Employee;
}

#pragma implicitwith restore

