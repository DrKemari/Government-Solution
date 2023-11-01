#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50005 "pageextension50005" extends "G/L Account Card" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""G/L Account Card"(Page 17)".

    layout
    {
        addafter(Blocked)
        {
            field("Budget Controlled"; Rec."Budget Controlled")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (RunObject) on ""Trial Balance"(Action 1904082706)".

    }
}

#pragma implicitwith restore

