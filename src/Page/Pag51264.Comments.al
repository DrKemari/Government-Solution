#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51264 "Comments"
{
    PageType = ListPart;
    SourceTable = "Proposal Document Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Chapter Code"; Rec."Chapter Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chapter Code field.';
                }
                field("Chapter Name"; Rec."Chapter Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chapter Name field.';
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
                field("Sub-Topic Code"; Rec."Sub-Topic Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub-Topic Code field.';
                }
                field("Sub-Topic Name"; Rec."Sub-Topic Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub-Topic Name field.';
                }
                field(Control19; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Comment)
            {
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Accreditation Comment Sheet";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Comments action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

