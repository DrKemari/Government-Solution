#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51510 "Audit Engagement Sub-Lines"
{
    Caption = 'Audit Engagement Sub-Lines';
    PageType = ListPart;
    SourceTable = "Audit Requisition Sub-Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field("Question Description"; Rec."Question Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Description field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field("Sub-Question ID"; Rec."Sub-Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub-Question ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

