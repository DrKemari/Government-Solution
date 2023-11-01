#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51330 "Subject Area Contact Hrs"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Quality Response No.";Code[30])
        {
        }
        field(3;"Subject Area";Text[50])
        {
            //TableRelation = Customer."No." where (Type=const("2"));
        }
        field(4;"Course Unit";Code[30])
        {
            TableRelation = "Quality Response Programme Org"."Course Unit";
        }
        field(5;"Contact Hours";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Instition: Record "Audit Response Sub-Lines";
}

