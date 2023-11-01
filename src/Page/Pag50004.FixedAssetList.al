page 50004 "Fixed Assets List"
{
    ApplicationArea = All;
    Caption = 'Fixed Asset List';
    PageType = List;
    SourceTable = "Fixed Asset";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the fixed asset.';
                }
            }
        }
    }
}
