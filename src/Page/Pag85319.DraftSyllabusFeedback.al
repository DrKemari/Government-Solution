#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85319 "Draft Syllabus Feedback"
{
    Caption = 'Draft Syllabus Feedback';
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
                field("Application Description"; Rec."Application Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Description field.';
                }
                field("Meeting Date"; Rec."Meeting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Date field.';
                }
                field("Meeting Time"; Rec."Meeting Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Time field.';
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
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control24; "Syllabus Topics")
            {
                SubPageLink = "Evaluation Header No." = field(Code),
                              "Document Type" = field("Document Type"),
                              "Application No." = field("Syllabus No.");
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
                action("Summary Details")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Summary Details action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(85301, true, false, Rec);
                    end;
                }
                action("Close Review Phase")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Close Review Phase action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Initiate Approval Process';
                    begin
                        if Confirm(TXT001, true, Rec."Application Description") = true then begin
                            AccreditationApp.Reset;
                            AccreditationApp.SetRange("Application No.", Rec."Application No.");
                            if AccreditationApp.FindFirst then begin
                                AccreditationApp.Status := AccreditationApp.Status::"ETS Approval";
                                AccreditationApp.Modify(true);
                            end;
                            Rec.Status := Rec.Status::Completed;
                            Rec.Modify(true);
                        end
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Development;
        Rec."Commitee Type" := Rec."commitee type"::"Stakeholder Feedback";
    end;

    var
        ScoringSetup: Record "Evaluation Verdicts";
        EaluationVerdict: Text;
        AccreditationApp: Record "Syllabus Review";
}

#pragma implicitwith restore

