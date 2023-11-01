#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95014 "Risk Mgt Framework Detail"
{
    Editable = true;
    PageType = List;
    SourceTable = "Risk Mgt Framework Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("RMF Section"; Rec."RMF Section")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Guiding Principle';
                }
                field("Guiding Principle Statement"; Rec."Guiding Principle Statement")
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
            group("&Line Functions")
            {
                action("Risk Sources")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Risk Sources";
                    Visible = false;
                }
            }
        }
    }
}

#pragma implicitwith restore

