#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50011 "pageextension50011" extends "Vendor List" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Vendor List"(Page 27)".

    layout
    {
        addafter("Fax No.")
        {
            field(Email; Rec.Email)
            {
                ApplicationArea = Basic;
            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter(Name;"Search Name")
    }
    actions
    {

        //Unsupported feature: Property Modification (RunPageLink) on "PayVendor(Action 60)".

    }
}

#pragma implicitwith restore

