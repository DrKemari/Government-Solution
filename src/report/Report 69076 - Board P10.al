report 69076 "Board P10"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Board P10.rdlc';

    dataset
    {
        dataitem("Payroll PeriodX";"Payroll PeriodX")
        {
            DataItemTableView = SORTING("Starting Date") ORDER(Ascending);
            column(Caption;SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaptionLbl)
            {
            }
            column(PIN;CompRec."Pin No")
            {
            }
            column(CompanyName;CompRec.Name)
            {
            }
            column(StartingDate_PayrollPeriodX;"Payroll PeriodX"."Starting Date")
            {
            }
            column(Name_PayrollPeriodX;"Payroll PeriodX".Name)
            {
            }
            dataitem("Director Ledger Entry";"Director Ledger Entry")
            {
                DataItemLink = "Payroll Period"=FIELD("Starting Date");
                column(DirectorNo_DirectorLedgerEntry;"Director Ledger Entry"."Director No")
                {
                }
                column(Type_DirectorLedgerEntry;"Director Ledger Entry".Type)
                {
                }
                column(Code_DirectorLedgerEntry;"Director Ledger Entry".Code)
                {
                }
                column(PayrollPeriod_DirectorLedgerEntry;"Director Ledger Entry"."Payroll Period")
                {
                }
                column(Amount_DirectorLedgerEntry;"Director Ledger Entry".Amount)
                {
                }
                column(Description_DirectorLedgerEntry;"Director Ledger Entry".Description)
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
        CompRec.Get();
        CoName:=CompRec.Name;
    end;

    var
        PAYEE: Decimal;
        TotalTax: Decimal;
        CompRec: Record "Company Information";
        CoName: Text[50];
        DateSpecified: Date;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaptionLbl: Label 'SUPPORTING LIST TO THE END OF YEAR CERTIFICATE';
        Payroll_NumberCaptionLbl: Label 'Board Number';
        Employee_CaptionLbl: Label 'Board';
        PIN_NumberCaptionLbl: Label 'PIN Number';
        Total_Tax_KshsCaptionLbl: Label 'Total Tax Kshs';
        PERIODCaptionLbl: Label 'PERIOD';
        TAXABLE_PAYCaptionLbl: Label 'TAXABLE PAY';
        TotalsCaptionLbl: Label 'Totals';
        P10ACaptionLbl: Label 'P10A';

    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

            HRsetup.Get;
            if HRsetup."Payroll Rounding Precision"=0 then
               Error('You must specify the rounding precision under HR setup');

          if HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Nearest then
            PayrollRounding:=Round(Amount,HRsetup."Payroll Rounding Precision",'=');

          if HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Up then
            PayrollRounding:=Round(Amount,HRsetup."Payroll Rounding Precision",'>');

          if HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Down then
            PayrollRounding:=Round(Amount,HRsetup."Payroll Rounding Precision",'<');
    end;
}

