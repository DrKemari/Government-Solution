#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80256 "Innovation Scoresheet"
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
        field(4;"Innovation Rating Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Evaluation Line"."Innovation Rating Template ID";
        }
        field(5;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Category;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Category".Code;
        }
        field(7;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Weighted Score %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Evaluation Result";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'POOR,FAIR,GOOD,VERY GOOD,EXCELLENT';
            OptionMembers = POOR,FAIR,GOOD,"VERY GOOD",EXCELLENT;
        }
    }

    keys
    {
        key(Key1;"Document No","Invitation ID","Idea ID","Innovation Rating Template ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

