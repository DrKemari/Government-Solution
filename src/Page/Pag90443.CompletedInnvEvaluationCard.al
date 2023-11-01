#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90443 "Completed Innv Evaluation Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Innovation Evaluation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Invitation ID"; Rec."Invitation ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Innovation Category"; Rec."Innovation Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Innovation Category field.';
                }
                field("Innovation Lead"; Rec."Innovation Lead")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Innovation Lead field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Evaluation Status"; Rec."Evaluation Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Status field.';
                }
            }
            part(Control15; "Completed Inn Evaluation Line")
            {
                SubPageLink = "Document No." = field("Document No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
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
            separator(Action17)
            {
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
                    Rec.SetRange("Document No", Rec."Document No");
                    //REPORT.RUN(80024,TRUE,TRUE,Rec);
                end;
            }
            separator(Action22)
            {
            }
        }
    }

    var
        InnovationEvaluationLine: Record "Innovation Evaluation Line";
}

#pragma implicitwith restore

