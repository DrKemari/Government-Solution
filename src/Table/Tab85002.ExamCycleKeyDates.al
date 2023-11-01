#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85002 "Exam Cycle Key Dates"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Course ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3;"Transaction Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Transaction Type";
        }
        field(4;Description;Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(6;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Discount Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

