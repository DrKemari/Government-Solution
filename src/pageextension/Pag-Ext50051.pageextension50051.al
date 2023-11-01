#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50051 "pageextension50051" extends "Bank Acc. Reconciliation Lines" 
{
    layout
    {
        addafter("Additional Transaction Info")
        {
            field("Receipt Date"; Rec."Receipt Date")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("Future Receipt Date"; Rec."Future Receipt Date")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
    }

    var
        PaymentsPost: Codeunit "Payments-Post";
}

#pragma implicitwith restore

