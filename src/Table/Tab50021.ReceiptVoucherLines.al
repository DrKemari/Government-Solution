#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50021 "Receipt Voucher Lines"
{

    fields
    {
        field(1;"Reciept Voucher No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;ReceiptNo;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Exam;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Category;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Line Number";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7;"Currency Code";Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency;

            trigger OnValidate()
            begin
                //UpdateCurrencyId;
            end;
        }
        field(8;"Bank Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Reciept Voucher No","Line Number",ReceiptNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

