#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80395 "BR Branch Survey Question"
{
    PageType = List;
    SourceTable = "BR Branch Survey Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Survey ID"; Rec."Survey ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey ID field.';
                }
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Code field.';
                }
                field("Parent Question ID"; Rec."Parent Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parent Question ID field.';
                }
                field("Parent Response"; Rec."Parent Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parent Response field.';
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

