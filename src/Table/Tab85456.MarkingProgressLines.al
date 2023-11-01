#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85456 "Marking Progress Lines"
{
    DrillDownPageID = Subjects;
    LookupPageID = Subjects;

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Course; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3; Section; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where(Course = field(Course));
        }
        field(4; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level where(Course = field(Course));
        }
        field(5; Description; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "No. of Passed Students"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. of  Failed Students"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
        field(10; Practical; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Marking Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Marking End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Checking Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Checking End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Entering Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Entering End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Clearing(Markers) Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Clearing(Markers) End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Comparing Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Comparing End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Clearing(Papers) Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Clearing(Papers) End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Packing Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Packing End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Keying in Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Keying in End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Proof Reading Start Date"; Date)
        {
            Caption = '1st Proof Reading Start Date';
            DataClassification = ToBeClassified;
        }
        field(29; "Proof Reading End  Date"; Date)
        {
            Caption = '1st  Proof Reading End  Date';
            DataClassification = ToBeClassified;
        }
        field(30; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(31; "2nd Proof Reading Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "2nd Proof Reading End  Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Confim of Corr Start Date"; Date)
        {
            Caption = 'Confirmation of Corrections Start Date';
            DataClassification = ToBeClassified;
        }
        field(34; "Confim of Corr  End  Date"; Date)
        {
            Caption = 'Confirmation of Corrections End  Date';
            DataClassification = ToBeClassified;
        }
        field(35; "Clearing Team Leaders  Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
