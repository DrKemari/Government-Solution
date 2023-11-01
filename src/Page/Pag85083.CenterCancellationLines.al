#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85083 "Center Cancellation Lines"
{
    PageType = ListPart;
    SourceTable = "Center Booking Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Student Reg No."; Rec."Student Reg No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Reg No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("Course Id"; Rec."Course Id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination Id';
                    ToolTip = 'Specifies the value of the Examination Id field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ';
                    ToolTip = 'Specifies the value of the Examination  field.';
                }
                field("Subject Code"; Rec."Subject Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject Code field.';
                }
                field("Subject Name"; Rec."Subject Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject Name field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field(Zone; Rec.Zone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Zone field.';
                }
                field("Exam Center Code"; Rec."Exam Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Center Code field.';
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center Name field.';
                }
                field("Sitting Cycle"; Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sitting Cycle field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

