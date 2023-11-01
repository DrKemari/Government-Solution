#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80340 "Employee Experience"
{
    PageType = Card;
    SourceTable = "Business Research Survey";
    SourceTableView = where("Business Research Category" = const("Employee Experience"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Business Research Template ID"; Rec."Business Research Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Research Template ID field.';
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Respondent Type field.';
                }
                field("Primary Department ID"; Rec."Primary Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department ID field.';
                }
                field("Primary Directorate ID"; Rec."Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate ID field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Published field.';
                }
                field("Response Due Date"; Rec."Response Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Due Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Creation Time field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("No. of Responses"; Rec."No. of Responses")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Responses field.';
                }
            }
            part(Control32; "BR Survey Questions")
            {
                SubPageLink = "Survey ID" = field("Document No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("BR Survey Section")
            {
                ApplicationArea = Basic;
                Caption = 'Survey Section';
                Image = AbsenceCategory;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "BR Survey Section";
                RunPageLink = "Survey ID" = field("Document No.");
                ToolTip = 'Executes the Survey Section action.';
            }
            action("Suggest Business Sections")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Business Sections action.';
                trigger OnAction()
                begin
                    Rec.TestField("Business Research Template ID");
                    BRTemplateSection.Reset;
                    BRTemplateSection.SetRange("Template ID", Rec."Business Research Template ID");
                    if BRTemplateSection.FindFirst then begin
                        repeat
                            BRSurveySection.Init;
                            BRSurveySection."Survey ID" := Rec."Document No.";
                            BRSurveySection."Section Code" := BRTemplateSection."Section Code";
                            BRSurveySection.Description := BRTemplateSection.Description;
                            BRSurveySection."Section Completion Instruction" := BRTemplateSection."Section Completion Instruction";
                            BRSurveySection."No. of Questions" := BRTemplateSection."No. of Questions";
                            BRSurveySection."Total Weight %" := BRTemplateSection."Total Weight %";
                            BRSurveySection.Insert;
                        until BRTemplateSection.Next = 0;
                    end;

                    BRTemplateLine.Reset;
                    BRTemplateLine.SetRange("Template ID", Rec."Business Research Template ID");
                    if BRTemplateLine.FindFirst then begin
                        repeat
                            BRSurveyQuestion.Init;
                            BRSurveyQuestion."Survey ID" := Rec."Document No.";
                            BRSurveyQuestion."Section Code" := BRTemplateLine."Section ID";
                            BRSurveyQuestion."Question ID" := BRTemplateLine."Question ID";
                            BRSurveyQuestion.Question := BRTemplateLine.Question;
                            BRSurveyQuestion."Rating Type" := BRTemplateLine."Rating Type";
                            BRSurveyQuestion."Option Text Response Type" := BRTemplateLine."Option Text Response Type";
                            BRSurveyQuestion."Assigned Weight %" := BRTemplateLine."Assigned Weight %";
                            BRSurveyQuestion."Desired Perfomance Direction" := BRTemplateLine."Desired Perfomance Direction";
                            BRSurveyQuestion."Question Type" := BRTemplateLine."Question Type";
                            BRSurveyQuestion."Branch Logic Question" := BRTemplateLine."Branch Logic Question";
                            BRSurveyQuestion."Response Type" := BRTemplateLine."Response Type";
                            BRSurveyQuestion.Mandatory := BRTemplateLine.Mandatory;
                            BRSurveyQuestion.Insert;

                            BRTemplateScoreGuide.Reset;
                            BRTemplateScoreGuide.SetRange("Template ID", Rec."Business Research Template ID");
                            BRTemplateScoreGuide.SetRange("Section ID", BRTemplateLine."Section ID");
                            BRTemplateScoreGuide.SetRange("Question ID", BRTemplateLine."Question ID");
                            if BRTemplateScoreGuide.FindFirst then begin
                                repeat
                                    BRSurveyScoreGuide.Init;
                                    BRSurveyScoreGuide."Survey ID" := Rec."Document No.";
                                    BRSurveyScoreGuide."Section Code" := BRTemplateScoreGuide."Section ID";
                                    BRSurveyScoreGuide."Question ID" := BRTemplateScoreGuide."Question ID";
                                    BRSurveyScoreGuide."Line No." := BRTemplateScoreGuide."Line No.";
                                    BRSurveyScoreGuide."Rating Type" := BRTemplateScoreGuide."Rating Type";
                                    BRSurveyScoreGuide."Desired Perfomance Direction" := BRTemplateScoreGuide."Desired Perfomance Direction";
                                    BRSurveyScoreGuide."Response Value" := BRTemplateScoreGuide."Response Value";
                                    BRSurveyScoreGuide."Score %" := BRTemplateScoreGuide."Score %";
                                    BRSurveyScoreGuide.Insert;
                                until BRTemplateScoreGuide.Next = 0;
                            end;


                            BRTemplateLineBranchLogic.Reset;
                            BRTemplateLineBranchLogic.SetRange("Template ID", Rec."Business Research Template ID");
                            BRTemplateLineBranchLogic.SetRange("Section ID", BRTemplateLine."Section ID");
                            BRTemplateLineBranchLogic.SetRange("Parent Question ID", BRTemplateLine."Question ID");
                            if BRTemplateLineBranchLogic.FindFirst then begin
                                repeat
                                    BRBranchSurveyQuestion.Init;
                                    BRBranchSurveyQuestion."Survey ID" := Rec."Document No.";
                                    BRBranchSurveyQuestion."Section Code" := BRTemplateLineBranchLogic."Section ID";
                                    BRBranchSurveyQuestion."Parent Question ID" := BRTemplateLineBranchLogic."Parent Question ID";
                                    BRBranchSurveyQuestion."Parent Response" := BRTemplateLineBranchLogic."Parent Response";
                                    BRBranchSurveyQuestion."Question ID" := BRTemplateLineBranchLogic."Question ID";
                                    BRBranchSurveyQuestion.Question := BRTemplateLineBranchLogic.Question;
                                    BRBranchSurveyQuestion."Rating Type" := BRBranchSurveyQuestion."rating type"::"Open Text";
                                    BRBranchSurveyQuestion.Insert;
                                until BRTemplateLineBranchLogic.Next = 0;
                            end;

                        until BRTemplateLine.Next = 0;
                    end;


                    Message('Lines Suggested Successfully');
                end;
            }
            separator(Action31)
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
                    // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
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
                    Rec.TestField("Approval Status", Rec."approval status"::Open);

                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;
                    Message('Document has been approved Automatically');
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
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                //ApprovalsMgmt.""(Rec);*/
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify;
                    Message('Document has been Re-Opened');

                end;
            }
            separator(Action27)
            {
            }
            action("Copy Surveys")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Copy Surveys';
                Ellipsis = true;
                Image = CopyFixedAssets;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Copy Surveys action.';
                trigger OnAction()
                var
                    CopyFA: Report "Copy Fixed Asset";
                begin
                    /*CopyFA.SetFANo("No.");
                    CopyFA.RUNMODAL;*/

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(80024, true, true, Rec);
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Employees to be notified")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees to be notified';
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "Employees to be notified";
                    RunPageLink = "Document No." = field("Document No.");
                    ToolTip = 'Executes the Employees to be notified action.';
                }
                action(Copy)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy';
                    Image = Copy;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Copy action.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Business Research Category" := Rec."business research category"::"Employee Experience";
    end;

    trigger OnOpenPage()
    begin
        Rec."Business Research Category" := Rec."business research category"::"Employee Experience";
    end;

    var
        BRTemplateLine: Record "BR Template Line";
        BRSurveySection: Record "BR Survey Section";
        BRSurveyQuestion: Record "BR Survey Question";
        BRSurveyScoreGuide: Record "BR Survey Score Guide";
        BRTemplateSection: Record "BR Template Section";
        BRTemplateScoreGuide: Record "BR Template Score Guide";
        BRTemplateLineBranchLogic: Record "BR Template Line Branch Logic";
        BRBranchSurveyQuestion: Record "BR Branch Survey Question";
        ParentQuestionID: Integer;
        QuestionID: Integer;
}

#pragma implicitwith restore

