#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57183 "Salary Advance List"
{
    ApplicationArea = Basic;
    CardPageID = "Salary Advance Card";
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = filter("Salary Advance"),
                            Status = filter(Open | "Pending Approval"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                }
                field("No of months deducted"; Rec."No of months deducted")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Installment"; Rec."Monthly Installment")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Salary Advance";
        Rec."Document Type" := Rec."document type"::"Salary Advance";
        /*
        Date := TODAY;
        "Created By" := USERID;
        "Account Type" := "Account Type"::Customer;
        */

    end;

    var
        Usersetup: Record "User Setup";
        Employee: Record Employee;
}

#pragma implicitwith restore

