#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51343 "Audit Location"
{

    fields
    {
        field(1;"Audit Plan No.";Code[30])
        {
        }
        field(2;"Audit Task Type";Option)
        {
            OptionCaption = 'Institution Quality Audit,Programme Quality Audit,Adhoc Institution Audit,Adhoc Programme Audit';
            OptionMembers = "Institution Quality Audit","Programme Quality Audit","Adhoc Institution Audit","Adhoc Programme Audit";
        }
        field(3;"Audit Item No.";Integer)
        {
        }
        field(4;"Location Name";Text[30])
        {
        }
        field(5;"Contact Person";Text[30])
        {
        }
        field(6;Email;Text[30])
        {
        }
        field(7;Telephone;Text[30])
        {
        }
        field(8;"Entry No";Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1;"Audit Plan No.","Audit Task Type","Audit Item No.","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

