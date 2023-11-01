#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51210 "Pending Finance Processing"
{
    CardPageID = "Awaiting Processing";
    PageType = List;
    SourceTable = "Ins. Accreditation Table";
    SourceTableView = where(Status = filter("Awaiting Payment Processing"));

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
                field("Accreditation Code"; Rec."Accreditation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Invoiced Amount"; Rec."Invoiced Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Received Amount"; Rec."Received Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(SalesHistBilltoFactBox; "Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                Visible = false;
            }
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
            }
            part(CustomerDetailsFactBox; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
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

    trigger OnOpenPage()
    begin
        Rec.CalcFields("Received Amount");
    end;
}

#pragma implicitwith restore

