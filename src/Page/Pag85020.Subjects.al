#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85020 "Subjects"
{
    ApplicationArea = Basic;
    Caption = 'Subjects';
    CardPageID = Subject;
    DeleteAllowed = true;
    Editable = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = Papers;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Setting Amount"; Rec."Setting Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Setting Amount field.';
                }
                field("Solution Amount"; Rec."Solution Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Solution Amount field.';
                }
                field("Moderation Amount"; Rec."Moderation Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Moderation Amount field.';
                }
                field("Common Paper"; Rec."Common Paper")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Common Paper field.';
                }
                field("MCQ's"; Rec."MCQ's")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MCQ''s field.';
                }
                field("MCQ's Question Template"; Rec."MCQ's Question Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MCQ''s Question Template field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Course; Rec.Course)
                {
                    ApplicationArea = Basic;
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Passed Students"; Rec."No. of Passed Students")
                {
                    ApplicationArea = Basic;
                }
                field("No. of  Failed Students"; Rec."No. of  Failed Students")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Required Questions"; Rec."No. of Required Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Not to be Exempted"; Rec."Not to be Exempted")
                {
                    ApplicationArea = Basic;
                }

            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Student Booked")
            {
                ApplicationArea = Basic;
                Image = Statistics;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Exam Booking Entries";
                RunPageLink = Paper = field(Code);
            }
        }
    }
}

#pragma implicitwith restore

