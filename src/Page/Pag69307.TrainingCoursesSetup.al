#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69307 "Training Courses Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Training Courses Setup";
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
                field(Descritpion; Rec.Descritpion)
                {
                    ApplicationArea = Basic;
                }
                field(Domain; Rec.Domain)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Staff Trained"; Rec."No. of Staff Trained")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Name"; Rec."Qualification Name")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Spent"; Rec."Budget Spent")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Needs To be Addressed")
            {
                ApplicationArea = Basic;
                Image = AllocatedCapacity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Training Courses Needs";
                RunPageLink = "Course Code" = field(Code);
            }
        }
    }
}

#pragma implicitwith restore

