#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54019 "Money Market List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Money Markets listings";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Issue No"; Rec."Issue No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue No field.';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.';
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maturity Date field.';
                }
                field("Tenure (Years)"; Rec."Tenure (Years)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tenure (Years) field.';
                }
                field("Coupon Rate"; Rec."Coupon Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Coupon Rate field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

