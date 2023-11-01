#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50044 "pageextension50044" extends "Apply Customer Entries" 
{

    //Unsupported feature: Code Modification on "PostDirectApplication(PROCEDURE 15)".

    //procedure PostDirectApplication();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF CalcType = CalcType::Direct THEN BEGIN
          IF ApplyingCustLedgEntry."Entry No." <> 0 THEN BEGIN
            Rec := ApplyingCustLedgEntry;
        #4..10
            END ELSE
              ERROR(Text019);

            IF PreviewMode THEN
              CustEntryApplyPostedEntries.PreviewApply(Rec,NewDocumentNo,NewApplicationDate)
            ELSE
        #17..24
            ERROR(Text002);
        END ELSE
          ERROR(Text003);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..13

        #14..27
        */
    //end;
}

