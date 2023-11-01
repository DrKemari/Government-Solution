#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85437 "CEO Specific Comments"
{
    PageType = ListPart;
    SourceTable = "Examination Review Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question No."; Rec."Question No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question No. field.';
                }
                field("Topic Code"; Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Topic Code field.';
                }
                field("Topic Name"; Rec."Topic Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Topic Name field.';
                }
                field(References; Rec.References)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the References field.';
                }
                field("Knowledge and Comprehension"; Rec."Knowledge and Comprehension")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Knowledge and Comprehension field.';
                }
                field("Application and Analysis"; Rec."Application and Analysis")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application and Analysis field.';
                }
                field("Evaluation and Creativity"; Rec."Evaluation and Creativity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation and Creativity field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Taken field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

