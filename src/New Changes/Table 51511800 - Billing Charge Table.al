table 50031 "Billing Charge Table"
{
    //DrillDownPageID = 51511457;
    // LookupPageID = 51511457;

    fields
    {
        field(1; "Service Type Description"; Text[250])
        {
        }
        field(10; "Service Type"; Text[250])
        {

            trigger OnValidate();
            begin
                "Service Type Description" := "Service Type" + ' -' + Description;
            end;
        }
        field(20; Description; Text[250])
        {

            trigger OnValidate();
            begin
                "Service Type Description" := "Service Type" + ' -' + Description;
            end;
        }
        field(21; Charges; Decimal)
        {
        }
        field(22; "Income G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(23; "G/L Account Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("G/L Account".Name WHERE("No." = FIELD("Income G/L Account")));

        }
        field(24; "Service Code"; Code[20])
        {
        }
        field(25; Display; Boolean)
        {
        }
        field(26; ApplicationFee; Decimal)
        {
        }
        field(27; PenaltyRate; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Service Type Description")
        {
        }
    }

    fieldgroups
    {
    }
}

