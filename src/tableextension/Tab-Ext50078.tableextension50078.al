#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50078 "tableextension50078" extends "Job Queue Entry" 
{

    //Unsupported feature: Variable Insertion (Variable: ExaminationSetup) (VariableCollection) on "SetDefaultValues(PROCEDURE 6)".


    //Unsupported feature: Code Modification on "SetDefaultValues(PROCEDURE 6)".

    //procedure SetDefaultValues();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Last Ready State" := CURRENTDATETIME;
        "User Language ID" := Language.GetLanguageID(Language.GetUserLanguage);
        IF SetupUserId THEN
          "User ID" := USERID;
        "No. of Attempts to Run" := 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "Last Ready State" := CURRENTDATETIME;
        "User Language ID" := Language.GetLanguageID(Language.GetUserLanguage);
        ExaminationSetup.GET;
        IF SetupUserId THEN
         // "User ID" := USERID;
           "User ID" := ExaminationSetup."Student Portal User";
        "No. of Attempts to Run" := 0;
        */
    //end;
}

