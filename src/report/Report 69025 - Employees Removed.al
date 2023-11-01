report 69025 "Employees Removed"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Employees Removed.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "Pay Period Filter";
            column(FORMAT_TODAY_0_4_;Format(Today,0,4))
            {
            }
            column(COMPANYNAME;CompanyName)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            column(USERID;UserId)
            {
            }
            column(STRSUBSTNO__PERIOD___1__UPPERCASE_FORMAT_Thismonth_0___month_text___year4_____;StrSubstNo('PERIOD: %1',UpperCase(Format(Thismonth,0,'<month text> <year4>'))))
            {
            }
            column(Employee__No__;"No.")
            {
            }
            column(First_Name_______Middle_Name________Last_Name_;"First Name"+' '+"Middle Name"+ ' '+"Last Name")
            {
            }
            column(Counter;Counter)
            {
            }
            column(EMPLOYEES_REMOVED_FROM_PAYROLLCaption;EMPLOYEES_REMOVED_FROM_PAYROLLCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee__No__Caption;FieldCaption("No."))
            {
            }
            column(NameCaption;NameCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                FoundThismonth:=false;
                FoundLastmonth:=false;

                AssignMat.Reset;
                AssignMat.SetRange(AssignMat."Employee No",Employee."No.");
                AssignMat.SetRange(AssignMat."Payroll Period",Thismonth);
                if AssignMat.Find('+') then
                FoundThismonth:=true;


                AssignMat.Reset;
                AssignMat.SetRange(AssignMat."Employee No",Employee."No.");
                AssignMat.SetRange(AssignMat."Payroll Period",LastMonth);
                if AssignMat.Find('+') then
                FoundLastmonth:=true;

                if FoundThismonth and FoundLastmonth then
                CurrReport.Skip;

                if not FoundThismonth and not FoundLastmonth then
                CurrReport.Skip;


                if not FoundLastmonth and FoundThismonth then
                CurrReport.Skip;
                Counter:=Counter+1;
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
         Thismonth:=Employee.GetRangeMin(Employee."Pay Period Filter");
         LastMonth:=CalcDate('-1M',Thismonth);
    end;

    var
        AssignMat: Record "Assignment Matrix-X";
        LastMonth: Date;
        Thismonth: Date;
        FoundThismonth: Boolean;
        FoundLastmonth: Boolean;
        Counter: Integer;
        EMPLOYEES_REMOVED_FROM_PAYROLLCaptionLbl: Label 'EMPLOYEES REMOVED FROM PAYROLL';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NameCaptionLbl: Label 'Name';
}

