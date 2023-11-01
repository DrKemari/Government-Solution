#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50107 "pageextension50107" extends "Insurance Card" 
{
    layout
    {
        modify("Policy Coverage")
        {
            Caption = 'Sum Insured';
        }
        addafter("Annual Premium")
        {
            field("Document Status"; Rec."Document Status")
            {
                ApplicationArea = Basic;
            }
        }
        addfirst(Posting)
        {
            field("FA No."; Rec."FA No.")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Search Description";"Policy Coverage")
    }
    actions
    {
        addafter(Dimensions)
        {
            action(Submit)
            {
                ApplicationArea = FixedAssets;
                Caption = 'Submit';
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    Rec."Document Status" := Rec."document status"::Submitted;
                    Rec.Modify(true);
                end;
            }
        }
    }
}

#pragma implicitwith restore

