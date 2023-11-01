#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51520 "Prog Stakeholder Response"
{
    Caption = 'Programme Stakeholder Response';
    PageType = List;
    SourceTable = "Stakeholder Response";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Response No."; Rec."Audit Response No.")
                {
                    ApplicationArea = Basic;
                }
                field("Stakeholder Code"; Rec."Stakeholder Code")
                {
                    ApplicationArea = Basic;
                }
                field("Stakeholder Name"; Rec."Stakeholder Name")
                {
                    ApplicationArea = Basic;
                }
                field("A Stakeholder?"; Rec."A Stakeholder?")
                {
                    ApplicationArea = Basic;
                }
                field("Engaged for last 5yrs"; Rec."Engaged for last 5yrs")
                {
                    ApplicationArea = Basic;
                }
                field("Analyzed needs last 5yrs"; Rec."Analyzed needs last 5yrs")
                {
                    ApplicationArea = Basic;
                }
                field("University Code"; Rec."University Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

