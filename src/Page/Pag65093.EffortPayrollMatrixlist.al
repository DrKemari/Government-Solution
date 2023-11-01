#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65093 "Effort & Payroll Matrix list"
{
    Caption = 'Effort & Payroll Matrixs';
    PageType = List;
    SourceTable = "Effort & Payroll Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Task No"; Rec."Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task No field.';
                }
                field("Resource ID"; Rec."Resource ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource ID field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Project Position"; Rec."Project Position")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Position field.';
                }
                field("FTE Effort (%)"; Rec."FTE Effort (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FTE Effort (%) field.';
                }
                field("Project Invoice Currency Code"; Rec."Project Invoice Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Invoice Currency Code field.';
                }
                field("Payroll Earning Code"; Rec."Payroll Earning Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Earning Code field.';
                }
                field("Earning Description"; Rec."Earning Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Earning Description field.';
                }
                field("FTE Annual Earning Amount"; Rec."FTE Annual Earning Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FTE Annual Earning Amount field.';
                }
                field("FTE Annual Earning Amount(LCY)"; Rec."FTE Annual Earning Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FTE Annual Earning Amount(LCY) field.';
                }
                field("Monthly Earned Amount"; Rec."Monthly Earned Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monthly Earned Amount field.';
                }
                field("Monthly Earned Amount(LCY)"; Rec."Monthly Earned Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monthly Earned Amount(LCY) field.';
                }
                field("Starting Pay Period"; Rec."Starting Pay Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Starting Pay Period field.';
                }
                field("Ending Pay Period"; Rec."Ending Pay Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ending Pay Period field.';
                }
                field("Last Payroll Run Period"; Rec."Last Payroll Run Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Payroll Run Period field.';
                }
                field("Total Posted Earnin(LCY)"; Rec."Total Posted Earnin(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Posted Earnin(LCY) field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

