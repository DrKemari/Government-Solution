table 50033 "Customer Payments"
{

    fields
    {
        field(1; "Customer ID"; Code[20])
        {
            TableRelation = "Customer Ticked"."No.";
        }
        field(2; "Customer Name"; Text[50])
        {
        }
        field(3; "Payment Code"; Code[20])
        {
        }
        field(4; "Payment Code 2"; Code[20])
        {
        }
        field(5; "Bank Name"; Text[50])
        {
        }
        field(6; "Payment Date"; Date)
        {
        }
        field(7; "Paid By"; Text[50])
        {
        }
        field(8; "Phone Number"; Text[50])
        {
        }
        field(9; Amount; Decimal)
        {
        }
        field(10; "User ID"; Text[80])
        {
        }
    }

    keys
    {
        key(Key1; "Customer ID")
        {
        }
    }

    fieldgroups
    {
    }
}

