#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50021 "tableextension50021" extends "Acc. Schedule Line" 
{

    //Unsupported feature: Code Insertion on "OnModify".

    //trigger OnModify()
    //begin
        /*
        IF Usersetup.GET(USERID) THEN BEGIN
          IF NOT Usersetup."Update Job Status" THEN
            ERROR('Pemission Denied');
         END ELSE BEGIN
          ERROR('UserNotFound');
         END;
        */
    //end;

    var
        Usersetup: Record "User Setup";
}

