#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80098 "Objective Template"
{

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Global;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Primary Responsibility Center";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(5;"Corporate Strategic Plan ID";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(6;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
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
    }
}

