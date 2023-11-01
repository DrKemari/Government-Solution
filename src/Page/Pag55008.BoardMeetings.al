#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55008 "Board Meetings"
{
    ApplicationArea = Basic;
    Caption = 'Board Meetings';
    CardPageID = "Board Meeting Card1";
    PageType = List;
    SourceTable = "Board Meetings1";
    SourceTableView = where(Published = filter(false));
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
                    Caption = 'Meeting Ref No.';
                    ToolTip = 'Specifies the value of the Meeting Ref No. field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Ref. No:';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Meeting Ref. No: field.';
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start date field.';
                }
                field("End time"; Rec."End time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End time field.';
                }
                field("Meeting group"; Rec."Meeting group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting group field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Meeting Status"; Rec."Meeting Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Status field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
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

