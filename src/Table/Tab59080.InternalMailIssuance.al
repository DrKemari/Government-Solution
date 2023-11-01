#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59080 "Internal Mail Issuance"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Issued To";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Issued To Employee No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Issued to Employee Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Issued By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Issued On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

