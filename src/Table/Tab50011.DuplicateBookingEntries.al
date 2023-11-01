#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50011 "Duplicate Booking Entries"
{

    fields
    {
        field(1;"Stud Reg No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Part";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Paper;Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Stud Reg No",Examination,"Part",Paper)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

