#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51206 "Institution Onboarding List"
{
    CardPageID = "Insitution Onboarding Card";
    PageType = List;
    SourceTable = "Accreditation Verdict Setup";
    //SourceTableView = where(Blocked = filter(No));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                // field(Address; Address)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Address field.';
                // }
                // field("KRA Pin"; "KRA Pin")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the KRA Pin field.';
                // }
                // field(Categories; Categories)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Categories field.';
                // }
                // field("Accreditation Type"; "Accreditation Type")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Accreditation Type field.';
                // }
                // field(Sponsor; Sponsor)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Sponsor field.';
                // }
            }
        }
        area(factboxes)
        {
            part(SalesHistSelltoFactBox; "Sales Hist. Sell-to FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field(Code);
            }
            part(SalesHistBilltoFactBox; "Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field(Code);
                Visible = false;
            }
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field(Code);
            }
            part(CustomerDetailsFactBox; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field(Code);
                Visible = false;
            }
            part(Control9; "Service Hist. Sell-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field(Code);
                Visible = false;
            }
            part(Control8; "Service Hist. Bill-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field(Code);
                Visible = false;
            }
            systempart(Control6; Links)
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

