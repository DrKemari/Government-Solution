#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90446 "Innovation Reward Card"
{
    PageType = Card;
    SourceTable = "Innovation Reward Voucher";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Evaluation ID"; Rec."Evaluation ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation ID field.';
                }
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
                field("Idea Summary"; Rec."Idea Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idea Summary field.';
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
                field("Invitation No"; Rec."Invitation No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation No field.';
                }
            }
            part(Control18; "Innovation Reward Line")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

