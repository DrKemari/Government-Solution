#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85020 "Exam Zones"
{
    DrillDownPageID = "Exam Zones";
    LookupPageID = "Exam Zones";

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Region Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Regions".Code;
        }
        field(3;"Zone Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. of Exam Centers";Integer)
        {
            CalcFormula = count("Examination Centres" where ("Exam Zone"=field(Code)));
            FieldClass = FlowField;
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
        fieldgroup(DropDown;"Zone Name")
        {
        }
    }
}

