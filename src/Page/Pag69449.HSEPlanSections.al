#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69449 "HSE Plan Sections"
{
    CardPageID = "HSE Plan Section";
    PageType = List;
    SourceTable = "HSE Plan Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'OSH Plan Overviw';
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Section Type"; Rec."Section Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Section Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Revision Date"; Rec."Revision Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revision Date field.';
                }
                field("No. of Comments"; Rec."No. of Comments")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Comments field.';
                }
                field("No. of Initiatives"; Rec."No. of Initiatives")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Initiatives field.';
                }
                field("No. of Guiding Principle Stmts"; Rec."No. of Guiding Principle Stmts")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Guiding Principle Stmts field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Additional Comments")
            {
                ApplicationArea = Basic;
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "HSE Plan Section Details";
                RunPageLink = "Plan ID" = field("Plan ID"),
                              "Section Type" = field("Section Type"),
                              "Section Line No." = field("Line No.");
                ToolTip = 'Executes the Additional Comments action.';
            }
            action("Key OSH Initiatives")
            {
                ApplicationArea = Basic;
                Caption = 'Key OSH Initiatives';
                Image = Installments;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "HSE Plan Section Details";
                RunPageLink = "Plan ID" = field("Plan ID"),
                              "Section Type" = field("Section Type"),
                              "Section Line No." = field("Line No.");
                ToolTip = 'Executes the Key OSH Initiatives action.';
            }
            action("Guiding Principle Statements")
            {
                ApplicationArea = Basic;
                Image = GiroPlus;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "HSE Plan Section Details";
                RunPageLink = "Plan ID" = field("Plan ID"),
                              "Section Type" = field("Section Type"),
                              "Section Line No." = field("Line No.");
                ToolTip = 'Executes the Guiding Principle Statements action.';
            }
        }
    }
}

#pragma implicitwith restore

