#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85315 "Images Logs"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Customer No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"ID Number";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Picture Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

