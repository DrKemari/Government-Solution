table 50511 "HR Activities Cue"
{

    fields
    {
        field(1; "Primary Key"; Code[30])
        {
        }

        field(2; "Active Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = Count("Employee" where(Status = filter(Active), "Employees Type" = filter(<> Interns)));
        }

        field(3; "In-Active Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = Count("Employee" WHERE(Status = CONST(InActive), "Employees Type" = filter(<> Interns)));
        }

        field(4; "All Jobs"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Company Positions");

        }

        field(5; "Male Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Employee" where(Gender = const(Male)));
        }

        field(6; "Female Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Employee" where(Gender = const(Female)));
        }

        field(7; "Current Payroll Period"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("PR Payroll Periods"."Date Opened" where(Closed = const(false)));
        }

        field(8; "Net Pay"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('NPAY'),
                            "Period Closed" = const(false), "Period Year" = filter(2022)));
            DecimalPlaces = 0 : 0;
        }

        field(9; "Basic Pay"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('BPAY'),
                            "Period Closed" = const(false), "Period Year" = filter(2022)));
            DecimalPlaces = 0 : 0;
        }


        field(10; "Contract Staff"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = Count("Employee" WHERE("Employee Contract Type" = filter(Contract)));
        }
        field(11; "Permanent Staff"; Integer)
        {
            BlankZero = true;
            CalcFormula = count("Employee" where(Status = filter(Active),
                                                     "Employees Type" = filter(Permanent)));

            FieldClass = FlowField;
        }

        field(12; "Seconded Staff"; Integer)
        {
            BlankZero = true;
            CalcFormula = count("Employee" where(Status = filter(Active),
                                                     "Employees Type" = filter(Seconded)));

            FieldClass = FlowField;
        }

        field(13; "Staff on Leave"; Integer)
        {

        }
        field(114; "Staff on Leave Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Employee" where("On Leave" = filter(true)));
        }

        field(14; "Contracts Due"; Integer)
        {

        }

        field(15; "Retirement Report"; Integer)
        {

        }

        field(16; "Allowances"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Group Order" = const(3),
                            "Period Closed" = const(false)));
            DecimalPlaces = 0 : 0;
        }
        // field(17; "Deductions"; Decimal)
        // {
        //     BlankZero = true;
        //     FieldClass = FlowField;
        //     CalcFormula = sum("PR Period Transactions".Amount where("Group Text" = const('DEDUCTIONS'),
        //                     "Period Closed" = const(false)));
        //     DecimalPlaces = 0 : 0;
        // }

        field(18; "NHIF"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('NHIF'),
                            "Period Closed" = const(false), "Period Year" = filter(2022)));
            DecimalPlaces = 0 : 0;
        }

        field(19; "NSSF"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('NSSF'),
                            "Period Closed" = const(false), "Period Year" = filter(2022)));
            DecimalPlaces = 0 : 0;
        }

        field(20; "PAYE"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('PAYE'),
                            "Period Closed" = const(false), "Period Year" = filter(2022)));
            DecimalPlaces = 0 : 0;
        }

        field(21; "Pension-Employee"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('507'),
                            "Period Closed" = const(false), "Period Year" = filter(2022)));
            DecimalPlaces = 0 : 0;
        }

        field(22; "Pension-Employer"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Employer Deductions".Amount where("Transaction Code" = const('507'),
                            "Period Closed" = const(false), "Period Year" = filter(2022)));
            DecimalPlaces = 0 : 0;
        }

        field(23; "Voluntary NSSF"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('D52'),
                            "Period Closed" = const(false), "Period Year" = filter(2022)));
            DecimalPlaces = 0 : 0;
        }

        field(24; "Voluntary Pension"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('D53'),
                            "Period Closed" = const(false)));
            DecimalPlaces = 0 : 0;
        }

        field(25; "Probation Report"; Integer)
        {
            DataClassification = ToBeClassified;
            BlankZero = true;
        }
        field(26; "Registered Male"; integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Employee" where("Gender" = const(Male), Status = const(Active)));

        }
        field(27; "Registered Female"; integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Employee" where("Gender" = const(Female), Status = const(Active)));

        }
        field(28; "Registered Disabled"; integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Employee" where("Disabled" = const(true), Status = const(Active)));
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}

