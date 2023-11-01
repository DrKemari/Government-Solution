#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51253 "Accreditation Trainers"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Course Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3;"Course Section";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where (Course=field("Course Code"));
        }
        field(4;"No. of Parttime Students";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Fulltime Students";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. of Parttime Trainers";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. of Fulltime Trainers";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Highest Trainer Qualification";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Lowest Trainer Qualification";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Min Lec Hrs Per Week Trainer";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Max Lec Hrs Per Week Trainer";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Min Course Hrs Per Week Sem";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Max Course Hrs Per Week Sem";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(16;"Course Part";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level where (Course=field("Course Code"));
        }
        field(17;"Highest Trainer experience";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Lowest Trainer experience";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Max no of hrs per paper per wk";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Min no of hrs per paper per wk";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

