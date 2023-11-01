#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80275 "additional AWP Indicators"
{
    DrillDownPageID = "Performance Indicators";
    LookupPageID = "Performance Indicators";

    fields
    {
        field(1;No;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Strategy Plan ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(3;"Activity ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Initiative".Code where ("Strategic Plan ID"=field("Strategy Plan ID"));

            trigger OnValidate()
            begin
                /*StrategicInt.RESET;
                StrategicInt.SETRANGE(Code,"Activity ID");
                IF StrategicInt.FIND('-') THEN BEGIN
                  Description:=StrategicInt.Description;
                  END;*/

            end;
        }
        field(4;"Strategy ID";Code[50])
        {
            DataClassification = ToBeClassified;
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
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

