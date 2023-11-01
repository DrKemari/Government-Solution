#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85004 "Exam Timetable Entry"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Exam Cycle ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(3;"Course ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(4;Paper;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;
        }
        field(5;Section;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section;
        }
        field(6;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Exam Shift ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Shift";
        }
        field(8;"Exam Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Exams End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(12;Duration;Duration)
        {
            DataClassification = ToBeClassified;
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

