#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85425 "MCQ Template Lines"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Starting No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Ending No";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Starting No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
