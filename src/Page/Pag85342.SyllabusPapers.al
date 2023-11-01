#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85342 "Syllabus Papers"
{
    PageType = ListPart;
    SourceTable = "Syllabus Papers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Course; Rec.Course)
                {
                    ApplicationArea = Basic;
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Paper Details")
            {
                ApplicationArea = Basic;
                Image = AllLines;
                RunObject = Page "Syllabus Lines";
                RunPageLink = "Syllabus No."=field("Syllabus No."),
                              "Paper Code"=field("Paper Code");
            }
        }
    }
}

#pragma implicitwith restore

