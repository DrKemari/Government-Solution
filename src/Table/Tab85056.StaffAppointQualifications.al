#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85056 "Staff Appoint Qualifications"
{
    DrillDownPageID = "Appointment Qualifications";
    LookupPageID = "Appointment Qualifications";

    fields
    {
        field(1;"Line No.";Integer)
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
        field(4;"Qualification Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Masters,Post-Graduate,Under-Graduate,HND-Diploma,Diploma,A-Level,O-Level,Professional Certification';
            OptionMembers = ,Masters,"Post-Graduate","Under-Graduate","HND-Diploma",Diploma,"A-Level","O-Level","Professional Certification";
        }
        field(5;"Qualification Description";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Staff Appointment ID","Staff Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

