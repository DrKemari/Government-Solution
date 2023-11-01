#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85408 "Disclosure Training Inst"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Institution Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No." where("Customer Type" = const(Institution));

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                Customer.Reset;
                Customer.SetRange("No.", "Institution Code");
                if Customer.FindFirst then begin
                    "Institution Name" := Customer.Name
                end
            end;
        }
        field(4; "Institution Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Date Commenced Training"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
