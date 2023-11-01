#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57167 "Imprest Warrant Lines"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    PageType = ListPart;
    SourceTable = "Imprest Voucher Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Reverse; Rec.Reverse)
                {
                    ApplicationArea = Basic;
                    Visible = VisibleReverse;
                    ToolTip = 'Specifies the value of the Reverse field.';
                }
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advance Type field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Entitlement';
                    ToolTip = 'Specifies the value of the Total Entitlement field.';
                }
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount LCY field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Imprest Memo No."; Rec."Imprest Memo No.")
                {
                    ApplicationArea = Basic;
                    DrillDown = true;
                    DrillDownPageID = "Posted Imprest Memo";
                    Lookup = true;
                    LookupPageID = "Posted Imprest Memo";
                    ToolTip = 'Specifies the value of the Imprest Memo No. field.';
                    trigger OnAssistEdit()
                    begin

                        Imprest.Reset;
                        Imprest.SetRange("No.", Rec."Imprest Memo No.");
                        if Imprest.FindSet then
                            Page.Run(57041, Imprest)
                    end;
                }
                field("Imprest Subsistence"; Rec."Imprest Subsistence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Subsistence field.';
                }
                field("Imprest Transport"; Rec."Imprest Transport")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Transport field.';
                }
                field("Imprest Other Costs"; Rec."Imprest Other Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Other Costs field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }

    trigger OnAfterGetRecord()
    begin
        Payments.Reset;
        Payments.SetRange("No.", Rec.No);
        Payments.SetRange(Posted, true);
        if Payments.FindFirst then begin
            VisibleReverse := true
        end else
            VisibleReverse := false;
    end;

    var
        Imprest: Record "Imprest Memo";
        Payments: Record Payments;
        VisibleReverse: Boolean;
}

#pragma implicitwith restore

