#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51501 "Quality Audit Plan"
{
    PageType = Card;
    SourceTable = "Audit Plan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer"; Rec."Responsible Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Total Planned Budget"; Rec."Total Planned Budget")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Course Quality Audit"; Rec."No. of Course Quality Audit")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Inst. Quality Audit"; Rec."No. of Inst. Quality Audit")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control22; "Audit Planning Lines")
            {
                SubPageLink = "Audit Plan Header" = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control39; "Audit Plan Statistics")
            {
                SubPageLink = Code = field(Code);
                ApplicationArea = Basic;
            }
            systempart(Control18; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup33)
            {
                action("Planning Objectives")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Plan Objectives";
                    RunPageLink = "Quality Audit No." = field(Code);
                }
                action("Audit Procedures")
                {
                    ApplicationArea = Basic;
                    Image = Production;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Plan Procedure";
                    RunPageLink = "Audit Plan No." = field(Code);
                }
                action("Audit Scope")
                {
                    ApplicationArea = Basic;
                    Image = AvailableToPromise;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Plan Scope";
                    RunPageLink = "Audit Plan No." = field(Code);
                }
                action("Suggest Upcoming Audit Items")
                {
                    ApplicationArea = Basic;
                    Image = SuggestLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Suggest upcoming audit items';
                    begin
                        if Confirm(TXT001) = true then begin
                            //         QualityAudit.SuggestAuditItems(Rec);
                        end
                    end;
                }
            }
            group(ActionGroup34)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action31)
                {
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Message('');
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                    //   //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Message('');
                    end;
                }
                separator(Action30)
                {
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                    //     //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('');
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                    //  //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('');
                    end;
                }
            }
            group(ActionGroup26)
            {
                Caption = 'Print';
                Image = Print;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(51300, true, false, Rec);
                end;
            }
        }
    }

    var
        QualityAudit: Codeunit "Accreditation-Quality Audit";
}

#pragma implicitwith restore

