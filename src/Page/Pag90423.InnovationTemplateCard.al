#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90423 "Innovation Template Card"
{
    PageType = Card;
    SourceTable = "Innovation Rating Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Innovation Category"; Rec."Innovation Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Innovation Category field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control10; "Innovation Template Line")
            {
                SubPageLink = "Template ID" = field("Template ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Innovation Template Category")
            {
                ApplicationArea = Basic;
                Caption = 'Innovation Template Category';
                Image = AbsenceCategory;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Innovation Template Category";
                RunPageLink = "Template ID" = field("Template ID");
                ToolTip = 'Executes the Innovation Template Category action.';
            }
        }
    }
}

#pragma implicitwith restore

