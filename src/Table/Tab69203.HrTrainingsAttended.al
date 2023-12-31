#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69203 "Hr Trainings Attended"
{

    fields
    {
        field(1;"Application No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Job Applications"."Application No";
        }
        field(2;"Job ID";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"From Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"To Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Institution;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Course Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Id Number";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Employee No";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Code";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(12;Attained;Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

