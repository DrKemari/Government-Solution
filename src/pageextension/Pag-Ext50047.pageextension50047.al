#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50047 "pageextension50047" extends "Report Selection - Purchase" 
{

    //Unsupported feature: Code Modification on "SetUsageFilter(PROCEDURE 1)".

    //procedure SetUsageFilter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ModifyRec THEN
          IF MODIFY THEN;
        FILTERGROUP(2);
        CASE ReportUsage2 OF
          ReportUsage2::Quote:
            SETRANGE(Usage,Usage::"P.Quote");
          ReportUsage2::"Blanket Order":
            SETRANGE(Usage,Usage::"P.Blanket");
          ReportUsage2::Order:
        #10..36
        END;
        FILTERGROUP(0);
        CurrPage.UPDATE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        {IF ModifyRec THEN
        #2..6
          {ReportUsage2::"p.requisition":
            SETRANGE(Usage,Usage::"P.Requisition");}
          ReportUsage2::PRequisition:
          SETRANGE(Usage,Usage::"P.Requisition");
        #7..39
        }//****Commented by Morris during upgrade
        */
    //end;
}

