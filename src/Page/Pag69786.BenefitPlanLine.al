#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69786 "Benefit Plan Line"
{
    PageType = ListPart;
    SourceTable = "Benefit Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Package ID"; Rec."Package ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Package ID field.';
                }
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Job Grades"; Rec."No. of Job Grades")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Job Grades field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Job Grades")
            {
                action("Benefit Plan Grade")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    RunObject = Page "Benefit Plan Grade";
                    RunPageLink = "Package ID" = field("Package ID"),
                                  "Plan ID" = field("Plan ID");
                    ToolTip = 'Executes the Benefit Plan Grade action.';
                }
                action("Grade Benefits")
                {
                    ApplicationArea = Basic;
                    Image = BinContent;
                    RunObject = Page "Job Grades Benefits";
                    RunPageLink = "Salary Scale" = field("Plan ID");
                    ToolTip = 'Executes the Grade Benefits action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

