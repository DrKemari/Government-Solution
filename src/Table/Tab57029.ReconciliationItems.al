#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57029 "Reconciliation Items"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Bank Account No.";Code[20])
        {
            Caption = 'Bank Account No.';
            TableRelation = "Bank Account";
        }
        field(3;"Document No.";Code[20])
        {
            Caption = 'Document No.';
        }
        field(4;"Transaction Date";Date)
        {
            Caption = 'Transaction Date';
        }
        field(5;Description;Text[100])
        {
            Caption = 'Description';
        }
        field(6;"Statement Amount";Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Statement Amount';
        }
        field(7;Reconciled;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Reconciled On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Reconciled By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

