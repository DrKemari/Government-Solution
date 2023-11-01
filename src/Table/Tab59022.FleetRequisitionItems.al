#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59022 "Fleet Requisition Items"
{

    fields
    {
        field(1;"Ticket No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Requisition Number";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Item Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Quantity;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Purpose;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Returnable;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Item Return Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Serial Number";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Remarks/Comments";Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Ticket No","Requisition Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

