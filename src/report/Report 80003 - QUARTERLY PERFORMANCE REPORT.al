report 80003 "QUARTERLY PERFORMANCE REPORT"
{
    DefaultLayout = RDLC;
    RDLCLayout = './QUARTERLY PERFORMANCE REPORT.rdlc';

    dataset
    {
        dataitem(Income;"G/L Account")
        {
            CalcFields = "Budgeted Amount";
            DataItemTableView = WHERE("Account Category"=CONST(Income),"Budgeted Amount"=FILTER(<>0));
            column(No_GLAccount;Income."No.")
            {
            }
            column(Name_GLAccount;Income.Name)
            {
            }
            column(ActualAmount;ActualAmount)
            {
            }
            column(BudgetedAmount;BudgetedAmount)
            {
            }
            column(Varaiance;Variance)
            {
            }
            column(ActualAmounttoDate_Income;ActualAmounttoDate)
            {
            }
            column(BudgetedAmounttoDate_Income;BudgetedAmounttoDate)
            {
            }
            column(VariancetoDate_Income;VariancetoDate)
            {
            }
            column(EndDate;EndDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                ActualAmount:=0;
                BudgetedAmount:=0;
                Variance:=0;

                Income.CalcFields("Budgeted Amount");
                if Income."Budgeted Amount"=0 then
                  CurrReport.Skip;

                GLAccount.Reset;
                GLAccount.SetRange("No.",Income."No.");
                GLAccount.SetRange("Date Filter",StartDate,EndDate);
                if GLAccount.Find('-') then begin
                  GLAccount.CalcFields("Net Change","Budgeted Amount");
                    ActualAmount:=GLAccount."Net Change";
                    BudgetedAmount:=GLAccount."Budgeted Amount";
                    Variance:=ActualAmount-BudgetedAmount;
                  end;


                ActualAmounttoDate:=0;
                BudgetedAmounttoDate:=0;
                VariancetoDate:=0;

                GLAccount.Reset;
                GLAccount.SetRange("No.",Income."No.");
                GLAccount.SetRange("Date Filter",0D,EndDate);
                if GLAccount.Find('-') then begin
                  GLAccount.CalcFields("Net Change","Budgeted Amount");
                    ActualAmounttoDate:=GLAccount."Net Change";
                    BudgetedAmounttoDate:=GLAccount."Budgeted Amount";
                    VariancetoDate:=ActualAmount-BudgetedAmount;
                  end;

            end;
        }
        dataitem(Expense;"G/L Account")
        {
            CalcFields = "Budgeted Amount";
            DataItemTableView = WHERE("Account Category"=CONST(Expense),"Budgeted Amount"=FILTER(<>0));
            column(No_GLAccount_Expense;Expense."No.")
            {
            }
            column(Name_GLAccount_Expense;Expense.Name)
            {
            }
            column(ActualAmount_Expense;ActualAmount)
            {
            }
            column(BudgetedAmount_Expense;BudgetedAmount)
            {
            }
            column(Varaiance_Expense;Variance)
            {
            }
            column(ActualAmounttoDate_Expense;ActualAmounttoDate)
            {
            }
            column(BudgetedAmounttoDate_Expense;BudgetedAmounttoDate)
            {
            }
            column(VariancetoDate_Expense;VariancetoDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                ActualAmount:=0;
                BudgetedAmount:=0;
                Variance:=0;

                Expense.CalcFields("Budgeted Amount");
                if Expense."Budgeted Amount"=0 then
                  CurrReport.Skip;


                GLAccount.Reset;
                GLAccount.SetRange("No.",Expense."No.");
                GLAccount.SetRange("Date Filter",StartDate,EndDate);
                if GLAccount.Find('-') then begin
                  GLAccount.CalcFields("Net Change","Budgeted Amount");
                    ActualAmount:=GLAccount."Net Change";
                    BudgetedAmount:=GLAccount."Budgeted Amount";
                    Variance:=ActualAmount-BudgetedAmount;
                  end;


                ActualAmounttoDate:=0;
                BudgetedAmounttoDate:=0;
                VariancetoDate:=0;

                GLAccount.Reset;
                GLAccount.SetRange("No.",Expense."No.");
                GLAccount.SetRange("Date Filter",0D,EndDate);
                if GLAccount.Find('-') then begin
                  GLAccount.CalcFields("Net Change","Budgeted Amount");
                    ActualAmounttoDate:=GLAccount."Net Change";
                    BudgetedAmounttoDate:=GLAccount."Budgeted Amount";
                    VariancetoDate:=ActualAmount-BudgetedAmount;
                  end;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date";StartDate)
                {
                }
                field("End Date";EndDate)
                {
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        ActualAmount: Decimal;
        BudgetedAmount: Decimal;
        Variance: Decimal;
        StartDate: Date;
        EndDate: Date;
        GLAccount: Record "G/L Account";
        ActualAmounttoDate: Decimal;
        BudgetedAmounttoDate: Decimal;
        VariancetoDate: Decimal;
}

