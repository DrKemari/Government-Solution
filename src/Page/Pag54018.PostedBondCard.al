#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54018 "Posted Bond Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Bond Calculator";

    layout
    {
        area(content)
        {
            group("Intial Info")
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("FXD No"; Rec."FXD No")
                {
                    ApplicationArea = Basic;
                }
                field("System Bond No"; Rec."System Bond No")
                {
                    ApplicationArea = Basic;
                }
                field("Face Value"; Rec."Face Value")
                {
                    ApplicationArea = Basic;
                }
                field("Original Term"; Rec."Original Term")
                {
                    ApplicationArea = Basic;
                }
                field("Coupon Rate"; Rec."Coupon Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Nominal Amount (Cost)"; Rec."Nominal Amount (Cost)")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Input Details")
            {
                field("Settlement Date"; Rec."Settlement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Yield(input)"; Rec."Yield(input)")
                {
                    ApplicationArea = Basic;
                }
                field("Dirty Price/per value"; Rec."Dirty Price/per value")
                {
                    ApplicationArea = Basic;
                }
                field("% commission"; Rec."% commission")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Dates)
            {
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field("Next Coupon"; Rec."Next Coupon")
                {
                    ApplicationArea = Basic;
                }
                field("Last Coupon"; Rec."Last Coupon")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Stastistical Information")
            {
                field("Set to Next"; Rec."Set to Next")
                {
                    ApplicationArea = Basic;
                }
                field("Last to next"; Rec."Last to next")
                {
                    ApplicationArea = Basic;
                }
                field("Last to set"; Rec."Last to set")
                {
                    ApplicationArea = Basic;
                }
                field("Average unpaid coupons"; Rec."Average unpaid coupons")
                {
                    ApplicationArea = Basic;
                }
                field("Unpaid Coupon"; Rec."Unpaid Coupon")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Bond Analysis")
            {
                field("Market Rate"; Rec."Market Rate")
                {
                    ApplicationArea = Basic;
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                }
                field("Day Basis"; Rec."Day Basis")
                {
                    ApplicationArea = Basic;
                }
                field("Accrued Interest"; Rec."Accrued Interest")
                {
                    ApplicationArea = Basic;
                }
                field("Clean Price"; Rec."Clean Price")
                {
                    ApplicationArea = Basic;
                }
                field("Bond Consideration"; Rec."Bond Consideration")
                {
                    ApplicationArea = Basic;
                }
                field(Commission; Rec.Commission)
                {
                    ApplicationArea = Basic;
                }
                field("Net Amount Receivable"; Rec."Net Amount Receivable")
                {
                    ApplicationArea = Basic;
                }
                field("Book value for the Bond"; Rec."Book value for the Bond")
                {
                    ApplicationArea = Basic;
                }
                field("Accrued Interest 2"; Rec."Accrued Interest 2")
                {
                    ApplicationArea = Basic;
                }
                field("Loss/Profit on sale of bond"; Rec."Loss/Profit on sale of bond")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(ReOpen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to reopen this transaction?')=true then begin
                        Rec.Posted := false;
                        Rec.Modify;
                    end;
                end;
            }
        }
    }
}

#pragma implicitwith restore

