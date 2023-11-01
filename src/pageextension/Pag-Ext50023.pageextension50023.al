#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50023 "pageextension50023" extends "Purchase Order Subform" 
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on ""Reserved Quantity"(Control 42)".


        //Unsupported feature: Property Modification (Name) on ""Reserved Quantity"(Control 42)".

        modify("Job Remaining Qty.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Job Remaining Qty."(Control 9)".


            //Unsupported feature: Property Modification (Name) on ""Job Remaining Qty."(Control 9)".

        }

        //Unsupported feature: Property Modification (Visible) on ""Job No."(Control 126)".


        //Unsupported feature: Property Modification (Visible) on ""Job Task No."(Control 128)".


        //Unsupported feature: Property Deletion (Visible) on ""VAT Prod. Posting Group"(Control 14)".


        //Unsupported feature: Property Deletion (BlankZero) on ""Reserved Quantity"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Remaining Qty."(Control 9)".


        //Unsupported feature: Property Deletion (BlankZero) on ""Job Remaining Qty."(Control 9)".


        //Unsupported feature: Property Deletion (Visible) on ""Job Remaining Qty."(Control 9)".

        addafter(Nonstock)
        {
            field("VAT %"; Rec."VAT %")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Unit of Measure")
        {
            field("Approved Requisition Amount"; Rec."Approved Requisition Amount")
            {
                ApplicationArea = Basic;
            }
            field("Approved Unit Cost"; Rec."Approved Unit Cost")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Line Amount")
        {
            field("Procurement Plan"; Rec."Procurement Plan")
            {
                ApplicationArea = Basic;
            }
            field("Procurement Plan Item"; Rec."Procurement Plan Item")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Quantity Invoiced")
        {
            field("Qty. Rcd. Not Invoiced"; Rec."Qty. Rcd. Not Invoiced")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Deferral Code")
        {
            field("Depreciation Book Code"; Rec."Depreciation Book Code")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Document No.")
        {
            field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = Basic;
            }
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter(Quantity;"Unit of Measure Code")
        moveafter("Unit Price (LCY)";"Line Amount")
        //moveafter("Available Funds";"Line Discount %")
        moveafter("Line Discount %";"Line Discount Amount")
    }
}

#pragma implicitwith restore

