#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95134 "Compliance Framework Principle"
{
    PageType = List;
    SourceTable = "Compliance Framework Principle";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Framework ID"; Rec."Framework ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Framework ID field.';
                }
                field("Guiding Principle ID"; Rec."Guiding Principle ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Guiding Principle ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Guiding Principle Stmts"; Rec."No. of Guiding Principle Stmts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Guiding Principle Stmts field.';
                }
                field("No. of Rationale Statements"; Rec."No. of Rationale Statements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Rationale Statements field.';
                }
                field("No. of Key Benefits"; Rec."No. of Key Benefits")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Key Benefits field.';
                }
                field("No. of Compliance Requirements"; Rec."No. of Compliance Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Compliance Requirements field.';
                }
                field("No. of Comments"; Rec."No. of Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

