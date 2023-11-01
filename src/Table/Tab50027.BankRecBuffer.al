#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50027 "Bank Rec Buffer"
{

    fields
    {
        field(1;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"External Doc";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;entrynumber;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Payment Reference";Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Posting Date","Document No",Amount,"External Doc",entrynumber)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

