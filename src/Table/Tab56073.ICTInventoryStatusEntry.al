#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56073 "ICT Inventory Status Entry"
{

    fields
    {
        field(1;"ICT Inventory No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Inventory".Code;
        }
        field(2;Status;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Conducted By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Time;Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7;"Final Year";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Remarks;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Current;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10;Closed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Closed On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Closed By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"ICT Inventory No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

