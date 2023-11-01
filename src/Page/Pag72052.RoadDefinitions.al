#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72052 "Road Definitions"
{
    CardPageID = "Road Definition Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Road Definition";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Properties Of Link';
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
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

#pragma implicitwith restore

