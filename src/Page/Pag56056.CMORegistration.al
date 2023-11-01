#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56056 "CMO Registration"
{
    PageType = Card;
    SourceTable = "CMO Registration";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Time field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Name of society"; Rec."Name of society")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name of society field.';
                }
                field("Address of society"; Rec."Address of society")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address of society field.';
                }
                field("Physical address"; Rec."Physical address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Physical address field.';
                }
                field("Name of Agent"; Rec."Name of Agent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name of Agent field.';
                }
                field("Address of agent"; Rec."Address of agent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address of agent field.';
                }
                field("Date of registration"; Rec."Date of registration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of registration field.';
                }
                field("Number of registration"; Rec."Number of registration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of registration field.';
                }
                field("Number of members"; Rec."Number of members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of members field.';
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Class field.';
                }
                field("Reasons for making the request"; Rec."Reasons for making the request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons for making the request field.';
                }
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Date field.';
                }
                field("Submission Time"; Rec."Submission Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Time field.';
                }
                field("Submitted By"; Rec."Submitted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Registration;
    end;
}

#pragma implicitwith restore

