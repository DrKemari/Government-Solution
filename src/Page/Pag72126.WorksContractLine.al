#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72126 "Works Contract Line"
{
    PageType = ListPart;
    SourceTable = "Works Contract Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header No"; Rec."Header No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Name"; Rec."Contract Name")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage This Month"; Rec."Percentage This Month")
                {
                    ApplicationArea = Basic;
                }
                field("Cum.  Percentage This Month"; Rec."Cum.  Percentage This Month")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
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

