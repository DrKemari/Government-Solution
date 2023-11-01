#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85434 "Chief General Comments"
{
    PageType = ListPart;
    SourceTable = "Review Specific Comments";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Comment Code"; Rec."Comment Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment Code field.';
                }
                field("Comment Description"; Rec."Comment Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment Description field.';
                }
                field(Response; Rec.Response)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

