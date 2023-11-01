#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85062 "Center Booking Entries"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Center Booking Entries";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("Examination Id"; Rec."Examination Id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination  Id';
                    ToolTip = 'Specifies the value of the Examination  Id field.';
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ';
                    ToolTip = 'Specifies the value of the Examination  field.';
                }
                field("Re-Allocation Center Code"; Rec."Re-Allocation Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Re-Allocation Center Code field.';
                }
                field("Re-Allocation Center Name"; Rec."Re-Allocation Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Re-Allocation Center Name field.';
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Sitting field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                //RunObject = Report "Center Booking Entries";
                ToolTip = 'Executes the Print action.';
            }
        }
    }
}

#pragma implicitwith restore

