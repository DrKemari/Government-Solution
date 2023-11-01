#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50055 "tableextension50055" extends "Bank Acc. Reconciliation"
{
    fields
    {
        field(57000; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(57001; "Un Reconciled Amount"; Decimal)
        {
            //  AutoFormatExpression = GetCurrencyCode;
            CalcFormula = sum("Bank Acc. Reconciliation Line".Difference where("Statement Type" = field("Statement Type"),
                                                                                "Bank Account No." = field("Bank Account No."),
                                                                                "Statement No." = field("Statement No."),
                                                                                "Future Receipt Date" = const(true)));
            Caption = 'Un Reconciled Amount';
            Editable = false;
            FieldClass = FlowField;
        }
    }


    //Unsupported feature: Code Modification on "MatchSingle(PROCEDURE 5)".

    //procedure MatchSingle();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MatchBankRecLines.MatchSingle(Rec,DateRange);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     IF "Bank Account No."='BNK0007' THEN
     MatchBankRecLines.MatchSingleKCBNew(Rec,DateRange) ELSE
      MatchBankRecLines.MatchSingle(Rec,DateRange);
    */
    //end;
}

