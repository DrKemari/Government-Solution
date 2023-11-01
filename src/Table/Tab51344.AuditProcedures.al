#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51344 "Audit Procedures"
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
        field(4;Description;Text[250])
        {
        }
        field(5;"Entry No";Integer)
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

