#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80171 "Policy Version"
{
    Editable = false;
    PageType = List;
    SourceTable = "Policy Version";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Version Id"; Rec."Version Id")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Revision Date"; Rec."Revision Date")
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

