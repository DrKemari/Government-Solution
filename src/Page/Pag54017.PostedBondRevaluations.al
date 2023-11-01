#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54017 "Posted Bond Revaluations"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Bond Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bond Calculator";
    SourceTableView = where(Posted=const(true));
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
                }
                field("FXD No"; Rec."FXD No")
                {
                    ApplicationArea = Basic;
                }
                field("System Bond No"; Rec."System Bond No")
                {
                    ApplicationArea = Basic;
                }
                field("Issue Date"; Rec."Issue Date")
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
                field("Maturity Date"; Rec."Maturity Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

