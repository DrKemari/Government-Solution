#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85006 "Exam Calendar Resource Matrix"
{
    PageType = List;
    SourceTable = "Exam Calendar Resource Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Exam Cycle ID"; Rec."Exam Cycle ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Cycle ID field.';
                }
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course ID field.';
                }
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper field.';
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Exam Center"; Rec."Exam Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Center field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field("Exam Role Type"; Rec."Exam Role Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Role Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

