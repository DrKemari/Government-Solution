report 58166 "Std. Monthly E\D Comparison"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Std. Monthly ED Comparison.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "No.","Emplymt. Contract Code",Status;
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
            column(Initials_Employee;Employee.Initials)
            {
            }
            column(EmployeeName;EmployeeName)
            {
            }
            dataitem("Assignment Matrix-X";"Assignment Matrix-X")
            {
                DataItemLink = "Employee No"=FIELD("No.");
                RequestFilterFields = "Code","Payroll Period";
                column(Code_PayrollTransactionLedger;"Assignment Matrix-X".Code)
                {
                }
                column(EmployeeNo_PayrollTransactionLedger;"Assignment Matrix-X"."Employee No")
                {
                }
                column(Period_PayrollTransactionLedger;"Assignment Matrix-X"."Payroll Period")
                {
                }
                column(Description_PayrollTransactionLedger;"Assignment Matrix-X".Description)
                {
                }
                column(Amount_PayrollTransactionLedger;"Assignment Matrix-X".Amount)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                EmployeeName := Employee."First Name" +' '+Employee."Middle Name"+' '+Employee."Last Name";
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
        EmployeeName: Text;
}

