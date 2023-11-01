#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59014 "Daily Work Ticket List"
{
    ApplicationArea = Basic;
    Caption = 'Open Daily Work Ticket List';
   // CardPageID = "Daily Work Ticket Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Dialy Work Ticket Header";
    SourceTableView = where(Status = filter(Open | "Pending Approval"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Work Ticket field.';
                }
                field("Vehicle Registration No"; Rec."Vehicle Registration No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Registration No field.';
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Request field.';
                }
                field("Month Date"; Rec."Month Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Month Date field.';
                }
                field("Month Name"; Rec."Month Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Month Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Closed by"; Rec."Closed by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed by field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Total Km's Covered"; Rec."Total Km's Covered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Km''s Covered field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

