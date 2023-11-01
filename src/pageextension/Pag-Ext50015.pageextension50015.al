#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50015 "pageextension50015" extends "Vendor Lookup" 
{
    layout
    {
        addafter(Name)
        {
            // field("Vendor Posting Group";"Vendor Posting Group")
            // {
            //     ApplicationArea = Basic;
            // }
            field(Balance; Rec.Balance)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

