#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85302 "Types Of Syllabus"
{
    PageType = List;
    SourceTable = "Type Of Syllabus";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(New; Rec.New)
                {
                    ApplicationArea = Basic;
                }
                field("No. Reviewed"; Rec."No. Reviewed")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
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

