#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72119 "Stakeholder's Road Priority"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Stakeholder's Road Priority";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                }
                field(Pririty; Rec.Pririty)
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

