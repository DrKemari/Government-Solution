#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50020 "pageextension50020" extends "Purchase Order"
{

    //Unsupported feature: Property Insertion (InsertAllowed) on ""Purchase Order"(Page 50)".


    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Purchase Order"(Page 50)".


    //Unsupported feature: Property Insertion (ModifyAllowed) on ""Purchase Order"(Page 50)".


    //Unsupported feature: Property Insertion (DelayedInsert) on ""Purchase Order"(Page 50)".

    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Posting Description"(Control 110)".

        modify("Vendor Shipment No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Vendor Shipment No."(Control 18)".


            //Unsupported feature: Property Modification (Name) on ""Vendor Shipment No."(Control 18)".

        }

        //Unsupported feature: Property Insertion (Visible) on ""Responsibility Center"(Control 131)".

        modify(Status)
        {
            Editable = false;
        }
        modify("Job Queue Status")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Job Queue Status"(Control 7)".


            //Unsupported feature: Property Modification (Name) on ""Job Queue Status"(Control 7)".

        }
        modify("No. of Archived Versions")
        {
            Visible = false;
        }
        modify("Quote No.")
        {
            Visible = false;
        }
        modify("Vendor Order No.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Shipment No."(Control 18)".

        modify("Order Address Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Queue Status"(Control 7)".


        //Unsupported feature: Property Deletion (Importance) on ""Job Queue Status"(Control 7)".


        //Unsupported feature: Property Deletion (Visible) on ""Job Queue Status"(Control 7)".

        addafter("Order Date")
        {
            field("Procurement Type"; Rec."Procurement Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Status)
        {
            field("Receiving No. Series"; Rec."Receiving No. Series")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Due Date"; "Job Queue Status")
        moveafter("Order Date"; "Responsibility Center")
    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on "DocAttach(Action 107)".

        modify("Archive Document")
        {
            Caption = 'Cancel Document';
        }

        //Unsupported feature: Property Insertion (Visible) on ""&Print"(Action 82)".



        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 57).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
          //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //KasnebFunctions.FnSuggestObjectives(Rec);
        TESTFIELD("Procurement Type");
        //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
          //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;


        //Unsupported feature: Code Modification on "Post(Action 79).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Post(CODEUNIT::"Purch.-Post (Yes/No)");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //Added for control Business
        // PVLines.RESET;
        // PVLines.SETRANGE("Document No.","No.");
        // IF PVLines.FIND('-') THEN BEGIN
        //   REPEAT
        //     PVLines.TESTFIELD("Job No.");
        //     PVLines.TESTFIELD("Job Task No.");
        //     UNTIL PVLines.NEXT=0;
        //  END;
        // //End Added for control Business

        UserSetup.GET(USERID);
        IF UserSetup."Post Purchase Documents"=TRUE THEN BEGIN
        Post(CODEUNIT::"Purch.-Post (Yes/No)");
        END ELSE
        ERROR('You do not have permission to post this document, kindly contact system administrator');
        */
        //end;
        addafter("F&unctions")
        {
            group(Committment)
            {
                Caption = 'Committment';
                action("Commit Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Commit Entries';
                    Image = CheckList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        CommittmentMgt.LPOCommittment(Rec);
                    end;
                }
                action("Reverse Commit Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reverse Commit Entries';
                    Image = CancelledEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //CommittmentMgt.ReverseLPOCommittment(Rec);
                    end;
                }
                action("Check Budget Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        /*BCSetup.GET;
                        IF NOT BCSetup.Mandatory THEN
                           EXIT;*/

                        /*F NOT CheckforRequiredFields THEN
                           ERROR('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');*/

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        /*IF SomeLinesCommitted THEN BEGIN
                           IF NOT CONFIRM( 'Some or All the Lines Are already Committed do you want to continue',TRUE, "Document Type") THEN
                                ERROR('Budget Availability Check and Commitment Aborted');
                          DeleteCommitment.RESET;
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::LPO);
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document No.","No.");
                          DeleteCommitment.DELETEALL;
                        END;*/
                        CommittmentMgt.CheckLPOCommittment(Rec);

                        //MESSAGE('Commitments done Successfully for Doc. No %1',"No.");

                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);

                        if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');

                        DeleteCommitment.Reset;
                        DeleteCommitment.SetRange(DeleteCommitment."Commitment Type", DeleteCommitment."commitment type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        DeleteCommitment.DeleteAll;
                        //Tag all the Purchase Line entries as Uncommitted
                        /*PurchLine.RESET;
                        PurchLine.SETRANGE(PurchLine."Document Type","Document Type");
                        PurchLine.SETRANGE(PurchLine."Document No.","No.");
                        IF PurchLine.FIND('-') THEN BEGIN
                           REPEAT
                              PurchLine.Committed:=FALSE;
                              PurchLine.MODIFY;
                           UNTIL PurchLine.NEXT=0;
                        END;*/

                        Message('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");

                    end;
                }
            }
        }
        addfirst(Print)
        {
            action("Print LSO")
            {
                ApplicationArea = Basic;
                Caption = 'Print LSO';
                Image = PrintVoucher;
                Promoted = true;
                PromotedCategory = Category10;
                PromotedIsBig = true;
                Visible = corec;

                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                begin
                    PurchaseHeader.Reset;
                    PurchaseHeader.SetRange("Document Type", Rec."Document Type");
                    PurchaseHeader.SetRange("No.", Rec."No.");
                    if PurchaseHeader.Find then
                        Report.Run(70027, true, false, PurchaseHeader)
                end;
            }
        }
        addafter(SendCustom)
        {
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    DMSManagement.FnUploadPurchaseOrderDocs(Rec."No.", 'Purchase Order', Rec.RecordId);
                end;
            }
        }
    }

    var
        CommittmentMgt: Codeunit "Procurement Processing";
        DeleteCommitment: Record "Commitment Entries1";
        PVLines: Record "Purchase Line";
        KasnebFunctions: Codeunit KasnebFunctions;
        DMSManagement: Codeunit "DMS Management";
        UserSetup: Record "User Setup";
        corec: Boolean;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetDocNoVisible;
    IsSaaS := PermissionManager.SoftwareAsAService;

    #4..7
    END;
    IF ("No." <> '') AND ("Buy-from Vendor No." = '') THEN
      DocumentIsPosted := (NOT GET("Document Type","No."));

    ActivateFields;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
    corec:=FALSE;
    IF Status=Status::Released THEN BEGIN
      corec:=TRUE;
      END;

    ActivateFields;
    */
    //end;
}

#pragma implicitwith restore

