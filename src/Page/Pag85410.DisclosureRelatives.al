#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85410 "Disclosure Relatives"
{
    PageType = ListPart;
    SourceTable = "Disclosure Relative";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Name of Relative"; Rec."Name of Relative")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name of Relative field.';
                }
                field(Relationship; Rec.Relationship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Relationship field.';
                }
                field("Student Reg No."; Rec."Student Reg No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Reg No. field.';
                }
                field(Course; Rec.Course)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Interest Type" := Rec."interest type"::Relative;
    end;
}

#pragma implicitwith restore

