#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69042 "Employee Posting Group List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Employee Posting GroupX";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Overtime Base Hrs"; Rec."Overtime Base Hrs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Base Hrs field.';
                }
                field("Guards Wages Daily Rate"; Rec."Guards Wages Daily Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Guards Wages Daily Rate field.';
                }
                field("Drivers Wages Daily Rate"; Rec."Drivers Wages Daily Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drivers Wages Daily Rate field.';
                }
                field("Monthly Working Days"; Rec."Monthly Working Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monthly Working Days field.';
                }
                field("Interest on advance rate"; Rec."Interest on advance rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest on advance rate field.';
                }
                field("Payroll Group"; Rec."Payroll Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Group field.';
                }
                field("Annual Leave Days"; Rec."Annual Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Leave Days field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000012; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000013; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000014; Links)
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

