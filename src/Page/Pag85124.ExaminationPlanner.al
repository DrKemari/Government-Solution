#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85124 "Examination Planner"
{
    PageType = Card;
    SourceTable = "Exam Material Planner Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Examination Project ID"; Rec."Examination Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Eamination Center Code"; Rec."Eamination Center Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Eamination Center Code field.';
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Examination Center field.';
                }
                field("Corporate Strategic ID"; Rec."Corporate Strategic ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Strategic ID field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Examination Sitting ID"; Rec."Examination Sitting ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Sitting ID field.';
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Start Date field.';
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning End Date field.';
                }
                field("Total Candidature"; Rec."Total Candidature")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Candidature field.';
                }
                field("Total Quantity"; Rec."Total Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Quantity field.';
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Budget field.';
                }
                field("Total Actual Cost"; Rec."Total Actual Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Actual Cost field.';
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
            }
            part(Control31; "Material Lines")
            {
                SubPageLink = "Planner No." = field(Code),
                              "Project No." = field("Examination Project ID");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                begin
                    Message('');
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                begin
                    Message('The approval request has been approved');
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify(true);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify(true);
                end;
            }
            action("Re-Open")
            {
                ApplicationArea = Basic;
                Caption = 'Re-Open';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
                ToolTip = 'Executes the Re-Open action.';
                trigger OnAction()
                begin
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify(true);
                end;
            }
            action("Examination Planner")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Examination Planner action.';
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(85005, true, false, Rec);
                end;
            }
            action("Detailed Planner")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Detailed Planner action.';
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(85008, true, false, Rec);
                end;
            }
            action("Suggest Entries")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Entries action.';
                trigger OnAction()
                var
                    TXT001: label 'Suggest Subjects to be offered for the %1';
                begin
                    if Confirm(TXT001, true, Rec."Project Name") = true then begin
                        ExaminationCodeunit.SuggestTaskLines(Rec);
                    end
                end;
            }
            action("Post Planner")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post Planner action.';
                trigger OnAction()
                var
                    TXT001: label 'Post Planner to the project planning lines?';
                begin

                    if Confirm(TXT001, true, Rec."Project Name") = true then begin
                        Rec.TestField("Approval Status", Rec."approval status"::Released);
                        ExaminationCodeunit.PostMaterialPlanner(Rec);
                    end
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec."Total Quantity" := 0;
        ExamPlannerLine.Reset;
        ExamPlannerLine.SetRange("Planner No.", Rec.Code);
        if ExamPlannerLine.FindSet then begin
            repeat
                ExamPlannerLine.CalcFields("Total Budget", "Total Quantity");
                Rec."Total Budget" := Rec."Total Budget" + ExamPlannerLine."Total Budget";
                Rec."Total Quantity" := Rec."Total Quantity" + ExamPlannerLine."Total Quantity";
            until ExamPlannerLine.Next = 0;
        end
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Rec."Total Quantity" := 0;
        ExamPlannerLine.Reset;
        ExamPlannerLine.SetRange("Planner No.", Rec.Code);
        if ExamPlannerLine.FindSet then begin
            repeat
                ExamPlannerLine.CalcFields("Total Budget", "Total Quantity");
                Rec."Total Budget" := Rec."Total Budget" + ExamPlannerLine."Total Budget";
                Rec."Total Quantity" := Rec."Total Quantity" + ExamPlannerLine."Total Quantity";
            until ExamPlannerLine.Next = 0;
        end
    end;

    trigger OnOpenPage()
    begin
        Rec."Total Quantity" := 0;
        ExamPlannerLine.Reset;
        ExamPlannerLine.SetRange("Planner No.", Rec.Code);
        if ExamPlannerLine.FindSet then begin
            repeat
                ExamPlannerLine.CalcFields("Total Budget", "Total Quantity");
                Rec."Total Budget" := Rec."Total Budget" + ExamPlannerLine."Total Budget";
                Rec."Total Quantity" := Rec."Total Quantity" + ExamPlannerLine."Total Quantity";
            until ExamPlannerLine.Next = 0;
        end
    end;

    var
        ExaminationCodeunit: Codeunit Examination;
        ExamPlannerLine: Record "Exam Planner Line";
}

#pragma implicitwith restore

