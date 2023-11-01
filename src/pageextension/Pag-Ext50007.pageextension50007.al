PageExtension 50007 "pageextension50007" extends "Customer Card"
{

    layout
    {

        addafter(Name)
        {
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = Basic;
                Caption = 'Customer Type';
                Visible = false;
            }
        }
        addafter("Privacy Blocked")
        {
            field("Funding Class"; Rec."Funding Class")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Preferred Bank Account Code")
        {
            field("Customer's Bank"; Rec."Employee's Bank")
            {
                ApplicationArea = Basic;
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ApplicationArea = Basic;
            }
            field("Bank Branch"; Rec."Bank Branch")
            {
                ApplicationArea = Basic;
            }
            field("Bank Branch Name"; Rec."Bank Branch Name")
            {
                ApplicationArea = Basic;
            }
            field("Bank Account Number"; Rec."Bank Account Number")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (Visible) on "NewSalesCreditMemo(Action 1902583505)".

        //     modify(NewSalesInvoiceAddin)
        //     {
        //         Visible = false;
        //     }
        //     modify(Flow)
        //     {
        //         Visible = false;
        //     }
        //     addafter(NewSalesQuoteAddin)
        //     {
        //         action(NewSalesInvoiceAddin)
        //         {
        //             AccessByPermission = TableData "Sales Header"=RIM;
        //             ApplicationArea = Basic,Suite;
        //             Caption = 'Sales Invoice';
        //             Image = NewSalesInvoice;
        //             Promoted = true;
        //             PromotedCategory = Category4;
        //             PromotedOnly = true;
        //             ToolTip = 'Create a sales invoice for the customer.';
        //             Visible = IsOfficeAddin;

        //             trigger OnAction()
        //             begin
        //                 CreateAndShowNewInvoice;
        //             end;
        //         }
        //     }
        //     addafter(CancelApprovalRequest)
        //     {
        //         group(Flow)
        //         {
        //             Caption = 'Flow';
        //         }
        //     }
        // }

        //Unsupported feature: Property Deletion (RefreshOnActivate).

    }

}
