#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51508 "Audit Engagement"
{
    Caption = 'Audit Engagement';
    PageType = Card;
    SourceTable = "Audit Requisition Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Audit Plan No."; Rec."Audit Plan No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan No. field.';
                }
                field("Audit Plan Item"; Rec."Audit Plan Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Item field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Audit Plan Start Date"; Rec."Audit Plan Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Start Date field.';
                }
                field("Audit Plan End Date"; Rec."Audit Plan End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan End Date field.';
                }
                field("Insitution/Programme No."; Rec."Insitution/Programme No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insitution/Programme No. field.';
                }
                field("Institution Code"; Rec."Institution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Code field.';
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name field.';
                }
                field("Institution Email"; Rec."Institution Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Email field.';
                }
                field("Expected Submission End Date"; Rec."Expected Submission End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Submission End Date field.';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer No. field.';
                }
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officer Name field.';
                }
                field("SAR Template No."; Rec."SAR Template No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SAR Template No. field.';
                }
                field("SAR Template Description"; Rec."SAR Template Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SAR Template Description field.';
                }
                field("No. Of Questions"; Rec."No. Of Questions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Questions field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Published By"; Rec."Published By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published By field.';
                }
                field("Published On"; Rec."Published On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published On field.';
                }
            }
            part(Control41; "Engagement Auditor Team")
            {
                SubPageLink = "Document No." = field(Code);
                ApplicationArea = Basic;
            }
            part(Control24; "Audit Engagement Lines")
            {
                Caption = 'Audit Questions';
                SubPageLink = "Audit Requisition No." = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Suggest Audit Details")
            {
                ApplicationArea = Basic;
                Image = SuggestLines;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Audit Details action.';
                trigger OnAction()
                var
                    TXT001: label 'Suggest Quality Audit Details?';
                begin
                    if Confirm(TXT001) = true then begin
                    //    AccreditationQualityAudit.SuggestAuditDetails(Rec);
                    end
                end;
            }
            action("Suggest Questions")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Questions action.';
                trigger OnAction()
                begin
                    if Confirm(TXT001) = true then begin
                      //  AccreditationQualityAudit.SuggestQuestionFromTemplate(Rec);
                    end
                end;
            }
            action("Publish Request")
            {
                ApplicationArea = Basic;
                Image = PostMail;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Initiate Response Request for institution';

                trigger OnAction()
                var
                    TXT001: label 'Publish the request to the institution portal';
                begin
                    Rec.TestField("Expected Submission End Date");
                    if Confirm(TXT001) = true then begin
                        //  AccreditationQualityAudit.NotifyInstitutionOnAudit(Rec);
                        Rec.Published := true;
                        Rec."Published By" := UserId;
                        Rec."Published On" := Today;
                    end
                end;
            }
            action("Audit Objectives")
            {
                ApplicationArea = Basic;
                Image = Opportunity;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Audit Objectives";
               // RunPageLink = "Audit Item No." = field("Audit Plan Item"),
                            //  "Audit Plan No." = field(Code);
                ToolTip = 'Executes the Audit Objectives action.';
            }
            action("Audit Locations")
            {
                ApplicationArea = Basic;
                Image = Lock;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Audit Plan Locations";
                RunPageLink = "Audit Plan No." = field(Code),
                              "Audit Item No." = field("Audit Plan Item");
                ToolTip = 'Executes the Audit Locations action.';
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Audit Plan Procedure";
                RunPageLink = "Audit Item No." = field("Audit Plan Item"),
                              "Audit Plan No." = field(Code);
                ToolTip = 'Executes the Audit Procedures action.';
            }
            action("Audit Scope")
            {
                ApplicationArea = Basic;
                Image = AvailableToPromise;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Audit Plan Scope";
                RunPageLink = "Audit Item No." = field("Audit Plan Item"),
                              "Audit Plan No." = field(Code);
                ToolTip = 'Executes the Audit Scope action.';
            }
            action("Audit Engagement Letter")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Audit Engagement Letter action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(51301, true, true, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                RunObject = Page "Dimension Set Entries";
                ToolTip = 'Executes the Dimensions action.';
            }
        }
        area(creation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = false;
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;
                    Message('Document Released successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = false;
                ToolTip = 'Executes the Reopen action.';
                trigger OnAction()
                begin
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify;
                    Message('Document Reopened successfully');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(51302, true, false, Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Engagement;
    end;

    var
        AccreditationQualityAudit: Codeunit "Accreditation-Quality Audit";
        TXT001: label 'Suggest Questions from the template selected?';
}

#pragma implicitwith restore

