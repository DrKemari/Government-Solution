#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55027 "Board commitee Meetings List"
{
    CardPageID = "Board Meeting Card";
    PageType = List;
    SourceTable = "Board Meetings";
    SourceTableView = where(Status = filter(Pending),
                            Published = filter(false),
                            "Meeting Type" = filter("Committee Meeting"));

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
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

