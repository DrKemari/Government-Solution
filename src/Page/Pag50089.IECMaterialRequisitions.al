#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50089 "IEC Material Requisitions"
{
    ApplicationArea = Basic;
    Caption = 'IEC Material Requisition';
    CardPageID = "IEC Material Requisition";
    Editable = false;
    PageType = List;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = const("Store Requisition"),
                            Status = filter(Open | "Pending Approval"),
                            "Requisition Type" = filter(<> Project));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request-By No. field.';
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request-By Name field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(2);
                    end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                    Visible = true;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                    ToolTip = 'Specifies the date when the order was created.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Type field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                    end;
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F7';
                    ToolTip = 'Executes the Statistics action.';
                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader;
                        Commit;
                        Page.RunModal(Page::"Purchase Order Statistics", Rec);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = false;
                    ToolTip = 'Executes the Approvals action.';
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
        }
        area(processing)
        {
            group(General)
            {
                Caption = 'General';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Enabled = false;
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                    //    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //    //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Enabled = false;
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                    //  //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //   //ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1102601023)
                {
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.SendPurchaseApprovalRequest(Rec) THEN;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.CancelPurchaseApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                separator(Action1102601020)
                {
                }
                action("Send IC Purchase Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send IC Purchase Order';
                    Image = IntercompanyOrder;
                    ToolTip = 'Executes the Send IC Purchase Order action.';
                    trigger OnAction()
                    var
                        ICInOutboxMgt: Codeunit ICInboxOutboxMgt;
                        SalesHeader: Record "Sales Header";
                    begin
                        /*
                        IF ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) THEN
                          ICInOutboxMgt.SendPurchDoc(Rec,FALSE);
                        
                        */

                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        Rec.SetRange("Requester ID", UserId);
        Rec.SetSecurityFilterOnRespCenter;

        JobQueueActive := PurchasesPayablesSetup.JobQueueActive;
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        [InDataSet]
        JobQueueActive: Boolean;
        OpenApprovalEntriesExist: Boolean;
}

#pragma implicitwith restore

