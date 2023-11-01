#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51332 "Academic Staff Qualification"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
        }
        field(2;"Quality Response No.";Code[30])
        {
        }
        field(3;"Designation Type";Option)
        {
            OptionCaption = 'Full-Time,Part-Time';
            OptionMembers = "Full-Time","Part-Time";
        }
        field(4;"Desgination Code";Code[30])
        {
            TableRelation = "Audit Qualification Categories";
        }
        field(5;"Designation Name";Text[50])
        {
        }
        field(6;"Age Band";Code[30])
        {
        }
        field(7;Gender;Option)
        {
            OptionCaption = 'Male,Female,InterSex';
            OptionMembers = Male,Female,InterSex;
        }
        field(8;"No.";Integer)
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
}

