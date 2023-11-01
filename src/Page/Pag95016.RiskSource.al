#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95016 "Risk Source"
{
    Caption = 'Strategic Pillar';
    PageType = Card;
    SourceTable = "Risk Source";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Source ID"; Rec."Source ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Strategic Pillar';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Risk Categories"; Rec."No. Of Risk Categories")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Risks"; Rec."No. Of Risks")
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

