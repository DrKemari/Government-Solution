#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69247 "HR Jobs Factbox"
{
    PageType = ListPart;
    SourceTable = "ManPower Planning Lines";

    layout
    {
        area(content)
        {
            field("Entry No"; Rec."Entry No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Entry No field.';
            }
            field("Task No"; Rec."Task No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Task No field.';
            }
            field("Manpower Plan Code"; Rec."Manpower Plan Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Manpower Plan Code field.';
            }
            field("Job Id"; Rec."Job Id")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job Id field.';
            }
            field("Job Title"; Rec."Job Title")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job Title field.';
            }
            field("Responsibility Center Code"; Rec."Responsibility Center Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center Code field.';
            }
            // field(Category; Category)
            // {
            //     ApplicationArea = Basic;
            //     ToolTip = 'Specifies the value of the Category field.';
            // }
            // field(Grade; Grade)
            // {
            //     ApplicationArea = Basic;
            //     ToolTip = 'Specifies the value of the Grade field.';
            // }
            // field("Employee Requisitions"; "Employee Requisitions")
            // {
            //     ApplicationArea = Basic;
            //     ToolTip = 'Specifies the value of the Employee Requisitions field.';
            // }
            // field("Supervisor Name"; "Supervisor Name")
            // {
            //     ApplicationArea = Basic;
            //     ToolTip = 'Specifies the value of the Supervisor Name field.';
            // }
            // field(Status; Status)
            // {
            //     ApplicationArea = Basic;
            //     ToolTip = 'Specifies the value of the Status field.';
            // }
            // field("Responsibility Center"; "Responsibility Center")
            // {
            //     ApplicationArea = Basic;
            //     ToolTip = 'Specifies the value of the Responsibility Center field.';
            // }
            // field("Date Created"; "Date Created")
            // {
            //     ApplicationArea = Basic;
            //     ToolTip = 'Specifies the value of the Date Created field.';
            // }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

