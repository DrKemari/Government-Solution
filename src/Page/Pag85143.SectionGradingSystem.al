#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85143 "Section Grading System"
{
    PageType = List;
    SourceTable = "Section Grading System";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Papers"; Rec."Total No. of Papers")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Papers Qualified"; Rec."No. of Papers Qualified")
                {
                    ApplicationArea = Basic;
                }
                field("Grade Code"; Rec."Grade Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Links)
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

