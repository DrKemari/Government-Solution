#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51395 "Group Visit Lines"
{
    PageType = ListPart;
    SourceTable = "Application Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Chapters; Rec.Chapters)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chapters field.';
                }
                field("Component Code"; Rec."Component Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Component Code field.';
                }
                field("Component Description"; Rec."Component Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Component Description field.';
                }
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
        area(processing)
        {
            action("Chapter Scores")
            {
                ApplicationArea = Basic;
                Image = Splitlines;
                RunObject = Page "Application Chapter Scores";
                RunPageLink = "Ápplication No." = field("Evaluation Header No.");
                ToolTip = 'Executes the Chapter Scores action.';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::"Site Visit";
    end;
}

#pragma implicitwith restore

