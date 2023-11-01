#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56008 "Approved CRM Vacancies"
{
    ApplicationArea = Basic;
    CardPageID = "CRM Vacancy";
    PageType = List;
    SourceTable = "CRM Vacancies";
    SourceTableView = where("Approval Status" = filter(Released),
                            Published = filter(false));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vacancy No"; Rec."Vacancy No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy No field.';
                }
                field("No of Openings"; Rec."No of Openings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Openings field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field("Estimate Annual Salary"; Rec."Estimate Annual Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Annual Salary field.';
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade ID field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

