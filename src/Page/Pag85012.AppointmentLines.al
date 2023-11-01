#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85012 "Appointment Lines"
{
    PageType = ListPart;
    SourceTable = "Appointment Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Exam Sitting"; Rec."Exam Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Sitting field.';
                }
                field("Role Type"; Rec."Role Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role Type field.';
                }
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member No. field.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field("Member Email"; Rec."Member Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Email field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("ID/Passport"; Rec."ID/Passport")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID/Passport field.';
                }
                field("Tax Registration(PIN)"; Rec."Tax Registration(PIN)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Registration(PIN) field.';
                }
                field("Notified on Email"; Rec."Notified on Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified on Email field.';
                }
                field(DateTime; Rec.DateTime)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateTime field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

