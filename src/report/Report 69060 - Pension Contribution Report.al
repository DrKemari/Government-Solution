report 69060 "Pension Contribution Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Pension Contribution Report.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "No.";
            column(No_Employee;Employee."No.")
            {
            }
            column(FirstName_Employee;Employee."First Name")
            {
            }
            column(MiddleName_Employee;Employee."Middle Name")
            {
            }
            column(LastName_Employee;Employee."Last Name")
            {
            }
            column(Basic_Employee;Employee.Basic)
            {
            }
            column(PIN_Employee;Employee."P.I.N")
            {
            }
            column(IDNumber_Employee;Employee."ID Number")
            {
            }
            column(DateOfBirth_Employee;Employee."Date Of Birth")
            {
            }
            column(EmploymentDate_Employee;Employee."Employment Date")
            {
            }
            column(PayrollCode;"Payroll Code")
            {
            }
            column(Gender_Employee;Employee.Gender)
            {
            }
            dataitem("Assignment Matrix-X";"Assignment Matrix-X")
            {
                DataItemLink = "Employee No"=FIELD("No.");
                DataItemTableView = WHERE(Type=CONST(Deduction));
                RequestFilterFields = "Code","Payroll Period";
                column(Code_AssignmentMatrixX;"Assignment Matrix-X".Code)
                {
                }
                column(Amount_AssignmentMatrixX;"Assignment Matrix-X".Amount)
                {
                }
                column(EmployerAmount_AssignmentMatrixX;"Assignment Matrix-X"."Employer Amount")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Assignment Matrix-X".SetRange("Assignment Matrix-X".Code,"Payroll Code");
                end;

                trigger OnPreDataItem()
                begin
                    "Assignment Matrix-X".SetRange("Assignment Matrix-X".Code,"Payroll Code");
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("Payroll Filter")
                {
                    field("Payroll Code";"Payroll Code")
                    {
                        NotBlank = true;
                        TableRelation = DeductionsX.Code WHERE ("Pension Scheme"=CONST(true));
                    }
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
        if "Payroll Code" = '' then
          Error('Please select pension payroll code');
    end;

    var
        "Payroll Code": Code[10];
}

