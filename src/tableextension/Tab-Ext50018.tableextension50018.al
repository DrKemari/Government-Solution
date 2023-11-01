#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50018 "tableextension50018" extends "Gen. Journal Line" 
{
    fields
    {
        field(50000;"JV Creator USER ID";Code[20])
        {
            Editable = false;
        }
        field(50001;"Shortcut Dimension 3 Code";Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(50002;"Shortcut Dimension 4 Code";Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(50003;"Shortcut Dimension 5 Code";Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(50007;"Transaction Type";Option)
        {
            OptionCaption = ',Contribution,Withdrawal,Interest,Transfer,Corporation Tax,Death Lumpsum';
            OptionMembers = ,Contribution,Withdrawal,Interest,Transfer,"Corporation Tax","Death Lumpsum";
        }
        field(50008;"Exemption Type";Option)
        {
            OptionMembers = ,"Tax Exempt","Non Tax Exempt";
        }
        field(50009;"Investment Code";Code[100])
        {
            TableRelation = "Investment Asset" where ("Asset Type"=filter(<>" "));
        }
        field(50010;"No. Of Units";Decimal)
        {
        }
        field(50011;"Investment Transcation Type";Option)
        {
            OptionCaption = ' ,Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,Share-split,Premium,Discounts,Other Income,Expenses,Deposit,Withdrawal';
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Deposit,Withdrawal;
        }
        field(50012;Payee;Code[20])
        {
        }
        field(50013;"GL Code";Code[20])
        {
        }
        field(50014;"Expected Receipt date";Date)
        {
        }
        field(50015;"Cheque Type";Code[20])
        {
        }
        field(50016;"Drawer Bank Name";Code[20])
        {
        }
        field(50017;"Books Closure Date";Date)
        {
        }
        field(50018;"Payment Date";Date)
        {
        }
        field(50019;"Broker/Agency Name";Text[50])
        {
        }
        field(50020;"Sales Rep. No.";Code[20])
        {
        }
        field(50021;"Sales Rep. Name";Text[50])
        {
        }
        field(50022;"Share Of Risk (%)";Decimal)
        {
        }
        field(50023;"Endorsement No.";Code[100])
        {
        }
        field(50024;"Commission Rate";Decimal)
        {
        }
        field(50025;"Commission Amount";Decimal)
        {
        }
        field(50026;"Net Premium";Decimal)
        {
        }
        field(50027;"Business Source";Option)
        {
            OptionCaption = ' ,Direct,Facultative';
            OptionMembers = " ","1","2";
        }
        field(50028;"Business Line";Option)
        {
            OptionCaption = ' ,COM,COM-MOU,PLS,PLS-MOU';
            OptionMembers = " ","1","2","3","4";
        }
        field(50029;"Business Class";Code[10])
        {
        }
        field(50030;Department;Code[20])
        {
        }
        field(50032;"Type of Investment";Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
        }
        field(50033;"Deposit No.";Code[20])
        {
        }
        field(50034;"Deposit Slip";Boolean)
        {
        }
        field(50037;"Drawer Branch Name";Text[20])
        {
        }
        field(50042;Invest;Boolean)
        {
        }
        field(50044;"UT Member No";Code[20])
        {
        }
        field(50045;"unit Trust Type";Option)
        {
            OptionCaption = ',Equity,Money Market,Growth';
            OptionMembers = ,Equity,"Money Market",Growth;
        }
        field(50048;"Payment Category";Option)
        {
            Description = 'To tag all payments made to members who have exited the scheme';
            OptionMembers = " ",NormalPayment,"School Fees",Upkeep;
        }
        field(50049;"First Premium";Decimal)
        {
        }
        field(50050;"PCF  Levy";Decimal)
        {
        }
        field(50051;"Training Levy";Decimal)
        {
        }
        field(50052;"Stamp Duty";Decimal)
        {
        }
        field(50053;"Yellow Card";Decimal)
        {
        }
        field(50054;"Period Start";Date)
        {
        }
        field(50055;"Period End";Date)
        {
        }
        field(50056;"Percentage Of Share";Decimal)
        {
        }
        field(50057;"Total Renewable Premium";Decimal)
        {
        }
        field(50058;"R/I Code";Option)
        {
            OptionMembers = "1","2","3","4","5","6";
        }
        field(50059;"Fund Code";Code[20])
        {
            TableRelation = "Fund Code".Code;
        }
        field(50060;"Custodian Code";Code[20])
        {
            TableRelation = "Custodian Code".Code;
        }
        field(70000;"Procurement Plan";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70001;"Procurement Plan Item";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan1"."Plan Item No" where ("Plan Year"=field("Procurement Plan"));

            trigger OnValidate()
            begin
                
                  /* ProcurementPlan.RESET;
                  ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
                 IF ProcurementPlan.FIND('-') THEN BEGIN
                 IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                   Type:=Type::Item;
                   No:=ProcurementPlan."No.";
                 END;
                 IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                  Type:=Type::"Non Stock";
                  No:=ProcurementPlan."Source of Funds";
                 END;
                   "Budget Line":=ProcurementPlan."Source of Funds";
                    Description:=ProcurementPlan."Item Description";
                   "Unit of Measure":=ProcurementPlan."Unit of Measure";
                   "Unit Price":=ProcurementPlan."Unit Price";
                 END;
                */

            end;
        }
        field(70002;"Responsibility Center";Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
    }


    //Unsupported feature: Code Modification on "CopyFromInvoicePostBuffer(PROCEDURE 112)".

    //procedure CopyFromInvoicePostBuffer();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Account No." := InvoicePostBuffer."G/L Account";
        "System-Created Entry" := InvoicePostBuffer."System-Created Entry";
        "Gen. Bus. Posting Group" := InvoicePostBuffer."Gen. Bus. Posting Group";
        #4..23
        "VAT Difference" := InvoicePostBuffer."VAT Difference";
        "VAT Base Before Pmt. Disc." := InvoicePostBuffer."VAT Base Before Pmt. Disc.";

        OnAfterCopyGenJnlLineFromInvPostBuffer(InvoicePostBuffer,Rec);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..26
        //added by daudi for procurement plan
        "Procurement Plan":=InvoicePostBuffer."Procurement Plan";
        "Procurement Plan Item":=InvoicePostBuffer."Procurement Plan Item";
        "Responsibility Center":=InvoicePostBuffer."Responsibility Center";

        OnAfterCopyGenJnlLineFromInvPostBuffer(InvoicePostBuffer,Rec);
        */
    //end;
}

