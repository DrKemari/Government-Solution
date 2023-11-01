#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57081 "Share Split Lines"
{
    PageType = List;
    SourceTable = "Split Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Investment No"; Rec."Investment No")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Expected Interest Date"; Rec."Expected Interest Date")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Amount"; Rec."Principal Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Amount + Interest"; Rec."Principal Amount + Interest")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Benefit"; Rec."Tax Benefit")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Days"; Rec."No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field("Old Ratio"; Rec."Old Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("New Ratio"; Rec."New Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("Bonus Units"; Rec."Bonus Units")
                {
                    ApplicationArea = Basic;
                }
                field("Header No"; Rec."Header No")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::"Share Split";
    end;
}

#pragma implicitwith restore

