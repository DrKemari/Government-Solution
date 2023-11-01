#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50018 "pageextension50018" extends "Sales Credit Memo" 
{

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetControlAppearance;
        WorkDescription := GetWorkDescription;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SetControlAppearance;
        WorkDescription := GetWorkDescription;
        "Posting Date":=TODAY;
        MODIFY(TRUE);
        COMMIT;
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);
        #4..10
        SetControlAppearance;
        IF ("No." <> '') AND ("Sell-to Customer No." = '') THEN
          DocumentIsPosted := (NOT GET("Document Type","No."));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..13
        "Posting Date":=TODAY;
        MODIFY(TRUE);
        COMMIT;
        */
    //end;
}

