#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85055 "Staff Appoint Experience"
{
    DrillDownPageID = "Appointment Experience";
    LookupPageID = "Appointment Experience";

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Staff Appointment ID";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Appointment Header";
        }
        field(3;"Staff Role Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Experience Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'General Experience,Specialized Experience,Training Experience,No. of Handled Projects,Other Experience';
            OptionMembers = "General Experience","Specialized Experience","Training Experience","No. of Handled Projects","Other Experience";
        }
        field(5;"Minimum Years of Experience";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Minimum Experience Requirement";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Staff Appointment ID","Staff Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

