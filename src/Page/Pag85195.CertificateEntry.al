#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85195 "Certificate Entry"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Certificate Entry";
    UsageCategory = History;

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
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part field.';
                }
                field("Exam Sitting ID"; Rec."Exam Sitting ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Sitting ID field.';
                }
                field("Exam Center"; Rec."Exam Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Center field.';
                }
                field("Date Printed"; Rec."Date Printed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Printed field.';
                }
                field("Printed By"; Rec."Printed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Printed By field.';
                }
                field("Collection Date"; Rec."Collection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collection Date field.';
                }
                field("Collected By ID Number"; Rec."Collected By ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By ID Number field.';
                }
                field("Collected By Name"; Rec."Collected By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By Name field.';
                }
                field("Collected By Email"; Rec."Collected By Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By Email field.';
                }
                field("Issued  By"; Rec."Issued  By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued  By field.';
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Date field.';
                }
                field("Issued Time"; Rec."Issued Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Time field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
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

