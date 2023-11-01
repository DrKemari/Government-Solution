#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80110 "Strategic Int Planning Lines"
{
    DrillDownPageID = "Strategic Int Planning Lines";
    LookupPageID = "Strategic Int Planning Lines";

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
        field(18;"Annual Reporting Codes";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "CSP Planned Years"."Annual Year Code" where ("CSP Code"=field("Strategic Plan ID"));

            trigger OnValidate()
            begin
                "Weight%":=100;
            end;
        }
        field(19;"Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Target Budget";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Primary Directorate";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(22;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Primary Department";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"),
                                                           "Direct Reports To"=field("Primary Directorate"));
        }
        field(24;"Weight%";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1;"Strategic Plan ID","Theme ID","Objective ID","Strategy ID","Code","Primary Directorate","Annual Reporting Codes","Primary Department")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

