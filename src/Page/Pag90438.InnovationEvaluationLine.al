#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90438 "Innovation Evaluation Line"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Innovation Evaluation Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Idea ID"; Rec."Idea ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idea ID field.';
                }
                field("Idea Originator"; Rec."Idea Originator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idea Originator field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
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
                field("Innovation Rating Template ID"; Rec."Innovation Rating Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Innovation Rating Template ID field.';
                }
                field("Overall Weighted Score %"; Rec."Overall Weighted Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Weighted Score % field.';
                }
                field("Final Committee Decision"; Rec."Final Committee Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Committee Decision field.';
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
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                action("Innovation Scoresheet")
                {
                    ApplicationArea = Basic;
                    Image = SelectChart;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Innovation Scoresheet";
                    RunPageLink = "Document No" = field("Document No."),
                                  "Invitation ID" = field("Invitation ID"),
                                  "Idea ID" = field("Idea ID"),
                                  "Innovation Rating Template ID" = field("Innovation Rating Template ID");
                    ToolTip = 'Executes the Innovation Scoresheet action.';
                }
                action("Reccomend For Implementation")
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Reccomend For Implementation action.';
                    trigger OnAction()
                    begin
                        Rec."Final Committee Decision" := Rec."final committee decision"::"Recommended for Implementation";
                        Rec.Modify;
                        Message('Idea has been Reccomended for Implementation');
                    end;
                }
                action(Archive)
                {
                    ApplicationArea = Basic;
                    Image = Archive;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Archive action.';
                    trigger OnAction()
                    begin
                        Rec."Final Committee Decision" := Rec."final committee decision"::Archived;
                        Rec.Modify;
                        Message('Idea has been Archived');
                    end;
                }
            }
            action("Idea Goals & Objectives")
            {
                ApplicationArea = Basic;
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Idea Goals & Objectives";
                RunPageLink = "Document No" = field("Document No."),
                              "Invitation ID" = field("Invitation ID"),
                              "Idea ID" = field("Idea ID");
                ToolTip = 'Executes the Idea Goals & Objectives action.';
            }
        }
    }
}

#pragma implicitwith restore

