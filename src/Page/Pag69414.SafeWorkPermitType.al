#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69414 "Safe Work Permit Type"
{
    PageType = Card;
    SourceTable = "Safe Work Permit Type";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Safe Work Permit Apps"; Rec."No. of Safe Work Permit Apps")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Safe Work Compl Reports"; Rec."No. of Safe Work Compl Reports")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control8; "Safety Permit Checklist Lines")
            {
                Caption = 'Permit Compliance Checklist';
                SubPageLink = "Permit Type" = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Possible Consequence/Impact")
            {
                ApplicationArea = Basic;
                Caption = 'Possible Consequence/Impact';
                Image = EntriesList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Safety Permit Consequences";
                RunPageLink = "Permit Type" = field(Code);
            }
        }
    }
}

#pragma implicitwith restore

