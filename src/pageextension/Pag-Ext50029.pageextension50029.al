#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50029 "pageextension50029" extends "Account Schedule" 
{
    layout
    {
        addfirst(Control1)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Dimension 4 Totaling")
        {
            field("G/L Budget Filter"; Rec."G/L Budget Filter")
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        Usersetup: Record "User Setup";


    //Unsupported feature: Code Insertion on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //begin
        /*
        IF Usersetup.GET(USERID) THEN BEGIN
          IF NOT Usersetup."Update Job Status" THEN
            ERROR('PemissionDenied');
         END ELSE BEGIN
          ERROR('UserNotFound');
         END;
        */
    //end;
}

#pragma implicitwith restore

