#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80201 "Policy Thematic Area"
{
    PageType = ListPart;
    SourceTable = "Policy Thematic Area";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Implementation Percentage"; Rec."Implementation Percentage")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
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
            action("Policy Sub Thematic Areas")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Policy Sub Thematic Areas";
                RunPageLink = "Policy ID"=field("Policy ID"),
                              "Thematic Code"=field(Code);
            }
        }
    }
}

#pragma implicitwith restore

