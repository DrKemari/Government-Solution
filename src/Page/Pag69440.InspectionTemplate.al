#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69440 "Inspection Template"
{
    PageType = Card;
    SourceTable = "Inspection Template";

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
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control8; "Inspection Template Lines")
            {
                Caption = 'Inspection Checklist';
                SubPageLink = "Inspection Type" = field("Inspection Type"),
                              "Template ID" = field("Template ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Checklist Categories")
            {
                ApplicationArea = Basic;
                Caption = 'Checklist Categories';
                Image = Category;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Inspection Template Categories";
                RunPageLink = "Template ID" = field("Template ID"),
                              "Inspection Type" = filter("OSH Inspection");
                ToolTip = 'Executes the Checklist Categories action.';
            }
        }
    }
}

#pragma implicitwith restore

