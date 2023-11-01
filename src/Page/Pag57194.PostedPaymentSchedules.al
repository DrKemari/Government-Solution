#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57194 "Posted Payment Schedules"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Payment Schedule";
    Editable = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type"=const("Payment Schedule"),
                            Posted=const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Payment processed"; Rec."Payment processed")
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Resources Total Amount"; Rec."Resources Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Resources Total WTax"; Rec."Resources Total WTax")
                {
                    ApplicationArea = Basic;
                }
                field("Resources Total Net"; Rec."Resources Total Net")
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
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
        if UserSetup."Accounts User"=false then
        Error('You do not have permision to view Payment Vouchers');
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

