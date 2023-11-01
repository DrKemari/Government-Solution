#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50031 "pageextension50031" extends "General Ledger Setup" 
{
    layout
    {
        addafter("Inv. Rounding Type (LCY)")
        {
            field("Tax Rounding Precision (LCY)"; Rec."Tax Rounding Precision (LCY)")
            {
                ApplicationArea = Basic;
            }
            field("Tax Rounding Type (LCY)"; Rec."Tax Rounding Type (LCY)")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Application)
        {
            group("Customized Number Series")
            {
                field("File Movement Nos"; Rec."File Movement Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Reallocation Nos."; Rec."Budget Reallocation Nos.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

#pragma implicitwith restore

