#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Road Definition Card (ID 72053).
/// </summary>
Page 72053 "Road Definition Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Road Definition";

    layout
    {
        area(content)
        {
            group("Properties Of Link")
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(Km)"; Rec."Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(Km)"; Rec."End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Link Length(Km)"; Rec."Link Length(Km)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Surface Type"; Rec."Surface Type")
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

