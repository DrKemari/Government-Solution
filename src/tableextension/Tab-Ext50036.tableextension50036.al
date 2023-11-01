#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50036 "tableextension50036" extends "Job Ledger Entry" 
{

    //Unsupported feature: Code Insertion (VariableCollection) on "OnInsert".

    //trigger (Variable: GenJnlPostPreview)()
    //Parameters and return type have not been exported.
    //begin
        /*
        */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Job.UpdateOverBudgetValue("Job No.",TRUE,"Total Cost (LCY)");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        Job.UpdateOverBudgetValue("Job No.",TRUE,"Total Cost (LCY)");
        //GenJnlPostPreview.SaveJobLedgEntry(Rec);
        */
    //end;

    var
        GenJnlPostPreview: Codeunit "Gen. Jnl.-Post Preview";
}

