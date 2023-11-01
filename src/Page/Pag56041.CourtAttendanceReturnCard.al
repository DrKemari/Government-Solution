#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56041 "Court Attendance Return Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Document registration";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Registration Entry No"; Rec."Registration Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Entry No field.';
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
                field("Prosecutor No."; Rec."Prosecutor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prosecutor No. field.';
                }
                field("Court Attendance Date"; Rec."Court Attendance Date")
                {
                    ApplicationArea = Basic;
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
                field("Exhibit produced in court"; Rec."Exhibit produced in court")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exhibit produced in court field.';
                }
                field("Outcome of Proceedings"; Rec."Outcome of Proceedings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outcome of Proceedings field.';
                }
                field("Next Court Date"; Rec."Court Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Date field.';
                }
                field("Next Cause of Action"; Rec."Next Cause of Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Cause of Action field.';
                }
                field("Accused Counsel"; Rec."Accused Counsel")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accused Counsel field.';
                }
                field("Intrested Party Counsel"; Rec."Intrested Party Counsel")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Intrested Party Counsel field.';
                }
                field("Nature Of Application"; Rec."Nature Of Application")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature Of Application field.';
                }
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case ID field.';
                }
                field("Case Title"; Rec."Case Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Title field.';
                }
                field("Court Rank"; Rec."Court Rank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Rank field.';
                }
                field("Court Station"; Rec."Court Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Station field.';
                }
                field("Accused Name"; Rec."Accused Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accused Name field.';
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
            systempart(Control21; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.RegistrationType := Rec.Registrationtype::Return
    end;
}

#pragma implicitwith restore

