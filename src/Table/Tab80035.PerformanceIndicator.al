#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80035 "Performance Indicator"
{
    DrillDownPageID = "Performance Indicators";
    LookupPageID = "Performance Indicators";

    fields
    {
        field(1;KPI;Code[150])
        {
            DataClassification = ToBeClassified;
            Description = 'KPI';
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Perfomance Indicator';
        }
        field(3;"Unit of Measure";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
    }

    keys
    {
        key(Key1;KPI)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

