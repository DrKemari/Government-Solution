Page 50787 "prEmployee Trans PCA"
{
    PageType = ListPart;
    SourceTable = "prEmployee Trans PCA";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TransactionCode; "Transaction Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        objPCAheader.Reset;
                        objPCAheader.SetRange(objPCAheader."Change Advice Serial No.", "Change Advice Serial No.");
                        if objPCAheader.Find('-') then begin
                            SelectedPeriod := objPCAheader."Payroll Period";
                            "Period Month" := objPCAheader."Period Month";
                            "Period Year" := objPCAheader."Period Year";
                        end;

                        blnIsLoan := false;
                        if objTransCodes.Get("Transaction Code") then
                            "Transaction Name" := objTransCodes."Transaction Name";
                        "Payroll Period" := SelectedPeriod;
                        if objTransCodes."Special Trans Deductions" = 8 then blnIsLoan := true;

                        if objTransCodes."Is Formula" = true then begin
                            empCode := "Employee Code";
                            Clear(objOcx);
                            // curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,objTransCodes.Formula);
                            // Amount:=curTransAmount;
                        end;

                        //*************ENTER IF EMPLOYER DEDUCTION IS SET UP
                        curTransAmount := 0;

                        if objTransCodes."Include Employer Deduction" = true then begin
                            // curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,objTransCodes."Is Formula for employer");
                            // "Employer Amount":=curTransAmount;
                        end;
                    end;
                }
                field(TransactionName; "Transaction Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Balance; Balance)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Comments)
                {
                    ApplicationArea = Basic;
                }
                field(EmployerAmount; "Employer Amount")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; "End Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        objTransCodes: Record "pr Transaction Codes";
        SelectedPeriod: Date;
        objPeriod: Record "pr Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "pr Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
        blnIsLoan: Boolean;
        objEmpTrans: Record "pr Employee Transactions";
        transType: Text[30];
        objOcx: Codeunit "PR Payroll Processing";
        strExtractedFrml: Text[30];
        curTransAmount: Decimal;
        empCode: Text[30];
        Employee: Record "Employee";
        EmpTrans: Record "pr Employee Transactions";
        VitalSetUp: Record "pr Vital Setup Info";
        SalaryCard: Record "pr Salary Card";
        TotalEarnings: Decimal;
        ArreasAmount: Decimal;
        ArrearsDays: Integer;
        NoOfMonthDays: Integer;
        i: Integer;
        RemainingDays: Integer;
        TDate: Date;
        objPCAheader: Record "prBasic pay PCA";
}

