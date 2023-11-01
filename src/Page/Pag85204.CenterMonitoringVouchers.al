#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85204 "Center Monitoring Vouchers"
{
    CardPageID = "Center Monitoring Card";
    PageType = List;
    SourceTable = "Monitoring Header";

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
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Application Description"; Rec."Application Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Description field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Aggregate Score"; Rec."Aggregate Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aggregate Score field.';
                }
                field("Maximum Aggregate Score"; Rec."Maximum Aggregate Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Aggregate Score field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Institution Email"; Rec."Institution Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Email field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Insitution Code"; Rec."Insitution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insitution Code field.';
                }
                field(Strength; Rec.Strength)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strength field.';
                }
                field("Meeting Date"; Rec."Meeting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Date field.';
                }
                field("Meeting Link"; Rec."Meeting Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Link field.';
                }
                field("Meeting Time"; Rec."Meeting Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Time field.';
                }
                field("Percentage Score"; Rec."Percentage Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage Score field.';
                }
                field("Verdict Code"; Rec."Verdict Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Code field.';
                }
                field("Verdict Description"; Rec."Verdict Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Description field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control23; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; Links)
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

