#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50033 "Receipt Vouchers-Split"
{
    ApplicationArea = Basic;
    CardPageID = "Receipt Voucher-Split";
    PageType = List;
    SourceTable = "Receipt Voucher";
    SourceTableView = where(Type=const(Split),
                            Posted=const(false));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By";Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Time Posted";Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code";Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field(Currency;Rec.Currency)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

