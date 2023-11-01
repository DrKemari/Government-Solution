#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85134 "Posted Examination Planner"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
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
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic ID"; Rec."Corporate Strategic ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Plan ID"; Rec."Financial Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Project ID"; Rec."Examination Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field("Examination Sitting ID"; Rec."Examination Sitting ID")
                {
                    ApplicationArea = Basic;
                }
                field("Eamination Center Code"; Rec."Eamination Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Candidature"; Rec."Total Candidature")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Quantity"; Rec."Total Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Actual Cost"; Rec."Total Actual Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control31; "Material Lines")
            {
                SubPageLink = "Planner No." = field(Code),
                              Examination = field(Examination),
                              "Financial Year Code" = field("Financial Year Code"),
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
                Visible = false;

                trigger OnAction()
                begin
                    ExaminationCodeunit.SuggestTaskLines(Rec);
                end;
            }
            action("Post Planner")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    Rec.TestField(Posted, false);
                    ExaminationCodeunit.PostMaterialPlanner(Rec);
                end;
            }
        }
    }

    var
        ExaminationCodeunit: Codeunit Examination;
}

#pragma implicitwith restore

