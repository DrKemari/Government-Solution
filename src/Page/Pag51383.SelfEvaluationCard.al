#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51383 "Self Evaluation Card"
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
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Insitution Code"; Rec."Insitution Code")
                {
                    ApplicationArea = Basic;
                }
                field("Application Description"; Rec."Application Description")
                {
                    ApplicationArea = Basic;
                }
                field("Aggregate Score"; Rec."Aggregate Score")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Aggregate Score"; Rec."Maximum Aggregate Score")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Score"; Rec."Percentage Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Verdict Description"; Rec."Verdict Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Institution Email"; Rec."Institution Email")
                {
                    ApplicationArea = Basic;
                }
                field(Published; Rec.Published)
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control24; "Accreditation Lines")
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

                    trigger OnAction()
                    begin
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(51151, true, false, Rec);
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
        Rec.Type := Rec.Type::"Self-Evaluation";
    end;

    var
        ScoringSetup: Record "Evaluation Verdicts";
        EaluationVerdict: Text;
}

#pragma implicitwith restore

