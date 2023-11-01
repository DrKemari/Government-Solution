#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51336 "Quality Programme Leader"
{

    fields
    {
        field(1;"Quality Response No.";Code[30])
        {
        }
        field(2;"ID Number";Code[10])
        {
        }
        field(3;"Full Name";Text[50])
        {
        }
        field(4;"Teaching Experience";Integer)
        {
            Description = 'University Level Teaching Experience';
        }
        field(5;"Bachelor Specialization";Text[30])
        {
        }
        field(6;"Masters Specialization";Text[30])
        {
        }
        field(7;"Doctorate Specialization";Text[30])
        {
        }
        field(8;"Terms of Employment";Option)
        {
            OptionCaption = 'Full-Time,Part-Time';
            OptionMembers = "Full-Time","Part-Time";
        }
        field(9;"Highest Academic Qualification";Code[30])
        {
            TableRelation = Qualification;
        }
    }

    keys
    {
        key(Key1;"Quality Response No.","Doctorate Specialization")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

