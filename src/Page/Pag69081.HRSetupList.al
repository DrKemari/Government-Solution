#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69081 "HR Setup List"
{
    CardPageID = "Human Resources Setup";
    PageType = List;
    SourceTable = "Human Resources Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Employee Nos."; Rec."Employee Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number series code to use when assigning numbers to employees.';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the base unit of measure, such as hour or day.';
                }
                field("Shift overtime rate"; Rec."Shift overtime rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shift overtime rate field.';
                }
                field("Holiday overtime rate"; Rec."Holiday overtime rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Holiday overtime rate field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000088; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000089; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000090; Links)
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

