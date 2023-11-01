#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50007 "tableextension50007" extends "Cust. Ledger Entry" 
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on "Amount(Field 13)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Remaining Amount"(Field 14)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Original Amt. (LCY)"(Field 15)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Remaining Amt. (LCY)"(Field 16)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Amount (LCY)"(Field 17)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Debit Amount"(Field 58)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Credit Amount"(Field 59)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Debit Amount (LCY)"(Field 60)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Credit Amount (LCY)"(Field 61)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Original Amount"(Field 75)".

        field(85000;"Registration No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account";
        }
        field(85001;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Student Processing Header";
        }
    }


    //Unsupported feature: Code Insertion on "OnInsert".

    //trigger OnInsert()
    //var
        //GenJnlPostPreview: Codeunit "Gen. Jnl.-Post Preview";
    //begin
        /*
        //GenJnlPostPreview.SaveCustLedgEntry(Rec);
        */
    //end;
}

