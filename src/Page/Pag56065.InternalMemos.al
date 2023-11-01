#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56065 "Internal Memos"
{
    ApplicationArea = Basic;
    CardPageID = "Internal Memo";
    PageType = List;
    SourceTable = "Internal Memos";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(RE; Rec.RE)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RE field.';
                }
                field("Employee UserID"; Rec."Employee UserID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserID field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field("To CEO"; Rec."To CEO")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To field.';
                }
                field(Through; Rec.Through)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Through field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

