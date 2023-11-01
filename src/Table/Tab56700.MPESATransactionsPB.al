#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56700 "MPESA Transactions PB"
{

    fields
    {
        field(1;"Account No";Code[30])
        {
        }
        field(2;"Account Name";Text[50])
        {
        }
        field(3;"Mpesa ReceiptNO";Code[30])
        {
        }
        field(4;"Transaction Date";Date)
        {
        }
        field(5;"Transaction Time";Time)
        {
        }
        field(6;"Telephone Number";Code[30])
        {
        }
        field(7;Posted;Boolean)
        {
        }
        field(8;"Date Posted";DateTime)
        {
        }
        field(9;Entry;Integer)
        {
            AutoIncrement = true;
        }
        field(10;Status;Option)
        {
            OptionCaption = 'Pending,Completed,Failed';
            OptionMembers = Pending,Completed,Failed;
        }
        field(11;Amount;Decimal)
        {
        }
        field(12;"Paybill Acc Balance";Decimal)
        {
        }
        field(13;Description;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"Account No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

