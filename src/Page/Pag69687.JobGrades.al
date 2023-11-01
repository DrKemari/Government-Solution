#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69687 "Job Grades"
{
    ApplicationArea = Basic;
    CardPageID = "Salary Scales";
    Editable = false;
    PageType = List;
    SourceTable = "Salary Scales";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Scale; Rec.Scale)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scale field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Appointment Authority"; Rec."Appointment Authority")
                {
                    ApplicationArea = Basic;
                    Caption = 'Overall Appointment Authority';
                    ToolTip = 'Specifies the value of the Overall Appointment Authority field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    Caption = 'Default Seniority Level';
                    ToolTip = 'Specifies the value of the Default Seniority Level field.';
                }
                field("Valid Positions"; Rec."Valid Positions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Valid Positions field.';
                }
                field("Active Employees"; Rec."Active Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Active Employees field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000010; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000011; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000012; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000013; Links)
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

