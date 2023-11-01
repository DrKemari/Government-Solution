page 50012 "Ethnicity Setup"
{
    ApplicationArea = All;
    Caption = 'Ethnicity Setup';
    PageType = List;
    SourceTable = "Ethnic Background";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Ethnic group"; Rec."Ethnic group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ethnic group field.';
                }
            }
        }
    }
}
