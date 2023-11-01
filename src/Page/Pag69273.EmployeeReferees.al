#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69273 "Employee Referees"
{
    PageType = List;
    SourceTable = "Hr Proffessional Body";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Membership Type"; Rec."Membership Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Type field.';
                }
                field("Membership No"; Rec."Membership No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership No field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                // field("Telephone No"; "Telephone No")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Telephone No field.';
                // }
                // field("E-Mail"; "E-Mail")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the E-Mail field.';
                // }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

