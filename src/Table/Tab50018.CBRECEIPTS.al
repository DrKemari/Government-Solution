#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50018 "CBRECEIPTS"
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
        field(3;ReceivedFrom;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;RegNo;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;FullRegNo;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;LastUser;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;MDate;DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(8;PaymentType;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9;TotalAmount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;RefNo;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;CurrencyCode;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;Amount1;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;PaymentType1;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;ChequeNo1;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15;ChequeDate1;DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16;BankFrom1;Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(17;Amount2;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;PaymentType2;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19;ChequeNo2;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(20;ChequeDate2;DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(21;BankFrom2;Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(22;UnAppliedAmount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23;Remarks;Code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(24;ReceiptSource;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25;FirstExam;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26;FirstRenewal;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27;MStream;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(28;PaymentMode;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(29;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30;CancelReason;Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(31;MCancelled;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(32;Printed;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(33;IDNo;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(34;OtherDetails;Code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(35;AmountApplied;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36;UnappliedRefunded;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37;ExamsRefunded;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(38;MLastNo;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39;Audited;Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(40;AuditedBy;Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(41;AuditedOn;DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(42;AuditComment;Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(43;ClearedBy;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(44;ClearedOn;DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(45;ClearComment;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(46;Address1;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(47;Address2;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(48;Address3;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(49;Address4;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50;Address5;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(51;TranType;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(52;TranMode;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(53;TelephoneNo;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(54;AllExams;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(55;AllRenewal;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(56;AllExemption;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(57;AllExamsAdv;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(58;AllRegistration;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59;MRegNo;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(60;Source;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(61;jptranid;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(62;BankEntryNo;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(63;TimeEntered;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(64;status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'open,Posted';
            OptionMembers = open,Posted;
        }
        field(65;Id;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(66;"Nav Payment Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(67;"Nav Receipt Total";Decimal)
        {
            CalcFormula = sum(CBRECDET.Amount where (ReceiptNo=field(ReceiptNo)));
            FieldClass = FlowField;
        }
        field(68;"Nav Posted";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(69;"Nav Posted Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70;"Nav Posted By";Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

