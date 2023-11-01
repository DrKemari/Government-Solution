#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50076 "tableextension50076" extends "Approval Entry" 
{
    fields
    {
        modify("Document Type")
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Imprest Memo,staff Claims,Payment Voucher,Petty Cash,Imprest,Surrender,Payroll,Store Requisition,Purchase Requisition,Leave Application,Bank Transfer,Transport Requisition,Sclaims,Salary Voucher,Grant Funding Application,Procurement,Salary Advance,File Movement,Receipt Processing,RFI,Vend Debarment,Project Funding Request,Temp Salary Voucher,Payment Schedule,Warrant Voucher,Bank Reconciliation,ICT Issuance';

            //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 2)".

        }
        field(32;"From Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"To Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Original Approver ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    //Unsupported feature: Variable Insertion (Variable: Payments) (VariableCollection) on "RecordDetails(PROCEDURE 3)".



    //Unsupported feature: Code Modification on "RecordDetails(PROCEDURE 3)".

    //procedure RecordDetails();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT RecRef.GET("Record ID to Approve") THEN
          EXIT(RecNotExistTxt);

        #4..19
                STRSUBSTNO(
                  '%1 ; %2: %3',PurchHeader."Buy-from Vendor Name",PurchHeader.FIELDCAPTION(Amount),PurchHeader.Amount);
            END;
          ELSE
            Details := FORMAT("Record ID to Approve",0,1) + ChangeRecordDetails;
        END;

        OnAfterGetRecordDetails(RecRef,ChangeRecordDetails,Details);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..22
          DATABASE::Payments:
            BEGIN
              RecRef.SETTABLE(Payments);
              Payments.CALCFIELDS("Total Net Amount");
              Details :=
                STRSUBSTNO(
                  '%1 ; %2: %3',Payments.Payee,Payments.FIELDCAPTION("Total Net Amount"),Payments."Total Net Amount");
            END;
        #23..27
        */
    //end;
}

