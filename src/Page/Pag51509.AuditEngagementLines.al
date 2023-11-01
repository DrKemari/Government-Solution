#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51509 "Audit Engagement Lines"
{
    Caption = 'Audit Engagement Lines';
    PageType = ListPart;
    SourceTable = "Audit Requisition Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Section ID"; Rec."Section ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section ID field.';
                }
                field("Section Description"; Rec."Section Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Description field.';
                }
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
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sub-Questions")
            {
                ApplicationArea = Basic;
                RunObject = Page "Audit Engagement Sub-Lines";
             //   RunPageLink = "Question ID" = field("Question ID");
                ToolTip = 'Executes the Sub-Questions action.';
            }
        }
    }
}

#pragma implicitwith restore

