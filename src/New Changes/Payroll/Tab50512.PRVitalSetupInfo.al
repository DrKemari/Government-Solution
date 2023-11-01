Table 50512 "PR Vital Setup Info"
{
    LookupPageId = "PR Rates & Ceilings";
    fields
    {
        field(1; "Setup Code"; Code[10])
        {
        }

        field(370; "Implement NHIF Relief"; boolean)
        { }

        field(371; "NHIF Relief Percentage"; Decimal)
        {

        }
        field(372; "NSSF Rate"; Decimal)
        {

        }
        field(373; "NSSF Lower Earning Limit(LEL)"; Decimal)
        {

        }
        field(374; "NSSF Upper Earning Limit(UEL)"; Decimal)
        {

        }
        field(375; "Implement New NSSF"; Boolean)
        {

        }


        field(2; "Tax Relief"; Decimal)
        {
        }
        field(3; "Insurance Relief"; Decimal)
        {
        }
        field(4; "Max Relief"; Decimal)
        {
        }

        field(5; "Mortgage Relief"; Decimal)
        {
        }
        field(6; "Max Pension Contribution"; Decimal)
        {
        }
        field(7; "Tax On Excess Pension"; Decimal)
        {
        }
        field(8; "Loan Market Rate"; Decimal)
        {
        }
        field(9; "Loan Corporate Rate"; Decimal)
        {
        }
        field(10; "Taxable Pay (Normal)"; Decimal)
        {
        }
        field(11; "Taxable Pay (Agricultural)"; Decimal)
        {
        }
        field(12; "NHIF Based on"; Option)
        {
            OptionMembers = Gross,Basic,"Taxable Pay";
        }
        field(13; "NSSF Employee"; Decimal)
        {
        }
        field(14; "NSSF Employer Factor"; Decimal)
        {
        }
        field(15; "OOI Deduction"; Decimal)
        {
        }
        field(16; "OOI December"; Decimal)
        {
        }
        field(17; "Security Day (U)"; Decimal)
        {
        }
        field(18; "Security Night (U)"; Decimal)
        {
        }
        field(19; "Ayah (U)"; Decimal)
        {
        }
        field(20; "Gardener (U)"; Decimal)
        {
        }
        field(21; "Security Day (R)"; Decimal)
        {
        }
        field(22; "Security Night (R)"; Decimal)
        {
        }
        field(23; "Ayah (R)"; Decimal)
        {
        }
        field(24; "Gardener (R)"; Decimal)
        {
        }
        field(25; "Benefit Threshold"; Decimal)
        {
        }
        field(26; "NSSF Based on"; Option)
        {
            OptionMembers = Gross,Basic,"Taxable Pay";
        }
        field(27; "Value Posting"; Decimal)
        {
        }
        field(28; "Disbled Tax Limit"; Decimal)
        {
        }
        field(29; "Minimum Relief Amount"; Decimal)
        {
        }
        field(30; "Secondary Tax Percentage"; Decimal)
        {
        }
        field(31; "Mortgage Relief Percentage"; Decimal)
        {
        }
        field(32; "Payslip Message"; Text[50])
        {
        }
        field(33; "PWD Staff Retirement Age"; Decimal)
        {
        }
        field(34; "Other Staff Retirement Age"; Decimal)
        {
        }
        field(35; "Minimum Taxable Pay"; Decimal)
        {
        }

        field(36; "Enable Payroll Proration"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Enable Relief On PAYE Only"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50100; "PrPension Employer Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50101; "PrPension Employee Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50102; "Housing Employee Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50105; "Implement Housing Levy"; Boolean)
        {
        }
        field(50103; "Employee Housing Levy"; Decimal)
        {
        }
        field(50104; "Employer Housing Levy"; Decimal)
        {
        }
        field(50107; "Bank File Path"; text[200])
        {
        }

    }

    keys
    {
        key(Key1; "Setup Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

