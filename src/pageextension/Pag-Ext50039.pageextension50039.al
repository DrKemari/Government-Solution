#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50039 "pageextension50039" extends "Posted Sales Invoices" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Posted Sales Invoices"(Page 143)".

    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Posting Date"(Control 109)".

        addafter(Amount)
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Currency Code";"Posting Date")
    }
    actions
    {


        //Unsupported feature: Code Modification on "CreateCreditMemo(Action 30).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF CorrectPostedSalesInvoice.CreateCreditMemoCopyDocument(Rec,SalesHeader) THEN
              PAGE.RUN(PAGE::"Sales Credit Memo",SalesHeader);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            UserSetup.RESET;
            UserSetup.SETRANGE("User ID",USERID);
            UserSetup.SETRANGE("Create Corrective Credit Memo",TRUE);
            IF UserSetup.FINDFIRST THEN BEGIN
            IF CorrectPostedSalesInvoice.CreateCreditMemoCopyDocument(Rec,SalesHeader) THEN
              PAGE.RUN(PAGE::"Sales Credit Memo",SalesHeader);END
            ELSE
            ERROR(TXT001);
            */
        //end;
    }

    var
        TXT001: label 'You do not have sufficient rights to create a corrective credit memo.Consult the system admin';
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

