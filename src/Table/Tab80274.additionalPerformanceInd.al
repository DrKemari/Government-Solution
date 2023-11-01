#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80274 "additional Performance Ind"
{
    DrillDownPageID = "Performance Indicators";
    LookupPageID = "Performance Indicators";

    fields
    {
        field(1;"Strategic Plan ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2;"Theme ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Theme"."Theme ID" where ("Strategic Plan ID"=field("Strategic Plan ID"));
        }
        field(3;"Objective ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Objective"."Objective ID" where ("Theme ID"=field("Theme ID"),
                                                                        "Strategic Plan ID"=field("Strategic Plan ID"));
        }
        field(4;"Strategy ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Strategy."Strategy ID" where ("Objective ID"=field("Objective ID"),
                                                          "Theme ID"=field("Theme ID"),
                                                          "Objective ID"=field("Objective ID"),
                                                          "Strategic Plan ID"=field("Strategic Plan ID"));
        }
        field(5;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;KPI;Code[150])
        {
            DataClassification = ToBeClassified;
            Description = 'KPI';
        }
        field(7;Description;Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Perfomance Indicator';
        }
        field(8;"Unit of Measure";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
    }

    keys
    {
        key(Key1;"Strategic Plan ID","Theme ID","Objective ID","Strategy ID","Code",KPI)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

