#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85016 "Courses"
{
    DrillDownPageID = Examinations;
    LookupPageID = Examinations;

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Domain ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domain Areas";
        }
        field(3; Description; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Levels"; Integer)
        {
            CalcFormula = count(Level where(Course = field(Code)));
            FieldClass = FlowField;
        }
        field(5; "No. of Sections"; Integer)
        {
            CalcFormula = count(Section where(Course = field(Code)));
            FieldClass = FlowField;
        }
        field(6; "No. of Papers"; Integer)
        {
            CalcFormula = count(Papers where(Course = field(Code)));
            FieldClass = FlowField;
        }
        field(7; "No. of Exam Bookings"; Integer)
        {
        }
        field(8; "No. of Passed"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(10; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Diploma,Professional,Certificate,Vocational,Post-Graduate';
            OptionMembers = Diploma,Professional,Certificate,Vocational,"Post-Graduate";
        }
        field(11; "Certificate Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(12; "Exemption Reference Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(13; "Transfer Course"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(14; "Paper Color"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Result Reference"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Renewal On Booking"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Description 2"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        
        field(19;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Obsolete for training";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Description)
        {
        }
    }

    fieldgroups
    {
    }
}

