#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85095 "Bank Import Entries"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Bank Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(3;"Transaction Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Reference No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Student Identifier";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Examination Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Form Serial No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Category Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Category Name";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Student Name";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Amount;Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Remaining Amount":=Amount;
            end;
        }
        field(12;Closed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Applied Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Remaining Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Registration No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"M-PESA Code";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17;Details;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Mobile No";Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(19;Branch;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Closed By";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Closed On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        TXT001: label 'You cannot delete a posted transaction';
    begin
        // IF Posted=TRUE THEN
        //  ERROR(TXT001);
    end;
}

