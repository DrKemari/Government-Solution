#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51394 "Group Site Visit Card"
{
    PageType = Card;
    SourceTable = "Evaluation Header";

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
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Insitution Code"; Rec."Insitution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insitution Code field.';
                }
                field("Application Description"; Rec."Application Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Description field.';
                }
                field("Verdict Description"; Rec."Verdict Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Description field.';
                }
                field("Total Chapter Score"; Rec."Total Chapter Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Chapter Score field.';
                }
                field("Institution Email"; Rec."Institution Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Email field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control24; "Group Visit Lines")
            {
                SubPageLink = "Evaluation Header No." = field(Code);
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
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        /*//if //ApprovalsMgmt.CheckAppointmentWorkflowEnabled(Rec) THEN
                          //ApprovalsMgmt.OnSendAppointmentForApproval(Rec);*/
                        Message('');

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        ////ApprovalsMgmt.OnCancelAppointmentApprovalRequest(Rec);
                    end;
                }
                separator(Action26)
                {
                }
                action("Summary Evaluation")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Summary Evaluation action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(51150, true, false, Rec);
                    end;
                }
                action("Detailed Evaluation")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Detailed Evaluation action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(51151, true, false, Rec);
                    end;
                }
                action(Close)
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Close action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Forward the application %1 for approval';
                    begin
                        if Confirm(TXT001, true, Rec."Application Description") = true then begin
                            AccreditationApp.Reset;
                            AccreditationApp.SetRange("Application No.", Rec."Application No.");
                            if AccreditationApp.FindFirst then begin
                                AccreditationApp.Status := AccreditationApp.Status::"Awaiting Board Approval";
                                AccreditationApp.Modify(true);
                            end;
                            Rec.Status := Rec.Status::Completed;
                            Rec.Modify(true);
                        end
                    end;
                }
                action("Suggest Areas")
                {
                    ApplicationArea = Basic;
                    Image = SuggestPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Suggest Areas action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Suggest Assessment Criteria';
                    begin
                        if Confirm(TXT001) = true then begin
                            Examination.AccreditationSuggestEvaluationArea(Rec);
                        end
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        Rec."Percentage Score" := 0;
        Rec.CalcFields("Aggregate Score", "Maximum Aggregate Score");
        if ((Rec."Aggregate Score" > 0) and (Rec."Maximum Aggregate Score" > 0)) then begin
            Rec."Percentage Score" := (Rec."Aggregate Score" / Rec."Maximum Aggregate Score") * 100;
            ScoringSetup.Reset;
            ScoringSetup.SetRange(Blocked, false);
            if ScoringSetup.FindSet then begin
                repeat
                    if ((Rec."Percentage Score" > ScoringSetup."Minimum %") or (Rec."Percentage Score" = ScoringSetup."Minimum %"))
                      and ((Rec."Percentage Score" < ScoringSetup."Maximum %") or (Rec."Percentage Score" = ScoringSetup."Maximum %")) then begin
                        EaluationVerdict := ScoringSetup.Code;

                    end;

                until ScoringSetup.Next = 0;
            end;
        end;
        Rec."Verdict Code" := EaluationVerdict;
        ScoringSetup.Reset;
        ScoringSetup.SetRange(Code, Rec."Verdict Code");
        if ScoringSetup.FindFirst then begin
            Rec."Verdict Description" := ScoringSetup.Description;
        end
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Evaluation;
        Rec."Site Type" := Rec."site type"::Group;
        Rec."Document Type" := Rec."document type"::"Site Visit";
    end;

    var
        ScoringSetup: Record "Evaluation Verdicts";
        EaluationVerdict: Text;
        AccreditationApp: Record "Accreditation Application";
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

