#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51384 "Evaluation Lines"
{
    PageType = ListPart;
    SourceTable = "Application Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub-Component Code"; Rec."Sub-Component Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub-Component Code field.';
                }
                field("Sub-Component Description"; Rec."Sub-Component Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub-Component Description field.';
                }
                field("Maximum Score"; Rec."Maximum Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Score field.';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

