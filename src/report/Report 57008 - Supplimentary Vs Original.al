report 57008 "Supplimentary Vs Original"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Supplimentary Vs Original.rdlc';

    dataset
    {
        dataitem("G/L Budget Name";"G/L Budget Name")
        {
            DataItemTableView = WHERE("Budget Type"=FILTER(Original));
            RequestFilterFields = Name;
            column(Logo;CI.Picture)
            {
            }
            column(BudgetType_GLBudgetName;"G/L Budget Name"."Budget Type")
            {
            }
        }
        dataitem("G/L Account";"G/L Account")
        {
            DataItemTableView = WHERE("Income/Balance"=FILTER("Income Statement"),"Account Type"=FILTER(Posting|"End-Total"));
            column(BudgetName_GLBudgetEntry;AccountName)
            {
            }
            column(GLAccountNo_GLBudgetEntry;AccountNo)
            {
            }
            column(Amount_GLBudgetEntry;Amount)
            {
            }
            column(SupAccountNo;SupAccountNo)
            {
            }
            column(Variance;Variance)
            {
            }
            column(SupAccountName;SupAccountName)
            {
            }
            column(SupAmount;SupAmount)
            {
            }
            column(Variance1;Variance1)
            {
            }
            column(SupAmount1;SupAmount1)
            {
            }
            column(AccountType; AccountType)
            {
            }
            column(NetChange_GLAccount;"G/L Account"."Net Change")
            {
            }

            trigger OnAfterGetRecord()
            begin
                //get total values for original
                AccountNo:='';
                AccountName:='';
                Amount:=0;
                SupAccountName:='';
                    AccountNo:="G/L Account"."No.";
                     AccountName:="G/L Account".Name;
                     AccountType:=Format("G/L Account"."Account Type");
                        //get original figures
                    if "G/L Account"."Account Type"="G/L Account"."Account Type"::Posting then begin
                    Amount:=0;
                    BudgetEntry.Reset;
                    BudgetEntry.SetRange("Budget Name","G/L Budget Name".Name);
                    BudgetEntry.SetRange("G/L Account No.","G/L Account"."No.");
                    if BudgetEntry.FindSet then  begin
                      repeat
                        Amount:=Amount+BudgetEntry.Amount;
                      until BudgetEntry.Next=0;
                    end;
                   end else begin
                      GLAccount.Reset;
                     GLAccount.SetRange("No.","G/L Account"."No.");
                      GLAccount.SetFilter("Budget Filter","G/L Budget Name".Name);
                      if GLAccount.FindFirst then begin
                       GLAccount.CalcFields("Budgeted Amount");
                       Amount:=GLAccount."Budgeted Amount";
                       end;

                   end;
                        //get the sup figures


                        SupBudgetName.Reset;
                        SupBudgetName.SetRange("Original Budget","G/L Budget Name".Name);
                        SupBudgetName.SetRange("Budget Type",SupBudgetName."Budget Type"::"Suplimentary 1");
                        if SupBudgetName.FindFirst then begin
                        Variance:=0;
                          SupAmount:=0;
                        if "G/L Account"."Account Type"="G/L Account"."Account Type"::Posting then begin
                        SupBudgetEntry.Reset;
                        SupBudgetEntry.SetRange("Budget Name",SupBudgetName.Name);
                        SupBudgetEntry.SetRange("G/L Account No.","G/L Account"."No.");
                            if SupBudgetEntry.FindSet then begin
                                repeat
                                  SupAmount:=SupAmount+SupBudgetEntry.Amount;
                                until SupBudgetEntry.Next=0
                            end;
                         end else begin
                           GLAccount.Reset;
                           GLAccount.SetRange("No.","G/L Account"."No.");
                            GLAccount.SetFilter("Budget Filter",SupBudgetName.Name);
                            if GLAccount.FindFirst then begin
                             GLAccount.CalcFields("Budgeted Amount");
                             SupAmount:=GLAccount."Budgeted Amount";
                             end;

                          end;
                          //Variance:=Amount-SupAmount;
                          Variance:=SupAmount-Amount;
                          end;

                        SupBudgetName1.Reset;
                        SupBudgetName1.SetRange("Original Budget","G/L Budget Name".Name);
                        SupBudgetName1.SetRange("Budget Type",SupBudgetName."Budget Type"::"Suplimentary 2");
                        if SupBudgetName1.FindFirst then begin
                        Variance1:=0;
                        SupAmount1:=0;
                         if "G/L Account"."Account Type"="G/L Account"."Account Type"::Posting then begin
                        SupBudgetEntry1.Reset;
                        SupBudgetEntry1.SetRange("Budget Name",SupBudgetName1.Name);
                        SupBudgetEntry1.SetRange("G/L Account No.","G/L Account"."No.");
                            if SupBudgetEntry1.FindSet then begin
                                repeat
                                  SupAmount1:=SupAmount1+SupBudgetEntry1.Amount;
                                until SupBudgetEntry1.Next=0
                            end;
                            end else begin
                              GLAccount.Reset;
                           GLAccount.SetRange("No.","G/L Account"."No.");
                            GLAccount.SetFilter("Budget Filter",SupBudgetName1.Name);
                            if GLAccount.FindFirst then begin
                             GLAccount.CalcFields("Budgeted Amount");
                             SupAmount1:=GLAccount."Budgeted Amount";
                             end;
                            end;
                           //Variance1:=Amount-SupAmount1;
                           Variance1:=SupAmount1-Amount;
                         end;

                //         END ELSE BEGIN
                //
                //         END
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        SupBudgetEntry: Record "G/L Budget Entry";
        SupBudgetName: Record "G/L Budget Name";
        SupAccountNo: Code[150];
        SupAccountName: Text;
        Variance: Decimal;
        SupAmount: Decimal;
        CI: Record "Company Information";
        BudgetEntry: Record "G/L Budget Entry";
        BudgetName: Record "G/L Budget Name";
        AccountNo: Code[150];
        AccountName: Text;
        Amount: Decimal;
        SupBudgetEntry1: Record "G/L Budget Entry";
        SupBudgetName1: Record "G/L Budget Name";
        SupAccountNo1: Code[150];
        SupAccountName1: Text;
        Variance1: Decimal;
        SupAmount1: Decimal;
        AccountType: Text;
        GLAccount: Record "G/L Account";
}

