#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50017 "pageextension50017" extends "Sales Invoice" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Sales Invoice"(Page 43)".

    layout
    {

        //Unsupported feature: Code Insertion (VariableCollection) on ""Posting Date"(Control 12).OnValidate".

        //trigger (Variable: UserSetup)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on ""Posting Date"(Control 12).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SaveInvoiceDiscountAmount;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            UserSetup.RESET;
            UserSetup.SETRANGE("User ID",USERID);
            UserSetup.SETRANGE("Modify Invoice Posting Date",TRUE);
            IF NOT UserSetup.FINDFIRST THEN
              ERROR(TXT001);
            SaveInvoiceDiscountAmount;
            */
        //end;
    }
    actions
    {
        addafter(Delegate)
        {
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    DMSManagement.FnUploadPurchaseInvoiceDocuments(Rec."No.",'Purchase Invoice',Rec.RecordId);
                end;
            }
        }
    }

    var
        UserSetup: Record "User Setup";
        TXT001: label 'You do not have sufficient rights to change the posting date.Consult the system administrator';

    var
        DMSManagement: Codeunit "DMS Management";


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);
        #4..18
        IF ("No." <> '') AND ("Sell-to Customer No." = '') THEN
          DocumentIsPosted := (NOT GET("Document Type","No."));
        PaymentServiceVisible := PaymentServiceSetup.IsPaymentServiceVisible;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..21
        IF "No."<>'' THEN BEGIN
        "Posting Date":=TODAY;

         MODIFY(TRUE);
        END
        */
    //end;
}

