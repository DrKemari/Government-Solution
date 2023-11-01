#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50031 "tableextension50031" extends "Purch. Inv. Line" 
{
    fields
    {
        field(70000;"Procurement Plan";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70001;"Procurement Plan Item";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan1"."Plan Item No" where ("Plan Year"=field("Procurement Plan"));

            trigger OnValidate()
            begin
                
                  /* ProcurementPlan.RESET;
                  ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
                 IF ProcurementPlan.FIND('-') THEN BEGIN
                 IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                   Type:=Type::Item;
                   No:=ProcurementPlan."No.";
                 END;
                 IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                  Type:=Type::"Non Stock";
                  No:=ProcurementPlan."Source of Funds";
                 END;
                   "Budget Line":=ProcurementPlan."Source of Funds";
                    Description:=ProcurementPlan."Item Description";
                   "Unit of Measure":=ProcurementPlan."Unit of Measure";
                   "Unit Price":=ProcurementPlan."Unit Price";
                 END;
                */

            end;
        }
        field(70002;"Requisition Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Approved,Rejected;
        }
        field(70003;"Requisition Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70004;"Requisition Type1";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Purchase Requisition,Store Requisition,Imprest,Claim-Accounting,Appointment,Payment Voucher';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Purchase Requisition","Store Requisition",Imprest,"Claim-Accounting",Appointment,"Payment Voucher";
        }
        field(70005;Committed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70006;"Request Generated";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70007;"Process Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Direct,RFQ,RFP,Tender;
        }
        field(70008;"Contract No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70009;"Activity Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',WorkPlan,Admin & PE,Proc Plan';
            OptionMembers = ,WorkPlan,"Admin & PE","Proc Plan";

            trigger OnValidate()
            begin
                /*
                CashMngt.GET;
                GLSetup.GET;
                "Current Budget":=GLSetup."Current Budget";
                //message('%1',"Current Budget");
                */

            end;
        }
        field(70010;Activity;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70011;"Current Budget";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(70012;"BD Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70013;"Total Amount";Decimal)
        {
            CalcFormula = sum("Purch. Inv. Line".Amount where ("Document No."=field("No.")));
            FieldClass = FlowField;
        }
        field(70014;"Purchase Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchases Types";
        }
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

