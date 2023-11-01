#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95249 "Audit Finding"
{
    PageType = Card;
    SourceTable = "Audit Finding";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Implications; Rec.Implications)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Implications field.';
                }
                field("Finding Rating Code"; Rec."Finding Rating Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finding Rating Code field.';
                }
                field(Recommendations; Rec.Recommendations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendations field.';
                }
                field("Applicable To All Locations"; Rec."Applicable To All Locations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicable To All Locations field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

