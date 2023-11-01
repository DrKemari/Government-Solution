#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56042 "CaseFile Movment Registr List"
{
    ApplicationArea = Basic;
    CardPageID = "Case file Movement register";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Case File Movement Register";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Movement Reason Code"; Rec."Movement Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Movement Reason Code field.';
                }
                field("Movement Reason"; Rec."Movement Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Movement Reason field.';
                }
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case ID field.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Type field.';
                }
                field("Source No"; Rec."Source No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source No field.';
                }
                field("Destination Type"; Rec."Destination Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Type field.';
                }
                field("Destination No"; Rec."Destination No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination No field.';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Date field.';
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
            systempart(Control16; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Links)
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

