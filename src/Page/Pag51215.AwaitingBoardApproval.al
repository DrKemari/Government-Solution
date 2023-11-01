#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51215 "Awaiting Board Approval"
{
    // CardPageID = "Awaiting Completeness Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Ins. Accreditation Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Accreditation No."; Rec."Accreditation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accreditation No. field.';
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution No. field.';
                }
                field("Institution Name."; Rec."Institution Name.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name. field.';
                }
                field("Institution Campus"; Rec."Institution Campus")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Campus field.';
                }
                field("Institution Phone No."; Rec."Institution Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Phone No. field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Convereted By"; Rec."Convereted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Convereted By field.';
                }
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Date field.';
                }
                field(Converted; Rec.Converted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Converted field.';
                }
                field("Verdict Details"; Rec."Verdict Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Details field.';
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Reference No. field.';
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
                //     SubPageLink = "No." = field(Field30);
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
        //CALCFIELDS("Received Amount");
    end;
}

#pragma implicitwith restore

