#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51316 "Audit Objectives"
{

    fields
    {
        field(1;"No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Quality Audit No.";Code[30])
        {
        }
        field(3;Description;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"No.","Quality Audit No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

