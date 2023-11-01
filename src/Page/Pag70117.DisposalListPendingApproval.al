#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70117 "Disposal List-Pending Approval"
{
    ApplicationArea = Basic;
    CardPageID = "Disposal Header";
    PageType = List;
    SourceTable = "Disposal Header";
    SourceTableView = where(Status = const("Pending Approval"));
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
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Reason For Disposal"; Rec."Reason For Disposal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Disposal field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

