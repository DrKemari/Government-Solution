#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50028 "pageextension50028" extends "Account Schedule Names" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Account Schedule Names"(Page 103)".


    //Unsupported feature: Property Insertion (SourceTableView) on ""Account Schedule Names"(Page 103)".

    layout
    {
        addafter("Analysis View Name")
        {
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "EditAccountSchedule(Action 13).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            AccSchedule.SetAccSchedName(Name);
            AccSchedule.RUN;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            UserSetup.RESET;
            UserSetup.SETRANGE("User ID",USERID);
            UserSetup.SETRANGE("Modify Account Schedules",TRUE);
            IF NOT UserSetup.FINDFIRST THEN
              ERROR(TXT001);
            AccSchedule.SetAccSchedName(Name);
            AccSchedule.RUN;
            */
        //end;


        //Unsupported feature: Code Modification on "EditColumnLayoutSetup(Action 7).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ColumnLayout.SetColumnLayoutName("Default Column Layout");
            ColumnLayout.RUN;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            UserSetup.RESET;
            UserSetup.SETRANGE("User ID",USERID);
            UserSetup.SETRANGE("Modify Account Schedules",TRUE);
            IF NOT UserSetup.FINDFIRST THEN
              ERROR(TXT001);
            ColumnLayout.SetColumnLayoutName("Default Column Layout");
            ColumnLayout.RUN;
            */
        //end;
    }

    var
        UserSetup: Record "User Setup";
        TXT001: label 'You do not have sufficient rights to modify account schedules.Consult the system administrator';
}

#pragma implicitwith restore

