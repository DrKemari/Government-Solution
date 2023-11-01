#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51329 "Quality Response Programme Org"
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
        field(3;"Year of Study";Code[10])
        {
        }
        field(4;Semester;Code[10])
        {
        }
        field(5;"Course Unit";Code[10])
        {
        }
        field(6;"Course Unit Type";Option)
        {
            OptionCaption = 'Common,Core,Specialization,Elective';
            OptionMembers = Common,Core,Specialization,Elective;
        }
    }

    keys
    {
        key(Key1;"Entry No","Quality Response No.","Course Unit")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

