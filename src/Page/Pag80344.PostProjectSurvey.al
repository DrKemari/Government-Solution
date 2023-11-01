#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80344 "Post-Project Survey"
{
    PageType = Card;
    SourceTable = "Business Research Survey";
    SourceTableView = where("Business Research Category" = const("Customer Experience"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Business Research Template ID"; Rec."Business Research Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department ID"; Rec."Primary Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate ID"; Rec."Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                }
                field("Response Due Date"; Rec."Response Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Responses"; Rec."No. of Responses")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control10; "BR Survey Section")
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
            }
            action("Suggest Business Sections")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

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
                            BRSurveyQuestion.Insert;

                            BRTemplateScoreGuide.Reset;
                            BRTemplateScoreGuide.SetRange("Template ID", Rec."Business Research Template ID");
                            BRTemplateScoreGuide.SetRange("Section ID", BRTemplateLine."Section ID");
                            BRTemplateScoreGuide.SetRange("Question ID", BRTemplateLine."Question ID");
                            if BRTemplateScoreGuide.FindFirst then begin
                                BRSurveyScoreGuide.Init;
                                BRSurveyScoreGuide."Survey ID" := Rec."Document No.";
                                BRSurveyScoreGuide."Section Code" := BRTemplateScoreGuide."Section ID";
                                BRSurveyScoreGuide."Question ID" := BRTemplateScoreGuide."Question ID";
                                BRSurveyScoreGuide."Line No." := BRTemplateScoreGuide."Line No.";
                                BRSurveyScoreGuide."Rating Type" := BRSurveyScoreGuide."Rating Type";
                                BRSurveyScoreGuide."Desired Perfomance Direction" := BRSurveyScoreGuide."Desired Perfomance Direction";
                                BRSurveyScoreGuide."Response Value" := BRSurveyScoreGuide."Response Value";
                                BRSurveyScoreGuide."Score %" := BRSurveyScoreGuide."Score %";
                                BRSurveyScoreGuide.Insert
                            end;

                        until BRTemplateLine.Next = 0;
                    end;


                    Message('Lines Suggested Successfully');
                end;
            }
            separator(Action30)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;

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
            separator(Action26)
            {
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;

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
                }
                action(Copy)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy';
                    Image = Copy;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Business Research Category" := Rec."business research category"::"Post-Project Survey";
    end;

    trigger OnOpenPage()
    begin
        Rec."Business Research Category" := Rec."business research category"::"Post-Project Survey";
    end;

    var
        BRTemplateLine: Record "BR Template Line";
        BRSurveySection: Record "BR Survey Section";
        BRSurveyQuestion: Record "BR Survey Question";
        BRSurveyScoreGuide: Record "BR Survey Score Guide";
        BRTemplateSection: Record "BR Template Section";
        BRTemplateScoreGuide: Record "BR Template Score Guide";
}

#pragma implicitwith restore

