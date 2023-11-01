#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54015 "Bond Calcculator List"
{
    ApplicationArea = Basic;
    CardPageID = "Bond Calculator Card";
    PageType = List;
    SourceTable = "Bond Calculator";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("FXD No"; Rec."FXD No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FXD No field.';
                }
                field("System Bond No"; Rec."System Bond No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Bond No field.';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.';
                }
                field("Face Value"; Rec."Face Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Face Value field.';
                }
                field("Original Term"; Rec."Original Term")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Term field.';
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

