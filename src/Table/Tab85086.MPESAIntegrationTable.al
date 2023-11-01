#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85086 "MPESA Integration Table"
{

    fields
    {
        field(1;MPESA_TXN_ID;Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Transaction ID from M-Pesa system';
        }
        field(2;MPESA_AMOUNT;Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Transaction Amount (number only)';
        }
        field(3;MPESA_TXN_DATE;DateTime)
        {
            DataClassification = ToBeClassified;
            Description = 'M-Pesa Transaction completion date -        DD/MM/YYYY [e.g. 18/06/2013]';
        }
        field(4;MPESA_TXN_TIME;DateTime)
        {
            DataClassification = ToBeClassified;
            Description = 'M-Pesa Transaction completion time -        HH:MIN:SS [e.g. 13:56:00]';
        }
        field(5;TXN_PAYBILL_NUM;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'M-Pesa paybill used to make the M-Pesa payment e.g. 600113';
        }
        field(6;MSISDN_CUSTOMER;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Customer Phone Number. Format will be [25472xxxxxxx]';
        }
        field(7;ACCOUNT_NUMBER;Code[40])
        {
            DataClassification = ToBeClassified;
            Description = 'Account number as specified by the customer';
        }
        field(8;FIRST_NAME;Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'First name of person making the payment as per m-pesa records';
        }
        field(9;LAST_NAME;Text[40])
        {
            DataClassification = ToBeClassified;
            Description = 'Last name of person making the payment as per m-pesa records';
        }
        field(10;Fetch;Boolean)
        {
            BlankNumbers = BlankZero;
            BlankZero = true;
            DataClassification = ToBeClassified;
        }
        field(11;Account_Balance;Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Paybill Account Balance (number only)';
        }
        field(12;Name;Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Full name of person making the payment';
        }
        field(13;"ID Number";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Applied Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Remaining Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;MPESA_TXN_D;Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;MPESA_TXN_ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        TXT001: label 'Deletion is not allowed on this table';
    begin
        Error(TXT001);
    end;

    trigger OnInsert()
    begin
        "Remaining Amount":=MPESA_AMOUNT;
        Fetch:=false;
    end;

    var
        StudentManagement: Codeunit AxleCodeunit;
        Header: Record "Student Processing Header";
}

