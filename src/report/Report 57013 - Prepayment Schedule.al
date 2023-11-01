report 57013 "Prepayment Schedule"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Prepayment Schedule.rdlc';

    dataset
    {
        dataitem("Prepayment Header";"Prepayment Header")
        {
            column(CompanyLogo;CompanyInfo.Picture)
            {
            }
            column(CompanyName;CompanyInfo.Name)
            {
            }
            column(CompanyAddress;CompanyInfo.Address)
            {
            }
            column(CompanyAddress2;CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode;CompanyInfo."Post Code")
            {
            }
            column(CompanyCity;CompanyInfo.City)
            {
            }
            column(CompanyPhone;CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax;CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail;CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite;CompanyInfo."Home Page")
            {
            }
            column(No_PrepaymentHeader;"Prepayment Header"."No.")
            {
            }
            column(Date_PrepaymentHeader;"Prepayment Header".Date)
            {
            }
            column(Type_PrepaymentHeader;"Prepayment Header".Type)
            {
            }
            column(PayMode_PrepaymentHeader;"Prepayment Header"."Pay Mode")
            {
            }
            column(ChequeNo_PrepaymentHeader;"Prepayment Header"."Cheque No")
            {
            }
            column(PostingDate_PrepaymentHeader;"Prepayment Header"."Posting Date")
            {
            }
            column(BankCode_PrepaymentHeader;"Prepayment Header"."Bank Code")
            {
            }
            column(PaymentNarration_PrepaymentHeader;"Prepayment Header"."Payment Narration")
            {
            }
            column(Onbehalfof_PrepaymentHeader;"Prepayment Header"."On behalf of")
            {
            }
            column(CreatedBy_PrepaymentHeader;"Prepayment Header"."Created By")
            {
            }
            column(Posted_PrepaymentHeader;"Prepayment Header".Posted)
            {
            }
            column(PostedBy_PrepaymentHeader;"Prepayment Header"."Posted By")
            {
            }
            column(PostedDate_PrepaymentHeader;"Prepayment Header"."Posted Date")
            {
            }
            column(ShortcutDimension1Code_PrepaymentHeader;"Prepayment Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_PrepaymentHeader;"Prepayment Header"."Shortcut Dimension 2 Code")
            {
            }
            column(TimePosted_PrepaymentHeader;"Prepayment Header"."Time Posted")
            {
            }
            column(TotalAmount_PrepaymentHeader;"Prepayment Header"."Total Amount")
            {
            }
            column(PayingBankAccount_PrepaymentHeader;"Prepayment Header"."Paying Bank Account")
            {
            }
            column(Status_PrepaymentHeader;"Prepayment Header".Status)
            {
            }
            column(PaymentType_PrepaymentHeader;"Prepayment Header"."Payment Type")
            {
            }
            column(Currency_PrepaymentHeader;"Prepayment Header".Currency)
            {
            }
            column(NoSeries_PrepaymentHeader;"Prepayment Header"."No. Series")
            {
            }
            column(AccountType_PrepaymentHeader;"Prepayment Header"."Account Type")
            {
            }
            column(AccountNo_PrepaymentHeader;"Prepayment Header"."Account No.")
            {
            }
            column(AccountName_PrepaymentHeader;"Prepayment Header"."Account Name")
            {
            }
            column(DimensionSetID_PrepaymentHeader;"Prepayment Header"."Dimension Set ID")
            {
            }
            column(StartDate_PrepaymentHeader;"Prepayment Header"."Start Date")
            {
            }
            column(EndDate_PrepaymentHeader;"Prepayment Header"."End Date")
            {
            }
            dataitem("Prepayment Lines";"Prepayment Lines")
            {
                DataItemLink = No=FIELD("No.");
                column(No_PrepaymentLines;"Prepayment Lines".No)
                {
                }
                column(LineNo_PrepaymentLines;"Prepayment Lines"."Line No")
                {
                }
                column(AccountType_PrepaymentLines;"Prepayment Lines"."Account Type")
                {
                }
                column(AccountNo_PrepaymentLines;"Prepayment Lines"."Account No.")
                {
                }
                column(AccountName_PrepaymentLines;"Prepayment Lines"."Account Name")
                {
                }
                column(Description_PrepaymentLines;"Prepayment Lines".Description)
                {
                }
                column(Amount_PrepaymentLines;"Prepayment Lines".Amount)
                {
                }
                column(AppliestoDocNo_PrepaymentLines;"Prepayment Lines"."Applies- to Doc. No.")
                {
                }
                column(GlobalDimension1Code_PrepaymentLines;"Prepayment Lines"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_PrepaymentLines;"Prepayment Lines"."Global Dimension 2 Code")
                {
                }
                column(EmployeeContribution_PrepaymentLines;"Prepayment Lines"."Employee Contribution")
                {
                }
                column(EmployerContribution_PrepaymentLines;"Prepayment Lines"."Employer Contribution")
                {
                }
            }
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

