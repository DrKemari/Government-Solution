#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80262 "Innovation Evaluation Goals"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Evaluation Line"."Document No.";
        }
        field(2;"Invitation ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Evaluation Line"."Invitation ID";
        }
        field(3;"Idea ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Evaluation Line"."Idea ID";
        }
        field(4;"Record Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Overview,Objective,"Additional Notes";
        }
        field(5;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Invitation ID","Idea ID","Record Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

