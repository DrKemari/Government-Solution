#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 50240 "Evaluation Training needs"
{
    //DrillDownPageID = "Evaluation Training Needs";
    //LookupPageID = "Evaluation Training Needs";

    fields
    {
        field(1; "Perfomance Evaluation No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Evaluation".No;
        }
        field(2; "Training Need Number"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Training Need Category"; Code[30])
        {
            DataClassification = ToBeClassified;
           // TableRelation = "Evaluation Needs Category".Code;
        }
        field(4; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Perfomance Evaluation No", "Training Need Number", "Training Need Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

