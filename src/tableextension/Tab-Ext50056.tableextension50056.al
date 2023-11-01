#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50056 "tableextension50056" extends "Bank Acc. Reconciliation Line" 
{
    fields
    {
        field(57000;"Reconciliation ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(57001;"Receipt Date";Date)
        {
            DataClassification = ToBeClassified;
            Description = 'For KCB Bank Rec';
        }
        field(57002;"Future Receipt Date";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'For KCB Bank Rec';
        }
        field(57003;"Original Statement No";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'For KCB Bank Rec';
        }
        field(57004;"Moved From Previous Bank Rec";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'For KCB Bank Rec';
        }
        field(57005;"Move Date";Date)
        {
            DataClassification = ToBeClassified;
            Description = 'For KCB Bank Rec';
        }
        field(57006;"Move Time";Time)
        {
            DataClassification = ToBeClassified;
            Description = 'For KCB Bank Rec';
        }
    }


    //Unsupported feature: Code Modification on "FilterBankRecLines(PROCEDURE 20)".

    //procedure FilterBankRecLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RESET;
        SETRANGE("Statement Type",BankAccRecon."Statement Type");
        SETRANGE("Bank Account No.",BankAccRecon."Bank Account No.");
        SETRANGE("Statement No.",BankAccRecon."Statement No.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        //Added By Morris to filter out Future Receipts
        SETRANGE("Future Receipt Date",FALSE);
        */
    //end;
}

