#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69192 "Hr Salary Increament Lines"
{
    PageType = ListPart;
    SourceTable = "HR Salary Increament Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Current Salary Scale"; Rec."Current Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Salary Scale field.';
                }
                field("Current Present"; Rec."Current Present")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Present field.';
                }
                field("New Salary Scale"; Rec."New Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Salary Scale field.';
                }
                field("New Present"; Rec."New Present")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Present field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Previous  Terms of Service"; Rec."Previous  Terms of Service")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous  Terms of Service field.';
                }
                field("Current  Terms of Service"; Rec."Current  Terms of Service")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current  Terms of Service field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

