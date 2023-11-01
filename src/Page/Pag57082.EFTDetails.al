#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57082 "EFT Details"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "EFT Details";
    SourceTableView = sorting("Header No", No);
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Staff No"; Rec."Staff No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Staff No field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Charges; Rec.Charges)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Charges field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Destination Account Type"; Rec."Destination Account Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Not Available"; Rec."Not Available")
                {
                    ApplicationArea = Basic;
                    Caption = 'Not Avail.';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Not Avail. field.';
                }
                field("Destination Account No"; Rec."Destination Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Account No field.';
                }
                field(DCHAR; DCHAR)
                {
                    ApplicationArea = Basic;
                    Caption = 'CR';
                    Editable = false;
                    ToolTip = 'Specifies the value of the CR field.';
                }
                field("Destination Account Name"; Rec."Destination Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Account Name field.';
                }
                field("Bank No"; Rec."Bank No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank No field.';
                }
                field("Payee Bank Name"; Rec."Payee Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payee Bank Name field.';
                }
                field("Standing Order No"; Rec."Standing Order No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Standing Order No field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        DCHAR := 0;
        DCHAR := StrLen(Rec."Destination Account No");

        NotAvailable := true;
        AvailableBal := 0;


        //Available Bal
        if Accounts.Get(Rec."Account No") then begin
            Accounts.CalcFields(Accounts.Balance);
            //IF AccountTypes.GET(Accounts."Account Type") THEN BEGIN
            AvailableBal := Accounts.Balance;

            if Rec.Amount <= AvailableBal then
                NotAvailable := false;

            //END;
        end;

        //Available Bal
    end;

    var
        DCHAR: Integer;
        NotAvailable: Boolean;
        AvailableBal: Decimal;
        Charges: Decimal;
        Accounts: Record Vendor;
}

#pragma implicitwith restore

