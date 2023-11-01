#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90430 "Idea Responses"
{
    ApplicationArea = Basic;
    CardPageID = "Idea Response Card";
    PageType = List;
    SourceTable = "Innovation Solicitation";
    SourceTableView = where("Document Type" = const("Idea Response"));
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
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

