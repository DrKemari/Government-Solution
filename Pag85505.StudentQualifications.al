page 85495 "Student Qualifications"
{
    ApplicationArea = All;
    Caption = 'Student Qualifications';
    PageType = List;
    SourceTable = "Student Qualifications";
    UsageCategory = Administration;
    
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
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
            }
        }
    }
}
