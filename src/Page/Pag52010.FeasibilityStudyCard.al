#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 52010 "Feasibility Study Card"
{
    AutoSplitKey = false;
    PageType = Document;
    SourceTable = "Road Planning Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field(Constistuency; Rec.Constistuency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constistuency field.';
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Control ID';
                    ToolTip = 'Specifies the value of the Cost Control ID field.';
                }
                field("Project  Name"; Rec."Project  Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project  Name field.';
                }
            }
            part(Control13; "Road Planning Line Subform")
            {
                Caption = 'WorkPlan';
                SubPageLink = "Planning ID" = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control15; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Feasibility Study")
            {
                Caption = 'Feasibility Study';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        /*
                        ShowDocDim;
                        CurrPage.SAVERECORD;
                        */

                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        /*
                        ApprovalEntries.Setfilters(DATABASE::Payments,8,"No.");
                        ApprovalEntries.RUN;
                        */

                    end;
                }
            }
        }
        area(processing)
        {
            action("Feasibility Team")
            {
                ApplicationArea = Basic;
                Image = SalesPerson;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Planning Team List";
                RunPageLink = "Document No." = field("No.");
                ToolTip = 'Executes the Feasibility Team action.';
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Funding Sources")
                {
                    ApplicationArea = Basic;
                    Image = BankContact;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Funding Source List";
                    ToolTip = 'Executes the Funding Sources action.';
                }
                action(Regions)
                {
                    ApplicationArea = Basic;
                    Image = GLBalanceDimension;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Responsibility Center List";
                    ToolTip = 'Executes the Regions action.';
                }
                action("Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Image = Replan;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Procurement Plan action.';
                }
                action("Findings Summary")
                {
                    ApplicationArea = Basic;
                    Image = CoupledUnitOfMeasure;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Findings Summary List";
                    ToolTip = 'Executes the Findings Summary action.';
                }
                action("Recommendations Summary")
                {
                    ApplicationArea = Basic;
                    Image = SuggestCapacity;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Recommendations Summary List";
                    ToolTip = 'Executes the Recommendations Summary action.';
                }
                action("Risks Summary")
                {
                    ApplicationArea = Basic;
                    Image = TotalValueInsuredperFA;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Risk Summary List";
                    ToolTip = 'Executes the Risks Summary action.';
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        /*
                        //TESTFIELD("Funding Source");
                        TESTFIELD(Status,Status::Open);//status must be open.
                        TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        TESTFIELD(Job);
                        TESTFIELD("Job Task No");
                        IF ("Advance Recovery"<>0) AND ("Account No."='')THEN
                        BEGIN
                          ERROR(text0001);
                        END;
                        TESTFIELD("Payment Narration");
                        TESTFIELD(Payee);
                        TESTFIELD(Date);
                        pvheader.RESET;
                        pvheader.SETRANGE(pvheader."No.","No.");
                        IF pvheader.FIND('-') THEN
                          BEGIN
                            pvLines.RESET;
                            pvLines.SETRANGE(pvLines.No,pvheader."No.");
                            IF pvLines.FIND('-') THEN
                        
                              BEGIN
                                REPEAT
                                  pvLines.TESTFIELD(pvLines."Applies to Doc. No");
                                  UNTIL pvLines.NEXT=0;
                                END;
                        
                            END;
                        
                        
                        //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                          //ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                          */

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        /*
                        TESTFIELD(Status,Status::"Pending Approval");//status must be open.
                        TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                        */

                    end;
                }
                separator(Action34)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
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
                        //DocPrint.PrintPurchHeader(Rec);

                        /*
                        SETRANGE("No.","No.");
                        REPORT.RUN(57000,TRUE,TRUE,Rec)
                        */

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
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                    //   //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        /*
                        usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        ReopenPV.PerformManualReopen(Rec);
                        */

                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                    // //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        /*
                        usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        TESTFIELD("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);
                        */

                    end;
                }
                separator(Action28)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = false;
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        //PaymentsPost."Post Payment Voucher"(Rec);
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                    // //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';

                    trigger OnAction()
                    var
                    // //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';

                    trigger OnAction()
                    var
                    ////ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';

                    trigger OnAction()
                    var
                    //  //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Feasibility Study";
    end;
}

#pragma implicitwith restore

