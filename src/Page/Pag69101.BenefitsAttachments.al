#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69101 "Benefits Attachments"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Benefits Attachments";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Benefit Category"; Rec."Benefit Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Category field.';
                }
                field("Benefit Description"; Rec."Benefit Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Description field.';
                }
                field("Attachment Code"; Rec."Attachment Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachment Code field.';
                }
                field("Attachment Description"; Rec."Attachment Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachment Description field.';
                }
                field("Attachment Type"; Rec."Attachment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachment Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

