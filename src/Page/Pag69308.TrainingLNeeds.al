#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69308 "TrainingL Needs"
{
    CardPageID = "Training Courses Needs";
    PageType = List;
    SourceTable = "Training Courses Needs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = Basic;
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                }
                field("Training Need Code"; Rec."Training Need Code")
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

