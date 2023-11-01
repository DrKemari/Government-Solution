#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50129 "pageextension50129" extends "Sales Credit Memos" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Sales Credit Memos"(Page 9302)".

    var
        UserSetup: Record "User Setup";
        TXT001: label 'You do not have sufficient rights to access the credit memos page.Consult the system administrator';


    //Unsupported feature: Code Insertion (VariableCollection) on "OnOpenPage".

    //trigger (Variable: UserSetup)()
    //Parameters and return type have not been exported.
    //begin
        /*
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetSecurityFilterOnRespCenter;
        JobQueueActive := SalesSetup.JobQueueActive;

        CopySellToCustomerFilter;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*

        UserSetup.RESET;
        UserSetup.SETRANGE("User ID",USERID);
        UserSetup.SETRANGE("Create Corrective Credit Memo",TRUE);
        IF NOT UserSetup.FINDFIRST THEN
          ERROR(TXT001);
        #1..4
        */
    //end;
}

