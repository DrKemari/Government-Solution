#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50009 "Student Course Level Buffer"
{

    fields
    {
        field(1;"Student Reg No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Couse Id";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Level;Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Student Reg No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

