#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50035 "pageextension50035" extends "Posted Sales Invoice" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Posted Sales Invoice"(Page 132)".

    actions
    {

        //Unsupported feature: Code Modification on "CreateCreditMemo(Action 33).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF CorrectPostedSalesInvoice.CreateCreditMemoCopyDocument(Rec,SalesHeader) THEN BEGIN
              PAGE.RUN(PAGE::"Sales Credit Memo",SalesHeader);
              CurrPage.CLOSE;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            UserSetup.RESET;
            UserSetup.SETRANGE("User ID",USERID);
            UserSetup.SETRANGE("Create Corrective Credit Memo",TRUE);
            IF UserSetup.FINDFIRST THEN BEGIN
            #1..4
            END ELSE
            ERROR(TXT001);
            */
        //end;
    }

    var
        UserSetup: Record "User Setup";
        TXT001: label 'You do not have sufficient rights to create a corrective credit memo.Consult the system admin';
}

