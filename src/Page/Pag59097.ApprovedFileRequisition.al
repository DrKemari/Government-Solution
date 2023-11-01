#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59097 "Approved File Requisition"
{
    ApplicationArea = Basic;
    Caption = 'Approved File Requsition List';
    CardPageID = "Approved File Requsition Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "File Movement Header";
    SourceTableView = where(Status = const(Approved));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("File Number"; Rec."File Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Number field.';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field("Date Retrieved"; Rec."Date Retrieved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Retrieved field.';
                }
                field("Responsiblity Center"; Rec."Responsiblity Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsiblity Center field.';
                }
                field("Expected Return Date"; Rec."Expected Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Return Date field.';
                }
                field("Duration Requested"; Rec."Duration Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration Requested field.';
                }
                field("Date Returned"; Rec."Date Returned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Returned field.';
                }
                field("File Location"; Rec."File Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Location field.';
                }
                field("Current File Location"; Rec."Current File Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current File Location field.';
                }
                field("Retrieved By"; Rec."Retrieved By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retrieved By field.';
                }
                field("Returned By"; Rec."Returned By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Returned By field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Issuing File Location"; Rec."Issuing File Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuing File Location field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

