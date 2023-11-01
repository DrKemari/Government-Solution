#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95015 "Risk Sources"
{
    ApplicationArea = Basic;
    Caption = 'Strategic Pillars';
    CardPageID = "Risk Source";
    Editable = false;
    PageType = List;
    SourceTable = "Risk Source";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("<Source_ID>"; Rec."Source ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Strategic_Pillar';
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

