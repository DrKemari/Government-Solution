#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85005 "Exam Calendar Resource Matrix"
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
        field(7;"Exam Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";
        }
        field(8;"Resource No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(9;"Exam Role Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Role Type";
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

