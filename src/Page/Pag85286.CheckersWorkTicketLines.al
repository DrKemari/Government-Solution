#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85286 "Checkers Work Ticket Lines"
{
    PageType = ListPart;
    SourceTable = "Checkers Ticket Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Course; Rec.Course)
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field("Paper ID"; Rec."Paper ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper ID field.';
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Name field.';
                }
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center Code field.';
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center Name field.';
                }
                field("No. of Scripts Before"; Rec."No. of Scripts Before")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Scripts Checked';
                    ToolTip = 'Specifies the value of the No. of Scripts Checked field.';
                }
                field("No. of Scripts After"; Rec."No. of Scripts After")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Scripts Compared';
                    ToolTip = 'Specifies the value of the No. of Scripts Compared field.';
                }
                field("No. of Envelope"; Rec."No. of Envelope")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Envelope field.';
                }
                field("Cumulative Total"; Rec."Cumulative Total")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumulative Total field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

