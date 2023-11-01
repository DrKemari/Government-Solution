report 69075 "Board P10A"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Board P10A.rdlc';

    dataset
    {
        dataitem(Employee;Vendor)
        {
            RequestFilterFields = "Pay Period Filter","No.";
            column(FORMAT_DateSpecified_0___year4___;Format(DateSpecified,0,'<year4>'))
            {
            }
            column(CoName;CoName)
            {
            }
            column(Employee__First_Name_;Employee.Name)
            {
            }
            column(Employee__Last_Name_;Employee.Name)
            {
            }
            column(Employee_PAYE;PAYEE)
            {
            }
            column(Employee__P_I_N_;Employee."PIN Number")
            {
            }
            column(Employee__No__;"No.")
            {
            }
            column(Employee_Employee__Taxable_Income_;Employee."Taxable Income")
            {
            }
            column(Employee_PAYE_Control5;PAYEE)
            {
            }
            column(Employee_Employee__Taxable_Income__Control1000000001;Employee."Taxable Income")
            {
            }
            column(SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaption;SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaptionLbl)
            {
            }
            column(Payroll_NumberCaption;Payroll_NumberCaptionLbl)
            {
            }
            column(Employee_Caption;Employee_CaptionLbl)
            {
            }
            column(PIN_NumberCaption;PIN_NumberCaptionLbl)
            {
            }
            column(Total_Tax_KshsCaption;Total_Tax_KshsCaptionLbl)
            {
            }
            column(PERIODCaption;PERIODCaptionLbl)
            {
            }
            column(TAXABLE_PAYCaption;TAXABLE_PAYCaptionLbl)
            {
            }
            column(TotalsCaption;TotalsCaptionLbl)
            {
            }
            column(P10ACaption;P10ACaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Employee.CalcFields("Cumm. PAYE");
                PAYEE:=Abs("Cumm. PAYE");
                if "Cumm. PAYE"=0 then
                CurrReport.Skip;
                TotalTax:=TotalTax+Abs("Cumm. PAYE");
                TotalTax:=PayrollRounding(TotalTax);
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(Employee."Taxable Income",PAYEE);
                // CUser:=USERID;
                // GetGroup.GetUserGroup(CUser,GroupCode);
                // SETRANGE(Employee."Vendor Posting Group",GroupCode);
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
        DateSpecified:=Employee.GetRangeMin("Pay Period Filter");
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

