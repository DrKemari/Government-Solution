#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50103 "pageextension50103" extends "Fixed Asset Setup" 
{
    layout
    {
        addafter("Automatic Insurance Posting")
        {
            field("Insurance Expiry Period"; Rec."Insurance Expiry Period")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Fixed Asset Nos.")
        {
            field("Staff Insurance Nos."; Rec."Staff Insurance Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Insurance Claim  Nos."; Rec."Insurance Claim  Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Gate Pass Nos."; Rec."Gate Pass Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Property Reports  Nos."; Rec."Property Reports  Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Maintenance Request  Nos."; Rec."Maintenance Request  Nos.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

