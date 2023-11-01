#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69689 "Job Grades Benefits"
{
    PageType = List;
    SourceTable = "Scale Benefits";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Pointer field.';
                }
                field("ED Code"; Rec."ED Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ED Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("ED Description"; Rec."ED Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ED Description field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Salary field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Grades Benefits")
            {
                ApplicationArea = Basic;
                RunObject = Page "Job Grades Benefits";
                ToolTip = 'Executes the Job Grades Benefits action.';
            }
        }
    }
}

#pragma implicitwith restore

