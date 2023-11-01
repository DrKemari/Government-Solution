#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69450 "HSE Plan Section"
{
    PageType = Card;
    SourceTable = "HSE Plan Section";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Section Type"; Rec."Section Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
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
                    ToolTip = 'Specifies the value of the No. of Comments field.';
                }
                field("No. of Initiatives"; Rec."No. of Initiatives")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Initiatives field.';
                }
                field("No. of Guiding Principle Stmts"; Rec."No. of Guiding Principle Stmts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Guiding Principle Stmts field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

