#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65084 "Open Internal Calls"
{
    ApplicationArea = Basic;
    Caption = 'Open Internal Calls';
    CardPageID = "Funding Opportunity Card";
    Editable = false;
    PageType = List;
    SourceTable = "Funding Opportunity";
    SourceTableView = where("Grant Class" = const(Internal),
                            Status = const(Open));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Call No."; Rec."Call No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Call No. field.';
                }
                field("Organization ID"; Rec."Organization ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization ID field.';
                }
                field("Issuing Organization"; Rec."Issuing Organization")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuing Organization field.';
                }
                field("Call Type"; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Call Type field.';
                }
                field("External Announcement No"; Rec."External Announcement No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Announcement No field.';
                }
                field("Release Date"; Rec."Release Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Release Date field.';
                }
                field("Application Due Date"; Rec."Application Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Due Date field.';
                }
                field("Application date"; Rec."Application date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application date field.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiration Date field.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Home Page field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

