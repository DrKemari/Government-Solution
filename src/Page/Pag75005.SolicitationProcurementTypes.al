#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75005 "Solicitation Procurement Types"
{
    PageType = List;
    SourceTable = "Solictation Procurement Type";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procument Type"; Rec."Procument Type")
                {
                    ApplicationArea = Basic;
                }
                field("Strict Purchase Limits"; Rec."Strict Purchase Limits")
                {
                    ApplicationArea = Basic;
                }
                field("Min Purchase Value (LCY)"; Rec."Min Purchase Value (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Max Purchase Value (LCY)"; Rec."Max Purchase Value (LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

