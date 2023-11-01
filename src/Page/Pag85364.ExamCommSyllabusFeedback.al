#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85364 "Exam Comm Syllabus Feedback"
{
    Caption = 'Board Syllabus Feedback';
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
                field("Review Status"; Rec."Review Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Status field.';
                }
                field("Board Verdict"; Rec."Board Verdict")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board Verdict field.';
                }
                field("Verdict Date"; Rec."Verdict Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Date field.';
                }
                field("Ordinal Number"; Rec."Ordinal Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ordinal Number field.';
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
            part(Control24; "Exam Comm Syllabus Topics")
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
                action("Close Syllabus Review")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Close Syllabus Review action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Complete the Review Process';
                        TXT002: label 'The Syllabus %1, has been approved and updated succesfully';
                        TXT003: label 'The Syllabus %1, has been rejected and returned to the Examination Commitee';
                    begin
                        Rec.TestField("Board Verdict");
                        Rec.TestField("Verdict Date");
                        if Confirm(TXT001) = true then begin
                            if Rec."Board Verdict" = Rec."board verdict"::Pass then begin
                                AccreditationApp.Reset;
                                AccreditationApp.SetRange("Application No.", Rec."Application No.");
                                if AccreditationApp.FindFirst then begin
                                    AccreditationApp.Status := AccreditationApp.Status::Completed;
                                    AccreditationApp.Modify(true);
                                    //initiate function to move draft syllabus info
                                    Examination.CreateSyllabusNew(AccreditationApp, Rec."Verdict Date");
                                    Message(TXT002, AccreditationApp."Syllabus Name");
                                end;
                            end else begin
                                AccreditationApp.Reset;
                                AccreditationApp.SetRange("Application No.", Rec."Application No.");
                                if AccreditationApp.FindFirst then begin
                                    AccreditationApp.Status := AccreditationApp.Status::"EC Approval";
                                    AccreditationApp.Modify(true);
                                    Message(TXT003, AccreditationApp."Syllabus Name");
                                end;
                            end;
                            Rec.Status := Rec.Status::Completed;
                            Rec.Modify(true);
                        end
                    end;
                }
                action("Revise Syllabus Review")
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Revise Syllabus Review action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Return the review process to %1?';
                        TXT002: label 'The Syllabus %1, has been reurned to the %1 succesfully';
                    begin
                        Rec.TestField("Review Status");
                        if Confirm(TXT001, true, Rec."Review Status") = true then begin
                            AccreditationApp.Reset;
                            AccreditationApp.SetRange("Application No.", Rec."Application No.");
                            if AccreditationApp.FindFirst then begin
                                AccreditationApp.Status := AccreditationApp.Status::Completed;
                                AccreditationApp.Modify(true);
                                //initiate function create a syllabus version
                                Examination.CreateSyllabusVersion(AccreditationApp, Rec."Verdict Date");
                                Message(TXT002, AccreditationApp."Syllabus Name");
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
        Rec."Commitee Type" := Rec."commitee type"::"Examination Committee";
    end;

    var
        ScoringSetup: Record "Evaluation Verdicts";
        EaluationVerdict: Text;
        AccreditationApp: Record "Syllabus Review";
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

