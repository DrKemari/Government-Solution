#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69553 "Succession Template Lines"
{
    PageType = ListPart;
    SourceTable = "Succession Template Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Initiative Category"; Rec."Initiative Category")
                {
                    ApplicationArea = Basic;
                }
                field(Initiative; Rec.Initiative)
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

