#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69557 "Succession Log Header"
{
    ApplicationArea = Basic;
    CardPageID = "Succession Log Card";
    Editable = false;
    PageType = List;
    SourceTable = "Succession Log Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Succession Program"; Rec."Succession Program")
                {
                    ApplicationArea = Basic;
                }
                field(Mentee; Rec.Mentee)
                {
                    ApplicationArea = Basic;
                }
                field("Mentee Name"; Rec."Mentee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Mentor; Rec.Mentor)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
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

