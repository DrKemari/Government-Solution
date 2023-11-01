page 50008 "Record Link"
{
    ApplicationArea = All;
    Caption = 'Record Link';
    PageType = List;
    SourceTable = "Record Link";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(URL1; Rec.URL1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the URL1 field.';
                }
                field("Record ID"; Rec."Record ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Record ID field.';
                }
            }
        }
    }
}
