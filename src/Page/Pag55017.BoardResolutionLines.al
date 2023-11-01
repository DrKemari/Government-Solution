#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55017 "Board Resolution Lines"
{
    PageType = ListPart;
    SourceTable = "Board Resolution Lines";

    layout
    {
        area(content)
        {
            repeater(Control9)
            {
                field(Agenda; Rec.Agenda)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda field.';
                }
                field("Resolution No"; Rec."Resolution No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resolution No field.';
                }
                field(Resolution; Rec.Resolution)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Resolution field.';
                }
                field("Action Owner"; Rec."Action Owner")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Owner field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Taken field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of the Meeting';
                    ToolTip = 'Specifies the value of the Date of the Meeting field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

