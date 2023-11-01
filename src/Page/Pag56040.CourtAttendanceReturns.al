#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56040 "Court Attendance Returns"
{
    ApplicationArea = Basic;
    CardPageID = "Court Attendance Return Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Document registration";
    SourceTableView = where(RegistrationType = const(Return));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Registration Entry No"; Rec."Registration Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Entry No field.';
                }
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Next Court Date"; Rec."Court Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Date field.';
                }
                field("Prosecutor No."; Rec."Prosecutor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prosecutor No. field.';
                }
                field("Next Cause of Action"; Rec."Next Cause of Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Cause of Action field.';
                }
                field("Court Attendance Date"; Rec."Court Attendance Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Court Attendance Date';
                    ToolTip = 'Specifies the value of the Court Attendance Date field.';
                }
                field("Start time"; Rec."Start time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start time field.';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Time field.';
                }
                field("Before Type"; Rec."Before Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Before Type field.';
                }
                field("Before Name"; Rec."Before Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Before Name field.';
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
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Links)
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

