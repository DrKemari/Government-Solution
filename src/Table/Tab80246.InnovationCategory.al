#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80246 "Innovation Category"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No. of Innovation Ideas";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. of Innovation Templates";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

