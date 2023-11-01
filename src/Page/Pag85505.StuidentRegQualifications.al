page 85499 "Student Reg Qualifications"
{
    ApplicationArea = All;
    Caption = 'Stuident Reg Qualifications';
    PageType = List;
    SourceTable = "Student Registration Qualifi";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Main Field of Study"; Rec."Main Field of Study")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Main Field of Study field.';
                }
                field("Qualification Earned"; Rec."Qualification Earned")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qualification Earned field.';
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To field.';
                }
            }
        }
    }
}
