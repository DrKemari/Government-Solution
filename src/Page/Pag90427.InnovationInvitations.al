#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90427 "Innovation Invitations"
{
    ApplicationArea = Basic;
    CardPageID = "Innovation Invitation Card";
    PageType = List;
    SourceTable = "Innovation Solicitation";
    SourceTableView = where("Document Type" = const("Innovation Invitation"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
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
                field("Innovation Lead"; Rec."Innovation Lead")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Innovation Lead field.';
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field("Idea Submission Start Date"; Rec."Idea Submission Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idea Submission Start Date field.';
                }
                field("Idea Submission End Date"; Rec."Idea Submission End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idea Submission End Date field.';
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("No. of Innovation Ideas"; Rec."No. of Innovation Ideas")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Innovation Ideas field.';
                }
                field("No. of Innov Comm Appointments"; Rec."No. of Innov Comm Appointments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Innov Comm Appointments field.';
                }
                field("No. of Innov Evaluations"; Rec."No. of Innov Evaluations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Innov Evaluations field.';
                }
                field("No. of Innovation Rewards"; Rec."No. of Innovation Rewards")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Innovation Rewards field.';
                }
                field("No. of Innovation Projects"; Rec."No. of Innovation Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Innovation Projects field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

