Page 81290 "PR Transaction Codes List"
{
    CardPageID = "PR Transaction Code Card";
    PageType = List;
    SourceTable = "PR Transaction Codes";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Enabled = true;
                field(TransactionCode; "Transaction Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field(TransactionName; "Transaction Name")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = All;
                    Enabled = true;
                }
                field(Frequency; Frequency)
                {
                    ApplicationArea = All;
                    Enabled = true;
                }

                field("Transaction Charge Code"; "Transaction Charge Code")
                {
                    ApplicationArea = all;
                }

                field(BalanceType; "Balance Type")
                {
                    ApplicationArea = All;
                    Editable = true;
                    Enabled = true;
                }
                field(Taxable; Taxable)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Enabled = true;
                }

                field(GLAccount; "GL Account")
                {
                    ApplicationArea = All;
                }
                field(GLAccountName; "G/L Account Name")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field("Exempt Housing Levy"; "Exempt Housing Levy")
                {
                    ApplicationArea = All;
                }

                field("coop parameters"; "coop parameters")
                {
                    ApplicationArea = all;
                }
                field(GroupCode; "Group Code")
                {
                    ApplicationArea = All;
                    TableRelation = "PR Transaction Codes";
                }
                field(GroupDescription; "Group Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    var
        myInt: Integer;
}

