#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69802 "Shortlist Score Guide"
{
    PageType = List;
    SourceTable = "Candidate Shortlist Score Guid";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requirement Name"; Rec."Requirement Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Score Code"; Rec."Score Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Points; Rec.Points)
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

