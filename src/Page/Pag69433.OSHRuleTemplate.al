#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69433 "OSH Rule Template"
{
    PageType = Card;
    SourceTable = "OSH Rule Template";

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
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control7; "OSH Rule Template Lines")
            {
                Caption = 'Safety Rules & Regulations';
                SubPageLink = "Template ID" = field("Template ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Rules & Regulation Categories")
            {
                ApplicationArea = Basic;
                Caption = 'Rules & Regulation Categories';
                Image = RegisterPick;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "OSH Rule Template Categories";
                RunPageLink = "Template ID" = field("Template ID");
                ToolTip = 'Executes the Rules & Regulation Categories action.';
            }
        }
    }
}

#pragma implicitwith restore

