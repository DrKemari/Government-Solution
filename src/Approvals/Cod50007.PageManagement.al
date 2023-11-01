codeunit 57011 "Page Management Ext"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', false, false)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    begin
        PageID := GetConditionalCardPageID(RecordRef);


    end;

    local procedure GetConditionalCardPageID(RecordRef: RecordRef): Integer
    var
        PV: Record "Payments";
        Payments: Record Payments;
        imprest: Record "Imprest Memo";
        Corporate: Record "Corporate Strategic Plans";
        pavement: Record "Pavement Test Header";
        ifp: record "Request For Information";
        pplan: record "Procurement Plan";
        PURCHREQ: Record "Purchase Header";
        Gbatch: record 232;
        Payroll: record "Payroll Header";
        //  measure: record "Measurement &  Payment Header";
        comm: record "ifs tender committee";
    // Budget: Record "Budget Header";
    // TS: Record "Consultant Time Sheet";
    // BankRec: Record "Bank Acc. Reconciliation";
    begin
        case RecordRef.Number of
            database::"Gen. Journal Batch":
                begin
                    RecordRef.SetTable(Gbatch);
                    exit(Page::"General Journal")
                end;

            database::"Payments":
                begin
                    RecordRef.SetTable(PV);
                    if pv."Payment Type" = pv."Payment Type"::"Payment Voucher" then
                        exit(Page::"Payment Voucher")
                    else
                        if pv."Payment Type" = pv."Payment Type"::"Surrender" then
                            exit(Page::"Imprest Surrender")
                        else
                            if pv."Payment Type" = pv."Payment Type"::Imprest then
                                exit(Page::"Imprest Requisition")

                            else
                                if pv."Payment Type" = pv."Payment Type"::"Staff Claim" then
                                    exit(Page::"Staff Claim")
                                else
                                    if pv."Payment Type" = pv."Payment Type"::"Petty Cash" then
                                        exit(Page::"Petty Cash Voucher")
                                    else
                                        if pv."Payment Type" = pv."Payment Type"::"Petty Cash Surrender" then
                                            exit(Page::"Petty Cash Surrender")
                                        else
                                            if pv."Payment Type" = pv."Payment Type"::"Bank Transfer" then
                                                exit(Page::"Bank Transfer")
                                            else
                                                exit(Page::"Imprest Requisition");
                end;
            Database::"Corporate Strategic Plans":
                begin
                    RecordRef.SetTable(Corporate);
                    exit(Page::"All CSP CARD")
                end;
            // Database::"Pavement Test Header":
            //     begin
            //         RecordRef.SetTable(pavement);
            //         exit(Page::"Pavement Lab Test")
            //     end;

            Database::"Payroll Header":
                begin
                    RecordRef.SetTable(Payroll);
                    exit(Page::"Payroll Header")
                end;
            // Database::"Measurement &  Payment Header":
            //     begin
            //         RecordRef.SetTable(measure);
            //         exit(Page::"Advance Payment Certificate")
            //     end;
            Database::"Request For Information":
                begin
                    RecordRef.SetTable(ifp);
                    exit(Page::"IFP Card")
                end;
            Database::"Procurement Plan":
                begin
                    RecordRef.SetTable(pplan);
                    exit(Page::"Procurement Plan Card")
                end;
            Database::"ifs tender committee":
                begin
                    RecordRef.SetTable(comm);
                    exit(Page::"IFS Tender Committee Card")
                end;
            Database::"Purchase Header":
                begin

                    RecordRef.SetTable(PURCHREQ);
                    if PURCHREQ."Document Type" = PURCHREQ."Document Type"::Order then
                        exit(Page::"Purchase Order");

                    if PURCHREQ."Document Type" = PURCHREQ."Document Type"::"Purchase Requisition" then begin
                        if PURCHREQ."PRN Type" = PURCHREQ."PRN Type"::Standard then
                            exit(Page::"Standard Purchase Requisition")
                        else
                            if PURCHREQ."PRN Type" = PURCHREQ."PRN Type"::"Project Works" then
                                exit(Page::"Projects Works PRNs")

                    end;

                    if PURCHREQ."Document Type" = PURCHREQ."Document Type"::"Store Requisition" then begin
                        exit(Page::"Store Requisition")


                    end;
                end;
            Database::"Imprest Memo":
                begin
                    RecordRef.SetTable(imprest);
                    exit(Page::"Imprest Memo")
                end;
        end;
    end;










    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', false, false)]
    // local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    // begin
    //     PageID := GetConditionalCardPageID(RecordRef);


    // end;




    // local procedure GetConditionalCardPageID(RecordRef: RecordRef): Integer
    // var
    //     PV: Record "Payments";
    //     Payments: Record Payments;
    //     PurchaseHeader: Record "Purchase Header";
    // // Budget: Record "Budget Header";
    // // TS: Record "Consultant Time Sheet";
    // // BankRec: Record "Bank Acc. Reconciliation";
    // begin
    //     case RecordRef.Number of
    //         database::"Payments":
    //             begin
    //                 RecordRef.SetTable(PV);
    //                 exit(Page::"Payment Voucher")
    //             end;
    //     end;
    // end;

    //PRN AND STORE REQ-mTR
    /*
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnBeforeGetConditionalCardPageID', '', false, false)]
        local procedure OnBeforeGetConditionalCardPageID(RecRef: RecordRef; var CardPageID: Integer; var IsHandled: Boolean);
        begin
            CardPageID := GetConditionalCardPageID2(RecRef);
        end;

        local procedure GetConditionalCardPageID2(RecRef: RecordRef): Integer
        var
            CardPageID: Integer;
            IsHandled: Boolean;
        begin
            IsHandled := false;
            OnBeforeGetConditionalCardPageID(RecRef, CardPageID, IsHandled);
            if IsHandled then
                exit(CardPageID);

            case RecRef.Number of
                DATABASE::"Purchase Header":
                    exit(GetPurchaseHeaderPageID(RecRef));
            end;
        end;

        local procedure GetPurchaseHeaderPageID(RecRef: RecordRef): Integer
        var
            PurchaseHeader: Record "Purchase Header";
        begin
            RecRef.SetTable(PurchaseHeader);
            case PurchaseHeader."Document Type" of
                PurchaseHeader."Document Type"::Quote:
                    exit(PAGE::"Purchase Quote");
                PurchaseHeader."Document Type"::Order:
                    exit(PAGE::"Purchase Order");
                PurchaseHeader."Document Type"::Invoice:
                    exit(PAGE::"Purchase Invoice");
                PurchaseHeader."Document Type"::"Credit Memo":
                    exit(PAGE::"Purchase Credit Memo");
                PurchaseHeader."Document Type"::"Blanket Order":
                    exit(PAGE::"Blanket Purchase Order");
                PurchaseHeader."Document Type"::"Return Order":
                    exit(PAGE::"Purchase Return Order");
                PurchaseHeader."Document Type"::"Store Requisition":
                    exit(PAGE::"Store Requisition");
                PurchaseHeader."Document Type"::"Purchase Requisition":
                    exit(PAGE::"Standard Purchase Requisition");
            end;

        end;
        */
}
