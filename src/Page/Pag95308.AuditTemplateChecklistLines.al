#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95308 "Audit Template Checklist Lines"
{
    PageType = ListPart;
    SourceTable = "Audit Template Checklist";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Procedure ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Audit Objective ID"; Rec."Audit Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Objective ID field.';
                }
                field("No. of Audit Testing Methods"; Rec."No. of Audit Testing Methods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Testing Methods field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(Objectives)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Objectives action.';
                }
                action("Audit Testing Methods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Audit Testing Methods action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

