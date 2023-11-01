#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85080 "Center Re-Allocation Lines"
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("Course Id"; Rec."Course Id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination Id';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination Id field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination  field.';
                }
                field(Moved; Rec.Moved)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Moved field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

