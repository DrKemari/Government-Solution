#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90444 "Completed Inn Evaluation Line"
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
            action("Create Reward Voucher")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Create Reward Voucher action.';
                trigger OnAction()
                begin
                    InnovationRewardVoucher.Init;
                    InnovationRewardVoucher."Document No." := NoSeriesManagement.GetNextNo('INNOV-REWARD', Today, true);
                    InnovationRewardVoucher.Description := Rec.Description;
                    InnovationRewardVoucher."Evaluation ID" := Rec."Invitation ID";
                    InnovationRewardVoucher."Idea ID" := Rec."Idea ID";
                    InnovationRewardVoucher."Idea Originator" := Rec."Idea Originator";
                    InnovationRewardVoucher.Insert;
                    Message('Reward Document %1 has been created successfully', InnovationRewardVoucher."Document No.");
                end;
            }
            action("Create Implementation Project")
            {
                ApplicationArea = Basic;
                Image = Job;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Create Implementation Project action.';
                trigger OnAction()
                begin
                    Rec."Final Committee Decision" := Rec."final committee decision"::Archived;
                    Rec.Modify;
                    Message('Idea has been Archived');
                end;
            }
        }
    }

    var
        InnovationRewardVoucher: Record "Innovation Reward Voucher";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

#pragma implicitwith restore

