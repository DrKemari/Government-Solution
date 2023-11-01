#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75078 "Invitation To Tender"
{
    Editable = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Approve,Release,Posting,Prepare,Order,Request Approval,Print/Send,Navigate';
    SourceTable = "Standard Purchase Code";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies a code which identifies this standard purchase code.';
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Invitation Notice Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field("Tender Summary"; Rec."Tender Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Summary field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field("Stage 1 EOI Invitation"; Rec."Stage 1 EOI Invitation")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Stage 1 EOI Invitation field.';
                }
                field("PRN No."; Rec."PRN No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                    ToolTip = 'Specifies the value of the PRN No. field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a description of the standard purchase code.';
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Procurement Type field.';
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition Product Group field.';
                }
                field("Procurement Category ID"; Rec."Procurement Category ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Procurement Category ID field.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Lot No. field.';
                }
                field("Target Bidder Group"; Rec."Target Bidder Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Target Bidder Group field.';
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Solicitation Type field.';
                }
                field("Bid Selection Method"; Rec."Bid Selection Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Selection Method field.';
                }
                field("Requisition Template ID"; Rec."Requisition Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Requisition Template ID field.';
                }
                field("Bid Scoring Template"; Rec."Bid Scoring Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Criteria';
                    ToolTip = 'Specifies the value of the Evaluation Criteria field.';
                }
                field("Bid Opening Committe"; Rec."Bid Opening Committe")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bid Opening Committe field.';
                }
                field("Bid Evaluation Committe"; Rec."Bid Evaluation Committe")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bid Evaluation Committe field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
                field("Enforce Mandatory Pre-bid Visi"; Rec."Enforce Mandatory Pre-bid Visi")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enforce Mandatory Pre-bid Visit/Meeting field.';
                }
                field("Mandatory Pre-bid Visit Date"; Rec."Mandatory Pre-bid Visit Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandatory Pre-bid Visit Date field.';
                }
                field("Prebid Meeting Address"; Rec."Prebid Meeting Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prebid Meeting Address field.';
                }
                field("Prebid Meeting Register ID"; Rec."Prebid Meeting Register ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Prebid Meeting Register ID field.';
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Envelop Type field.';
                }
                field("Sealed Bids"; Rec."Sealed Bids")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sealed Bids field.';
                }
                field("Tender Validity Duration"; Rec."Tender Validity Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Validity Duration field.';
                }
                field("Tender Validity Expiry Date"; Rec."Tender Validity Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Validity Expiry Date field.';
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Officer';
                    ToolTip = 'Specifies the value of the Procurement Officer field.';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Language Code field.';
                }
                field("Mandatory Special Group Reserv"; Rec."Mandatory Special Group Reserv")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandatory Special Group Reserved field.';
                }
                field("Bid/Tender Security Required"; Rec."Bid/Tender Security Required")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Bid/Tender Security Required field.';
                }
                field("Bid Security %"; Rec."Bid Security %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Bid Security % field.';
                }
                field("Bid Security Amount (LCY)"; Rec."Bid Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bid Security Amount (LCY) field.';
                }
                field("Bid Security Validity Duration"; Rec."Bid Security Validity Duration")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Bid Security Validity Duration field.';
                }
                field("Bid Security Expiry Date"; Rec."Bid Security Expiry Date")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Bid Security Validity Expiry Date field.';
                }
                field("Insurance Cover Required"; Rec."Insurance Cover Required")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Insurance Cover Required field.';
                }
                field("Performance Security Required"; Rec."Performance Security Required")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Performance Security Required field.';
                }
                field("Performance Security %"; Rec."Performance Security %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Performance Security % (Of Bid Sum) field.';
                }
                field("Advance Payment Security Req"; Rec."Advance Payment Security Req")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Advance Payment Security Required field.';
                }
                field("Advance Payment Security %"; Rec."Advance Payment Security %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Advance Payment Security % (Of Bid Sum) field.';
                }
                field("Advance Amount Limit %"; Rec."Advance Amount Limit %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Advance Amount Limit % (Of Bid Sum) field.';
                }
                field("Appointer of Bid Arbitrator"; Rec."Appointer of Bid Arbitrator")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Appointer of Bid Arbitrator field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Bid Submission Method"; Rec."Bid Submission Method")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Bid Submission Method field.';
                }
                field("Cancel Reason Code"; Rec."Cancel Reason Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Cancel Reason Code field.';
                }
                field("Cancellation Date"; Rec."Cancellation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cancellation Date field.';
                }
                field("Cancellation Secret Code"; Rec."Cancellation Secret Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cancellation Secret Code field.';
                }
                field("No. of Submission"; Rec."No. of Submission")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Submission field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created by field.';
                }
            }
            group("Submission Details")
            {
                field("Submission Start Date"; Rec."Submission Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Start Date field.';
                }
                field("Submission Start Time"; Rec."Submission Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Start Time field.';
                }
                field("Submission End Date"; Rec."Submission End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission End Date field.';
                }
                field("Submission End Time"; Rec."Submission End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission End Time field.';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Date field.';
                }
                field("Bid Opening Time"; Rec."Bid Opening Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Time field.';
                }
                field("Bid Opening Venue"; Rec."Bid Opening Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Venue field.';
                }
                field("Procuring Entity Name/Contact"; Rec."Procuring Entity Name/Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procuring Entity Name/Contact field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Tender Box Location Code"; Rec."Tender Box Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Box Location Code field.';
                }
                field("Primary Tender Submission"; Rec."Primary Tender Submission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Tender Submission Address field.';
                }
                field("Primary Engineer Contact"; Rec."Primary Engineer Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Engineer Contact Address field.';
                }
            }
            group("Bid Processing Fee")
            {
                field("Bid Charge Code"; Rec."Bid Charge Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Charge Code field.';
                }
                field("Bid Charge (LCY)"; Rec."Bid Charge (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Charge (LCY) field.';
                }
                field("Bid Charge Bank Code"; Rec."Bid Charge Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Charge Bank Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Account Name field.';
                }
                field("Bid Charge Bank Branch"; Rec."Bid Charge Bank Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Charge Bank Branch field.';
                }
                field("Bid Charge Bank A/C No"; Rec."Bid Charge Bank A/C No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Charge Bank A/C No field.';
                }
            }
            group("Budget Control Checks")
            {
                field("Requesting Region"; Rec."Requesting Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Region field.';
                }
                field("Requesting Directorate"; Rec."Requesting Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Directorate field.';
                }
                field("Requesting Department"; Rec."Requesting Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Department field.';
                }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan ID field.';
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan Entry No field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Job No.';
                    ToolTip = 'Specifies the value of the PP Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Job Task No.';
                    ToolTip = 'Specifies the value of the PP Job Task No. field.';
                }
                field("PP Planning Category"; Rec."PP Planning Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP Planning Category field.';
                }
                field("PP Funding Source ID"; Rec."PP Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP Funding Source ID field.';
                }
                field("PP Total Budget"; Rec."PP Total Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP Total Budget field.';
                }
                field("PP Total Actual Costs"; Rec."PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP Total Actual Costs field.';
                }
                field("PP Total Commitments"; Rec."PP Total Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP Total Commitments field.';
                }
                field("PP Total Available Budget"; Rec."PP Total Available Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP Total Available Budget field.';
                }
                field("PP Preference/Reservation Code"; Rec."PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP Preference/Reservation Code field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
            }
            group("Project Details")
            {
                Visible = false;
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Works Category"; Rec."Works Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Category field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Link Name"; Rec."Road Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Link Name field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("Publish Engineers Estimate"; Rec."Publish Engineers Estimate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Publish Engineers Estimate field.';
                }
                field("Engineer Estimate (LCY)"; Rec."Engineer Estimate (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer Estimate (LCY) field.';
                }
                field("Max Works Kickoff Duration"; Rec."Max Works Kickoff Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Works Kickoff Duration (After Contract/Order) field.';
                }
                field("Max Works Charter Duration"; Rec."Max Works Charter Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Works Charter/Program Duration (After Contract/Order) field.';
                }
                field("Max Works Completion Duration"; Rec."Max Works Completion Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Works Completion Duration (After Contract/Order field.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Terms Code field.';
                }
                field("Defects Liability Period"; Rec."Defects Liability Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Defects Liability Period field.';
                }
                field("Daily Liquidated Dam Unit Cost"; Rec."Daily Liquidated Dam Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Liquidated Damages Unit Cost (LCY) field.';
                }
                field("Liquidated Damages Limit %"; Rec."Liquidated Damages Limit %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Liquidated Damages Limit % (Contract Value) field.';
                }
                field("Payment Retention %"; Rec."Payment Retention %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Retention % field.';
                }
                field("Retention Amount Limit %"; Rec."Retention Amount Limit %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Amount Limit % (Contract Value) field.';
                }
                field("Min Interim Certificate Amount"; Rec."Min Interim Certificate Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Interim Certificate Amount (LCY) field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control116; "Approval FactBox")
            {
                SubPageLink = "Table ID" = filter(173),
                              "Document No." = field(Code);
                Visible = true;
                ApplicationArea = Basic;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
                ApplicationArea = Basic;
            }
            systempart(Control113; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control112; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
            systempart(Control108; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control109; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control110; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control111; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."Code" <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "No." = field(Code);
                    ToolTip = 'View or add comments for the record.';
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
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'Executes the Print action.';
                }
            }
        }
        area(processing)
        {
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
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup135)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Enabled = Rec.Status = Rec.Status::open;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                       // ReleasePurchDoc.ReleaseITT(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReopenITT(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy PRN Details';
                    Ellipsis = true;
                    Enabled = Rec."code" <> '';
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        PRN.Reset;
                        PRN.SetRange("No.", Rec."PRN No.");
                        if PRN.FindSet then
                            Procurement.CopyPRNDetails(PRN, Rec);

                    end;
                }
                action("Purchase Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Lines';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = PutawayLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IFS Purchase Lines";
                    RunPageLink = "Standard Purchase Code" = field(Code);
                    ToolTip = 'Executes the Purchase Lines action.';
                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        //Procurement.SuggestProcurementCategories(Rec);

                    end;
                }
                action("Suggest Required Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestRequiredDocITT(Rec);

                    end;
                }
                action("Suggest Tender Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Tender Documents';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestTenderSourceDoc(Rec);

                    end;
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;
                    ToolTip = 'Executes the Attach Document action.';
                    trigger OnAction()
                    begin
                        //DMSManagement.UploadInspectionDocuments(DMSDocuments."Document Type"::Imprest,Code,'Imprest Memo',RECORDID);
                    end;
                }
                action("Publish Invitations")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Published = false;
                    Image = PrintCover;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec.status = Rec.status::Released;
                    ToolTip = 'Executes the Publish Invitations action.';
                    trigger OnAction()
                    begin
                        Procurement.PublishITT(Rec);
                    end;
                }
                action("Intention To Bid")
                {
                    ApplicationArea = Basic;
                    Image = Interaction;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Intention To Bid";
                    RunPageLink = Code = field(Code);
                    ToolTip = 'Executes the Intention To Bid action.';
                }
                action("Activate Evaluations")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Published = true;
                    Image = ActivateDiscounts;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec.status = Rec.status::Released;
                    ToolTip = 'Executes the Activate Evaluations action.';
                    trigger OnAction()
                    begin
                        //Procurement.ActivateEvaluationsIFP(Rec);
                    end;
                }
                action("Close IFP")
                {
                    ApplicationArea = Suite;
                    Caption = 'Close IFP';
                    Enabled = Rec."code" <> '';
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec.status = Rec.status::Released;
                    ToolTip = 'Executes the Close IFP action.';
                    trigger OnAction()
                    begin
                        //Procurement.CloseIFP(Rec);
                    end;
                }
                action("Cancel Invitation")
                {
                    ApplicationArea = Suite;
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec.status = Rec.status::Released;
                    ToolTip = 'Executes the Cancel Invitation action.';
                    trigger OnAction()
                    begin
                        Procurement.CancelIFSInvitation(Rec);
                    end;
                }
                action("IFP Response")
                {
                    ApplicationArea = Basic;
                    Caption = 'IFP Response';
                    Image = ReturnRelated;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "RFI Response List";
                    RunPageLink = "RFI Document No." = field(Code);
                    Visible = false;
                    ToolTip = 'Executes the IFP Response action.';
                }
                action("IFP Evaluations")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Executes the IFP Evaluations action.';
                }
                action("Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Required Document";
                    RunPageLink = "Document No" = field(Code);
                    ToolTip = 'Executes the Required Documents action.';
                }
                action("Create Addendum Notice")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Addendum Notice';
                    Ellipsis = true;
                    Enabled = Rec."code" <> '';
                    Image = CreateForm;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        Procurement.CreateAddendumNoticeITT(Rec);
                    end;
                }
                action(Send)
                {
                    ApplicationArea = Basic;
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send action.';
                }
                action("Tender Securities")
                {
                    ApplicationArea = Basic;
                    Image = SocialSecurity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Securities";
                    RunPageLink = "IFS Code" = field(Code);
                    ToolTip = 'Executes the Tender Securities action.';
                }
                action("Tender Document Sources")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Tender Document Source";
                    RunPageLink = "Document No." = field(Code);
                    ToolTip = 'Executes the Tender Document Sources action.';
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //if //ApprovalsMgmt.CheckIFSApprovalPossible(Rec) then
                        //ApprovalsMgmt.OnSendIFSForApproval(Rec);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //ApprovalsMgmt.OnCancelIFSApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action("Activity Schedules")
                {
                    ApplicationArea = Basic;
                    Image = ElectronicRegister;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    RunObject = Page "IFS Purchase Activity Schedule";
                    RunPageLink = "Document No" = field(Code);
                    ToolTip = 'Executes the Activity Schedules action.';
                }
                action("Preference and Reservations")
                {
                    ApplicationArea = Basic;
                    Image = Reserve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Restricted Vendor Category";
                    RunPageLink = "Document No" = field(Code);
                    ToolTip = 'Executes the Preference and Reservations action.';
                }
                action("Addendum Notices")
                {
                    ApplicationArea = Basic;
                    Image = Change;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Tender Addendum Notice";
                    RunPageLink = "Invitation Notice No." = field(Code);
                    ToolTip = 'Executes the Addendum Notices action.';
                }
                action("Appointed Committees")
                {
                    ApplicationArea = Basic;
                    Image = Agreement;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Tender Committee";
                    RunPageLink = "IFS Code" = field(Code);
                    ToolTip = 'Executes the Appointed Committees action.';
                }
                action("Personnel Specifications")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Key Staff";
                    RunPageLink = "IFS Code" = field(Code);
                    ToolTip = 'Executes the Personnel Specifications action.';
                }
                action("Equipment Specifications")
                {
                    ApplicationArea = Basic;
                    Image = LiFo;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Required Equipment";
                    RunPageLink = "Document No" = field(Code);
                    ToolTip = 'Executes the Equipment Specifications action.';
                }
                action("Major Deliverables")
                {
                    ApplicationArea = Basic;
                    Image = Delivery;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Major Work_Deliverable";
                    RunPageLink = "Document No" = field(Code);
                    ToolTip = 'Executes the Major Deliverables action.';
                }
                action("Related Invitation Notices")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Parent Invitation No" = field(Code);
                    ToolTip = 'Executes the Related Invitation Notices action.';
                }
            }
        }
    }

    var
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PRN: Record "Purchase Header";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin



        // OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        // OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        // CanCancelApprovalForRecord :=  //ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}

#pragma implicitwith restore

