#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85348 "Curriculum Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Development Plan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Task Type"; Rec."Task Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Syllabus ID"; Rec."Syllabus ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Syllabus ID field.';
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
                field("Responsible Officer"; Rec."Responsible Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer field.';
                }
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officer Name field.';
                }
                field("Planned Budget"; Rec."Planned Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Budget field.';
                }
                field("Actual Cost"; Rec."Actual Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Cost field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Navigate)
            {
                action("Raised Requisitions")
                {
                    ApplicationArea = Basic;
                    Image = AllLines;
                    RunObject = Page "Syllabus Development Requisit";
                    RunPageLink = "Plan Item" = field("Line No."),
                                  "Plan No." = field("Development Header");
                    ToolTip = 'Executes the Raised Requisitions action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

