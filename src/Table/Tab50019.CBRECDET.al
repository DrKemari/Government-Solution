#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50019 "CBRECDET"
{

    fields
    {
        field(1;ReceiptNo;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Exam;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;LastUser;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;LastMaintained;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;StudentName;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Category;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;TransactionDesc;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;RegNo;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;PostingCode;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;FullRegNo;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;UnitPrice;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;Units;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;NextRenewalDate;Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(15;FirstExamDate;Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(16;AdvancePayment;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17;DetailType;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18;MLineNo;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19;DateApplied;DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(20;Audited;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(21;AuditedBy;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22;SubCategory;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23;CurrencyCode;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25;ReversalReason;Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(26;Source;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27;Id;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(28;"Nav Payment Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;ReceiptNo,Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

