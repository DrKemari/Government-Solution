#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57196 "Approved Payment Schedules"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Payment Schedule";
    Editable = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Payment Schedule"),
                            Posted = const(false),
                            Status = const(Released));
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Resources Total Amount"; Rec."Resources Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resources Total Amount field.';
                }
                field("Resources Total WTax"; Rec."Resources Total WTax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resources Total WTax field.';
                }
                field("Resources Total Net"; Rec."Resources Total Net")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resources Total Net field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
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
            if UserSetup."Accounts User" = false then
                Error('You do not have permision to view Payment Vouchers');
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

