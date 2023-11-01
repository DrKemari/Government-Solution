report 69024 "Gender Profile"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Gender Profile.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = WHERE(Status=FILTER(Active));
            column(JobTitle_Employee;Employee."Job Title")
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
            column(TIME;Time)
            {
            }
            column(CoRec_Picture;CoRec.Picture)
            {
            }
            column(Date;Date)
            {
            }
            column(MalePer;MalePer)
            {
            }
            column(FemalePer;FemalePer)
            {
            }
            column(JobLevel;JobLevel)
            {
            }
            column(TotalPer;TotalPer)
            {
            }
            column(TotalEmployee;TotalEmployee)
            {
            }

            trigger OnAfterGetRecord()
            begin
                FemaleTotal:=0;
                Employee.Reset;
                Employee.SetFilter("Employment Date",'..%1',Date);
                Employee.SetRange(Gender,Employee.Gender::Female);
                if Employee.FindSet then begin
                  repeat
                    FemaleTotal:=FemaleTotal+1;
                  until Employee.Next=0;
                end;

                //male total
                MaleTotal:=0;
                Employee.Reset;
                Employee.SetFilter("Employment Date",'..%1',Date);
                Employee.SetRange(Gender,Employee.Gender::Male);
                if Employee.FindSet then begin
                  repeat
                    MaleTotal:=MaleTotal+1;
                  until Employee.Next=0;
                end;
                //Total Employees
                TotalEmployee:=MaleTotal+FemaleTotal;
                FemalePer:=(FemaleTotal/TotalEmployee)*100;
                MalePer:=(MaleTotal/TotalEmployee)*100;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Date Filter";Date)
                {
                    ShowMandatory = true;
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

    trigger OnPreReport()
    begin
        CoRec.CalcFields(Picture);
    end;

    var
        CoRec: Record "Company Information";
        Date: Date;
        MalePer: Decimal;
        FemalePer: Decimal;
        JobLevel: Text;
        TotalPer: Decimal;
        MaleTotal: Integer;
        FemaleTotal: Integer;
        TotalEmployee: Integer;
}

