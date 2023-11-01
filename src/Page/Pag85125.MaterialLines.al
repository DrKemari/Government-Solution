#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85125 "Material Lines"
{
    PageType = ListPart;
    SourceTable = "Exam Planner Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Subject Code"; Rec."Subject Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject Code field.';
                }
                field("Subject Name"; Rec."Subject Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject Name field.';
                }
                field("Total Candidature"; Rec."Total Candidature")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Candidature field.';
                }
                field("Total Quantity"; Rec."Total Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Quantity field.';
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget field.';
                }
                field("Total Actual Cost"; Rec."Total Actual Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actual Cost field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Category field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Planner Items")
            {
                ApplicationArea = Basic;
                Image = PlanningWorksheet;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Planner Items";
                RunPageLink = "Exam Planner No." = field("Planner No."),
                              "Exam Planner Entry" = field("Line No.");
                ToolTip = 'Executes the Planner Items action.';
            }
        }
    }
}

#pragma implicitwith restore

