#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51393 "Visitation Lines"
{
    PageType = ListPart;
    SourceTable = "Application Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Component Description"; Rec."Component Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Details';
                }
                field("Sub-Component Description"; Rec."Sub-Component Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub-Details';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Chapter Scores")
            {
                ApplicationArea = Basic;
                Image = Splitlines;
                RunObject = Page "Application Chapter Scores";
                RunPageLink = "Ápplication No."=field("Application No.");
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::"Site Visit";
    end;
}

#pragma implicitwith restore

