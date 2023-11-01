#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50004 "pageextension50004" extends "Chart of Accounts" 
{
    var
        ObjUserSetUp: Record "User Setup";


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetControlVisibility;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SetControlVisibility;

        // IF ObjUserSetUp.GET(USERID) THEN
        //  "Global Dimension 1 Filter":=ObjUserSetUp."Region Code";
        // //MESSAGE(FORMAT("Global Dimension 1 Filter"));
        */
    //end;
}

