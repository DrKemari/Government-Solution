#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65046 "Grant Funding Application Card"
{
    PageType = Card;
    SourceTable = "Grant Funding Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("FOA ID"; Rec."FOA ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FOA ID field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Opportunity  Title"; Rec."Opportunity  Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Opportunity  Title field.';
                }
                field("Call Type"; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Call Type field.';
                }
                field("Grant Type"; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grant Type field.';
                }
                field("Justification for Application"; Rec."Justification for Application")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Justification for Application field.';
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Center field.';
                }
                field("Primary Research Program ID"; Rec."Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Research Program ID field.';
                }
                field("Primary Research Area"; Rec."Primary Research Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Research Area field.';
                }
                field("Principal Investigator"; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Investigator field.';
                }
                field("Grant Admin Team Code"; Rec."Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Admin Team Code field.';
                }
                field("Application Status"; Rec."Application Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Closed Date"; Rec."Closed Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed Date field.';
                }
            }
            group("Award Info")
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if Rec."Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
                        else
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = Action::OK then begin
                            Rec.Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                        //SalesCalcDiscountByType.ApplyDefaultInvoiceDiscount(0,Rec);
                    end;
                }
                field("Requested Grant Amount"; Rec."Requested Grant Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Grant Amount field.';
                }
                field("Requested Grant Amount(LCY)"; Rec."Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Grant Amount(LCY) field.';
                }
            }
            group("Deadlines && Dates")
            {
                field("Application Due Date"; Rec."Application Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Due Date field.';
                }
                field("Application Submitted Date"; Rec."Application Submitted Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Submitted Date field.';
                }
                field("Estimated Award Date"; Rec."Estimated Award Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated Award Date field.';
                }
            }
            group("Grantor Information")
            {
                field("Grantor No."; Rec."Grantor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor No. field.';
                }
                field("Grantor Name"; Rec."Grantor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grantor Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address2 field.';
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
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No field.';
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No field.';
                }
                field("Grantor Research Contact ID"; Rec."Grantor Research Contact ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Research Contact ID field.';
                }
                field("Grantor Research Reviewer"; Rec."Grantor Research Reviewer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grantor Research Reviewer field.';
                }
                field("Grantor Admin Contact ID"; Rec."Grantor Admin Contact ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Admin Contact ID field.';
                }
                field("Grantor Admin Name"; Rec."Grantor Admin Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grantor Admin Name field.';
                }
                field("Grantor Finance Contact ID"; Rec."Grantor Finance Contact ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Finance Contact ID field.';
                }
                field("Grantor Finance Contact"; Rec."Grantor Finance Contact")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grantor Finance Contact field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control46; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control47; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control48; MyNotes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Grant Research Objectives")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Grant Research Objectives List";
                RunPageLink = "Grant Application ID" = field("Application No");
                ToolTip = 'Executes the Grant Research Objectives action.';
            }
            action("Proposed Grant Budget")
            {
                ApplicationArea = Basic;
                Image = CopyBudget;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Grant Budget Summary List";
                RunPageLink = "Grant Application ID" = field("Application No");
                ToolTip = 'Executes the Proposed Grant Budget action.';
            }
            separator(Action58)
            {
            }
            action("Research Teams")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Research Teams action.';
            }
            action("Administrative Tasks")
            {
                ApplicationArea = Basic;
                Image = Task;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Grant Admin Tasks List";
                RunPageLink = "Sourec Document No." = field("Application No");
                ToolTip = 'Executes the Administrative Tasks action.';
            }
            action("Secondary  Programs")
            {
                ApplicationArea = Basic;
                Image = TeamSales;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "Secondary Research Programs";
                RunPageLink = "GFA No" = field("Application No"),
                              "Research Center" = field("Research Center");
                ToolTip = 'Executes the Secondary  Programs action.';
            }
            separator(Action61)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                var
                //ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);//status must be open.
                    Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                                                     //if //ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) then
                                                     //ApprovalsMgmt.OnSendGFAForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                    Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                    //ApprovalsMgmt.""(Rec);
                end;
            }
            separator(Action65)
            {
            }
            action("Research Approval Committees")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Research Approval Committees action.';
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
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
            separator(Action57)
            {
            }
            action("Print Grant Proposal")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Print Grant Proposal action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Application No", Rec."Application No");
                    Report.Run(65021, true, true, Rec)
                end;
            }
            action("Send Grant Proposal")
            {
                ApplicationArea = Basic;
                Image = SendAsPDF;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Send Grant Proposal action.';
                trigger OnAction()
                begin
                    Message('Send Summary to research team');
                end;
            }
        }
    }

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

#pragma implicitwith restore

