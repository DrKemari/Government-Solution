#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54058 "Partial Redemption history"
{
    Editable = false;
    PageType = List;
    SourceTable = "Partial Redemption history";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("TBond No"; Rec."TBond No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TBond No field.';
                }
                field("Redemption Date"; Rec."Redemption Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Redemption Date field.';
                }
                field("Old Face Value"; Rec."Old Face Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Old Face Value field.';
                }
                field("Amount Redeemed"; Rec."Amount Redeemed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Redeemed field.';
                }
                field("New Face Value"; Rec."New Face Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Face Value field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

