#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57032 "Insurance Lines"
{

    fields
    {
        field(1;Entry;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Employee No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(4;"Employee Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Premium;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Comment;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Entry,"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

