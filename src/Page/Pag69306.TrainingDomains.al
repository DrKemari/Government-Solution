#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69306 "Training Domains"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Training Domains";
    UsageCategory = Administration;

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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Courses"; Rec."No. of Courses")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Actual Staff Trained"; Rec."No. of Actual Staff Trained")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Budget Spent"; Rec."Actual Budget Spent")
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

