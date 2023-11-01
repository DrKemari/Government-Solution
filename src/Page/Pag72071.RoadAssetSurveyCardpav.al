#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72071 "Road Asset Survey Card(pav"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Road Asset Survey Sheet";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Sheet No"; Rec."Sheet No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Name"; Rec."Road Name")
                {
                    ApplicationArea = Basic;
                }
                field("Surveyor Name"; Rec."Surveyor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Date"; Rec."Survey Date")
                {
                    ApplicationArea = Basic;
                }
                field(AADT; Rec.AADT)
                {
                    ApplicationArea = Basic;
                    Caption = 'Annual AVerae Daily Traffic';
                }
                field("Road Length"; Rec."Road Length")
                {
                    ApplicationArea = Basic;
                }
                field("ROW Width"; Rec."ROW Width")
                {
                    ApplicationArea = Basic;
                    Caption = 'Right Of Way Width';
                }
            }
            part(Control10; "Road Asset Survey Line")
            {
                SubPageLink = "Road Code" = field("Road Code"),
                              "Header No" = field("Sheet No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

