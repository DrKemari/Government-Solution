#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85015 "Withdrawal Reasons"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Withdrawal Reasons";
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
                field("Reason Category"; Rec."Reason Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("% of Refund"; Rec."% of Refund")
                {
                    ApplicationArea = Basic;
                }
                field("Administrative %"; Rec."Administrative %")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Entries"; Rec."No. of Entries")
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
    }
}

#pragma implicitwith restore

