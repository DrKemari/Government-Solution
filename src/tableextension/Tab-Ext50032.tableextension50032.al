#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50032 "tableextension50032" extends "Purch. Cr. Memo Line" 
{
    fields
    {
        field(70015;"Procurement Plan ID";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code;
        }
        field(70016;"Procurement Plan Entry No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan Entry"."Entry No." where ("Procurement Plan ID"=field("Procurement Plan Entry No"));

            trigger OnValidate()
            begin
                /* PlanItem.RESET;
                 PlanItem.SETRANGE("Plan Item No","Procurement Plan Item");
                 IF PlanItem.FIND('-') THEN
                   "Procurement Plan Item Descript":=PlanItem."Item Description";*/

            end;
        }
    }
}

