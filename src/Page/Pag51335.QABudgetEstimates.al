#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51335 "QA Budget Estimates"
{
    PageType = List;
    SourceTable = "Quality Programme Leader";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                }
                field("Teaching Experience"; Rec."Teaching Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Bachelor Specialization"; Rec."Bachelor Specialization")
                {
                    ApplicationArea = Basic;
                }
                field("Masters Specialization"; Rec."Masters Specialization")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

