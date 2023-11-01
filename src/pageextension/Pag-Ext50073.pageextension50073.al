#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50073 "pageextension50073" extends Workflow
{
    layout
    {

        //Unsupported feature: Code Modification on "Enabled(Control 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.UPDATE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        UserSetup.RESET;
        UserSetup.SETRANGE("User ID",USERID);
        UserSetup.SETRANGE("ICT Administrator",FALSE);
        IF UserSetup.FIND('-') THEN
           ERROR('You are not allowed to modify this document,contact System Administrat');
        CurrPage.UPDATE;
        */
        //end;

    }
    trigger OnOpenPage()
    begin
        if UserRec.get(database.UserId) then begin
            IF UserRec."Can Manage Workflow" = FALSE then
                ERROR('Please note that you dont have the rights to change workflow!');
        end else begin
            ERROR('Please note that you dont have the rights to change workflow!');
        end;
    end;


    var
        UserSetup: Record "User Setup";
        UserRec: Record "User Setup";
}

