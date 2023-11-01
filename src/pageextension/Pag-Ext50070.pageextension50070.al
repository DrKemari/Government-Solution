#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50070 "pageextension50070" extends "Job Planning Lines" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Job Planning Lines"(Page 1007)".

    layout
    {
        modify("Planned Delivery Date")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Planned Delivery Date"(Control 3)".


            //Unsupported feature: Property Modification (Name) on ""Planned Delivery Date"(Control 3)".

        }
        modify(Type)
        {
            OptionCaption = 'Activity,Item,G/L Account,Text';
        }
        modify("Usage Link")
        {
            Visible = false;
        }
        modify("Planning Date")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Planned Delivery Date"(Control 3)".

        modify("Currency Date")
        {
            Visible = false;
        }
        modify("Work Type Code")
        {
            Visible = false;
        }
        modify("Unit of Measure Code")
        {
            Visible = false;
        }
        moveafter("Line Type";"Document No.")
    }
    actions
    {
        modify("Create &Sales Invoice")
        {
            Caption = 'Create &Purchase Invoice';
            ToolTip = 'Use a batch job to help you create purchase invoices for the involved job tasks.';

            //Unsupported feature: Property Modification (Name) on ""Create &Sales Invoice"(Action 51)".

        }
        modify("Create Sales &Credit Memo")
        {
            Caption = 'Create Purchase  &Credit Memo';
            ToolTip = 'Create a purchase credit memo for the selected job planning line.';

            //Unsupported feature: Property Modification (Name) on ""Create Sales &Credit Memo"(Action 60)".

        }
        modify("Sales &Invoices/Credit Memos")
        {
            Caption = 'Purchase Invoice/Credit Memos';
            ToolTip = 'View purchase invoices or purchase credit memos that are related to the selected job.';

            //Unsupported feature: Property Modification (Name) on ""Sales &Invoices/Credit Memos"(Action 69)".

        }
    }
}

