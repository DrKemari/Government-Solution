#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50074 "pageextension50074" extends "Workflow User Group Members" 
{
    layout
    {

        //Unsupported feature: Code Insertion on ""User Name"(Control 3)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            UserSetup.RESET;
            UserSetup.SETRANGE("User ID",USERID);
            UserSetup.SETRANGE("ICT Administrator",FALSE);
            IF UserSetup.FIND('-') THEN
               ERROR('You are not allowed to modify this document,contact System Administrator');
            */
        //end;


        //Unsupported feature: Code Insertion on ""Sequence No."(Control 4)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            UserSetup.RESET;
            UserSetup.SETRANGE("User ID",USERID);
            UserSetup.SETRANGE("ICT Administrator",FALSE);
            IF UserSetup.FIND('-') THEN
               ERROR('You are not allowed to modify this document,contact System Administrator');
            */
        //end;
    }

    var
        UserSetup: Record "User Setup";
}

