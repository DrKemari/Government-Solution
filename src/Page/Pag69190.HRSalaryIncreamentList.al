#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69190 "HR Salary Increament List"
{
    ApplicationArea = Basic;
    CardPageID = "HR Salary Increament Card";
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "HR Salary Increament Header";
    SourceTableView = where(Status = const(Open));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Batch No"; Rec."Batch No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Batch No field.';
                }
                field(Descriptions; Rec.Descriptions)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Descriptions field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Run By"; Rec."Run By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Run By field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

