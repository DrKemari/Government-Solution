report 69023 P10A
{
    DefaultLayout = RDLC;
    RDLCLayout = './P10A.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "Pay Period Filter","No.";
            column(FORMAT_DateSpecified_0___year4___;Format(DateSpecified,0,'<year4>'))
            {
            }
            column(CoName;CoName)
            {
            }
            column(Employee__First_Name_;"First Name")
            {
            }
            column(Employee__Last_Name_;"Last Name")
            {
            }
            column(Employee_PAYE;PAYE)
            {
            }
            column(Employee__P_I_N_;"P.I.N")
            {
            }
            column(Employee__No__;"No.")
            {
            }
            column(Employee_Employee__Taxable_Income_;Employee."Taxable Income")
            {
            }
            column(Employee_PAYE_Control5;PAYE)
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
                PAYE:=Abs("Cumm. PAYE");
                if "Cumm. PAYE"=0 then
                CurrReport.Skip;
                TotalTax:=TotalTax+Abs("Cumm. PAYE");
                TotalTax:=PayrollRounding(TotalTax);
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(Employee."Taxable Income",PAYE);
                CUser:=UserId;
                //GetGroup.GetUserGroup(CUser,GroupCode);
                //SETRANGE(Employee."Posting Group",GroupCode);
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
        PAYE: Decimal;
        TotalTax: Decimal;
        CompRec: Record "Company Information";
        CoName: Text[30];
        DateSpecified: Date;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[50];
        SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaptionLbl: Label 'SUPPORTING LIST TO THE END OF YEAR CERTIFICATE';
        Payroll_NumberCaptionLbl: Label 'Payroll Number';
        Employee_CaptionLbl: Label 'Employee ';
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

