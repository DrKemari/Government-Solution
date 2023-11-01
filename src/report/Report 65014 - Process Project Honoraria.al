report 65014 "Process Project Honoraria"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Process Project Honoraria.rdlc';

    dataset
    {
        dataitem("Payroll PeriodX";"Payroll PeriodX")
        {
            DataItemTableView = WHERE(Closed=CONST(false));
            RequestFilterFields = "Starting Date";

            trigger OnAfterGetRecord()
            begin
                Effort.Reset;
                Effort.SetRange(Blocked,false);
                Effort.SetFilter("Monthly Earned Amount(LCY)",'<>%1',0);
                if Effort.Find('-') then begin
                  repeat
                    if (("Payroll PeriodX"."Starting Date">=Effort."Starting Pay Period") and
                        ("Payroll PeriodX"."Starting Date"<=Effort."Ending Pay Period")) then begin
                          Effort.CalcFields("Employee No");
                          AssigntMatrix.Init;
                          AssigntMatrix."Employee No":=Effort."Employee No";
                          AssigntMatrix.Type:=AssigntMatrix.Type::Payment;
                          AssigntMatrix.Code:=Effort."Payroll Earning Code";
                          AssigntMatrix."Effective Start Date":=Effort."Starting Pay Period";
                          AssigntMatrix."Effective End Date":=Effort."Ending Pay Period";
                          AssigntMatrix."Payroll Period":="Payroll PeriodX"."Starting Date";
                          AssigntMatrix.Amount:=Effort."Monthly Earned Amount(LCY)";
                          AssigntMatrix.Description:=Effort."Earning Description";
                          AssigntMatrix.Taxable:=true;
                          AssigntMatrix."Job No":=Effort."Project No";
                          AssigntMatrix."Job Task No":=Effort."Task No";
                          AssigntMatrix.Honoraria:=true;
                          AssigntMatrix.Insert(true);

                   end;
                  until Effort.Next=0;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Project Honoraria processed successfully');
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

    var
        Effort: Record "Effort & Payroll Matrix";
        AssigntMatrix: Record "Assignment Matrix-X";
        PayrollPeriod: Date;
}

