#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57204 "Posted Warrant Lines"
{
    DeleteAllowed = false;
    InsertAllowed = false;
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
                }
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Entitlement';
                    Editable = false;
                }
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imprest Memo No."; Rec."Imprest Memo No.")
                {
                    ApplicationArea = Basic;
                    DrillDown = true;
                    DrillDownPageID = "Posted Imprest Memo";
                    Editable = false;
                    Lookup = true;
                    LookupPageID = "Posted Imprest Memo";

                    trigger OnAssistEdit()
                    begin

                        Imprest.Reset;
                        Imprest.SetRange("No.", Rec."Imprest Memo No.");
                        if Imprest.FindSet then
                        Page.Run(57041,Imprest)
                    end;
                }
                field("Imprest Subsistence"; Rec."Imprest Subsistence")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imprest Transport"; Rec."Imprest Transport")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imprest Other Costs"; Rec."Imprest Other Costs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
        Payments.SetRange("No.",Rec.No);
        Payments.SetRange(Posted,true);
        if Payments.FindFirst then begin
          VisibleReverse:=true
        end else
        VisibleReverse:=false;
    end;

    var
        Imprest: Record "Imprest Memo";
        Payments: Record Payments;
        VisibleReverse: Boolean;
}

#pragma implicitwith restore

