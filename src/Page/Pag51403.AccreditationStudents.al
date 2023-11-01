#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51403 "Accreditation Students"
{
    PageType = ListPart;
    SourceTable = "Accreditation Trainers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Code field.';
                }
                field("Course Section"; Rec."Course Section")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Section field.';
                }
                field("No. of Parttime Students"; Rec."No. of Parttime Students")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Parttime Students field.';
                }
                field("No. of Fulltime Students"; Rec."No. of Fulltime Students")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Fulltime Students field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

