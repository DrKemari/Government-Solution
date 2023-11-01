Page 50196 "PR Bank Accounts"
{
    PageType = List;
    SourceTable = "PR Bank Accounts";
    DataCaptionFields = "Bank Code", "Bank Name";


    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field(BankCode; "Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(BankName; "Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(BankType; "Bank Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Branches)
            {
                ApplicationArea = Basic;
                Image = BankAccount;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "PR Bank Branches";
                RunPageLink = "Bank Code" = field("Bank Code");
            }

        }
    }
}

