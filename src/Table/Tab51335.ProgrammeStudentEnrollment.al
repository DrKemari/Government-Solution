#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51335 "Programme Student Enrollment"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Quality Response No.";Code[30])
        {
        }
        field(3;"Academic Year";Code[30])
        {
        }
        field(4;"Year Name";Text[30])
        {
        }
        field(5;Sponsorship;Option)
        {
            OptionCaption = 'Government,Self';
            OptionMembers = Government,Self;
        }
        field(6;Nationality;Option)
        {
            OptionCaption = 'Kenyan,International';
            OptionMembers = Kenyan,International;
        }
        field(7;Gender;Option)
        {
            OptionCaption = 'Male,Female,InterSex';
            OptionMembers = Male,Female,InterSex;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

