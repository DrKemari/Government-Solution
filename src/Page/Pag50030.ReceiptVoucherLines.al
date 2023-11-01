#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50030 "Receipt Voucher Lines"
{
    PageType = ListPart;
    SourceTable = "Receipt Voucher Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reciept Voucher No";Rec."Reciept Voucher No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Category;Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";Rec."Currency Code")
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

