#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69813 "Interview Questions"
{
    PageType = ListPart;
    SourceTable = "Candidate Interview Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Category"; Rec."Question Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Category field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field(Rating; Rec.Rating)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field("Score Code"; Rec."Score Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score Code field.';
                }
                field("Evaluation Comments"; Rec."Evaluation Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Comments field.';
                }
                field("Maximum Raw Score"; Rec."Maximum Raw Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Raw Score field.';
                }
                field("Weighted Score %"; Rec."Weighted Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Score % field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

