#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50043 "pageextension50043" extends "Work Types" 
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field(Rate; Rec.Rate)
            {
                ApplicationArea = Basic;
            }
            field(Category; Rec.Category)
            {
                ApplicationArea = Basic;
            }
            field("G/L Account"; Rec."G/L Account")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

