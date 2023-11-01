Page 50203 "PR Transaction Formula List"
{
    PageType = List;
    SourceTable = "PR Transaction Codes Formula";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TransactionCode; "Transaction Code")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionName; "Transaction Name")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Name; "Global Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeFormulae; "Employee Formulae")
                {
                    ApplicationArea = Basic;
                }
                field(IncludeInEmployerDeductions; "Include In Employer Deductions")
                {
                    ApplicationArea = Basic;
                }
                field(EmployerFormulae; "Employer Formulae")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

