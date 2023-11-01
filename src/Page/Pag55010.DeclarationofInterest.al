#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55010 "Declaration of Interest"
{
    PageType = List;
    SourceTable = "Board Meeting Comments";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the EntryNo field.';
                }
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Code field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member No field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field(Agenda; Rec.Agenda)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda field.';
                }
                field("Agenda Description"; Rec."Agenda Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

