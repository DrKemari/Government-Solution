#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75133 "IFS Intention To Bid"
{
    Caption = 'Recurring Purchase Lines';
    DataCaptionFields = "Vendor No.";
    PageType = ListPart;
    SourceTable = "Standard Vendor Purchase Code";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Category; Category)
                {
                    ApplicationArea = Basic;


                }
                field(VendorNo; "Supplier No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the vendor to which the standard purchase code is assigned.';
                }
                field(VendorName; "Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(VendorPhoneNo; "Vendor Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryEmail; "Primary Email")
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Supplier Details")
            {
                ApplicationArea = Basic;
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to update this supplier email ?', true) then begin
                        myVendor.Reset;
                        myVendor.SetRange("No.", "Vendor No.");
                        if myVendor.FindSet then begin
                            "Primary Email" := myVendor.Email;
                            "Vendor Name" := myVendor.Name;
                            "Invitation Email Sent" := false;
                            Modify(true);
                            Message('Email Updated');
                        end;
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // IF Code<>'' THEN BEGIN
        // StandardPurchaseCode.RESET;
        // StandardPurchaseCode.SETRANGE(Code,Code);
        // IF StandardPurchaseCode.FINDFIRST THEN
        //  IF StandardPurchaseCode."Procurement Category ID"='' THEN BEGIN
        //    ERROR('ERROR! Ensure you have specified a category');
        //    END ELSE BEGIN
        //  Category:=StandardPurchaseCode."Procurement Category ID";
        //      END;
        // MODIFY(TRUE);
        // END;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        // IF Code<>'' THEN BEGIN
        // StandardPurchaseCode.RESET;
        // StandardPurchaseCode.SETRANGE(Code,Code);
        // IF StandardPurchaseCode.FINDFIRST THEN
        //  IF StandardPurchaseCode."Procurement Category ID"='' THEN BEGIN
        //    ERROR('ERROR! Ensure you have specified a category');
        //    END ELSE BEGIN
        //  Category:=StandardPurchaseCode."Procurement Category ID";
        //      END;
        // MODIFY(TRUE);
        // END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // IF Code<>'' THEN BEGIN
        // StandardPurchaseCode.RESET;
        // StandardPurchaseCode.SETRANGE(Code,Code);
        // IF StandardPurchaseCode.FINDFIRST THEN
        //  IF StandardPurchaseCode."Procurement Category ID"='' THEN BEGIN
        //    ERROR('ERROR! Ensure you have specified a category');
        //    END ELSE BEGIN
        //  Category:=StandardPurchaseCode."Procurement Category ID";
        //      END;
        // MODIFY(TRUE);
        // END;
    end;

    trigger OnOpenPage()
    begin
        StandardPurchaseCode.Reset;
        StandardPurchaseCode.SetRange(Code, Code);
        if StandardPurchaseCode.FindSet then begin
            if (StandardPurchaseCode.Status <> StandardPurchaseCode.Status::Open) then begin
                CurrPage.Editable(false);
            end;
        end;
    end;

    var
        StandardPurchaseCode: Record "Standard Purchase Code";
        myVendor: Record Vendor;

    procedure GetSelected(var StdVendPurchCode: Record "Standard Vendor Purchase Code")
    begin
        CurrPage.SetSelectionFilter(StdVendPurchCode);
    end;
}

