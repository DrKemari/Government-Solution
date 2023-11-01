#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51271 "Accreditation Computer Details"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"No. of Computers";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Processor type";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Processor speed";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"RAM Capacity";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Hard disk capacity";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

