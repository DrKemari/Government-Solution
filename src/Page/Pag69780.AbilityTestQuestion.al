#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69780 "Ability Test Question"
{
    PageType = ListPart;
    SourceTable = "Test Response Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Response ID"; Rec."Response ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response ID field.';
                }
                field("Test ID"; REC."Test ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test ID field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Question; Rec.Question)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question field.';
                }
                field("Selected Answer"; Rec."Selected Answer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selected Answer field.';
                }
                field("Pass/Fail"; Rec."Pass/Fail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pass/Fail field.';
                }
            }
        }
    }

    actions
    {
    }
}

