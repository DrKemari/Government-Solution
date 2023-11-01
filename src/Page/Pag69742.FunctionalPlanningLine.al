#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69742 "Functional Planning Line"
{
    PageType = ListPart;
    SourceTable = "Recruitment Planning Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    Visible = false;
                    ApplicationArea = Basic;
                    //ToolTip = 'Specifies the value of the Department field.';
                }
                field("Position Category"; Rec."Position Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position Category field.';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("Primary Recruitment Reason"; Rec."Primary Recruitment Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Recruitment Reason field.';
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                }
                field("Staff Establishment"; Rec."Staff Establishment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Establishment field.';
                }
                field("Current Headcount"; Rec."Current Headcount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Headcount field.';
                }
                field("No. of Planned New Hires"; Rec."No. of Planned New Hires")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planned New Hires field.';
                }
                field("Target Candidate Source"; Rec."Target Candidate Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Candidate Source field.';
                }
                field("Sourcing Method"; Rec."Sourcing Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sourcing Method field.';
                }
                field("Recruitment Cycle Type"; Rec."Recruitment Cycle Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Cycle Type field.';
                }
                field("Recruitment Lead Time"; Rec."Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Lead Time field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
                field("Planned Employment Start Date"; Rec."Planned Employment Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Employment Start Date field.';
                }
                field("Planned Employment End Date"; Rec."Planned Employment End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Employment End Date field.';
                }
                field("Direct Hire Unit Cost"; Rec."Direct Hire Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Hire Unit Cost field.';
                }
                field("Average Monthly Salary (LCY)"; Rec."Average Monthly Salary (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Average Monthly Gross Salary (LCY)';
                    ToolTip = 'Specifies the value of the Average Monthly Gross Salary (LCY) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

