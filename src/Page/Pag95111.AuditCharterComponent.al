#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95111 "Audit Charter Component"
{
    PageType = Card;
    SourceTable = "Audit Charter Component";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Audit Charter ID"; Rec."Audit Charter ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Charter ID field.';
                }
                field("Component Type"; Rec."Component Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Component Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

