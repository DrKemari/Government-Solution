#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85009 "Exam Route Team Entry"
{

    fields
    {
        field(1;"Route Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Resource No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(3;"Appointment Voucher ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Exam Cycle";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(5;"Resource Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Route Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

