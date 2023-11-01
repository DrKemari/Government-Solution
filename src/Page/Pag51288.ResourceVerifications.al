#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Resource Verifications (ID 51288).
/// </summary>
#pragma implicitwith disable
Page 51288 "Resource Verifications"
{
   // CardPageID = "Resource Verification";
    Editable = false;
    PageType = List;
    SourceTable = "Acc Fee Schedules";
    // SourceTableView = where(Field22 = filter(12),
    //                         Field92 = filter(0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Service; Rec.Service)
                {
                    ApplicationArea = Basic;
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Applies To New"; Rec."Applies To New")
                {
                    ApplicationArea = Basic;
                }
                // field(Status; Status)
                // {
                //     ApplicationArea = Basic;
                // }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field(Description);
            }
            part(CustomerDetailsFactBox; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field(Description);
                Visible = false;
            }
            part(Control11; "Service Hist. Sell-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field(Description);
                Visible = false;
            }
            part(Control9; "Service Hist. Bill-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field(Description);
                Visible = false;
            }
            systempart(Control7; Links)
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

