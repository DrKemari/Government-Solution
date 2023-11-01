#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56033 "Case Document Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Case Document Types";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Require Court Date?"; Rec."Require Court Date?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Require Court Date? field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Case Document Sub Types")
            {
                ApplicationArea = Basic;
                Caption = 'Case Document Sub Types';
                Image = process;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Case Document Sub Types";
                RunPageLink = "Case Document Type" = field(Code);
                ToolTip = 'Executes the Case Document Sub Types action.';
            }
        }
    }
}

#pragma implicitwith restore

