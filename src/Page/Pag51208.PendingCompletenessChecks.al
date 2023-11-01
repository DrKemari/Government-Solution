#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51208 "Pending Completeness Checks"
{
    CardPageID = "Unprocessed Insitution";
    PageType = List;
    SourceTable = "Ins. Accreditation Table";
    SourceTableView = where(Status = filter("Awaiting Completeness Checks"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Accreditation No."; Rec."Accreditation No.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Name."; Rec."Institution Name.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Campus"; Rec."Institution Campus")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Phone No."; Rec."Institution Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("Convereted By"; Rec."Convereted By")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = Basic;
                }
                field(Converted; Rec.Converted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(SalesHistSelltoFactBox; "Sales Hist. Sell-to FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No. Series");
            }
            part(SalesHistBilltoFactBox; "Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No. Series");
                Visible = false;
            }
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field("No. Series");
            }
            part(CustomerDetailsFactBox; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No. Series");
                Visible = false;
            }
            part(Control10; "Service Hist. Sell-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field("No. Series");
                Visible = false;
            }
            part(Control6; "Service Hist. Bill-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field("No. Series");
                Visible = false;
            }
            systempart(Control8; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

