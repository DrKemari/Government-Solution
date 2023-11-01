#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56200 "Customer Feedback List"
{
    ApplicationArea = Basic;
    CardPageID = "Customer Feedback Card";
    Editable = false;
    PageType = List;
    SourceTable = "Customer FeedbackS";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Feedback Date"; Rec."Feedback Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Feedback Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date created"; Rec."Date created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date created field.';
                }
                field("Time created"; Rec."Time created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time created field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
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

