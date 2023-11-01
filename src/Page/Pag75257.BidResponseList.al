#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75257 "Bid Response List"
{
    ApplicationArea = Basic;
    CardPageID = "Bid Response Card";
    PageType = List;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Quote));
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
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Invitation For Supply No"; Rec."Invitation For Supply No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation For Supply No field.';
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation Notice Type field.';
                }
                field("Bid Envelope Type"; Rec."Bid Envelope Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Envelope Type field.';
                }
                field("Bid Seal Type"; Rec."Bid Seal Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Seal Type field.';
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Description field.';
                }
                field("Bidder Representative Name"; Rec."Bidder Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Representative Name field.';
                }
                field("Bidder Representative Desgn"; Rec."Bidder Representative Desgn")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Representative Designation field.';
                }
                field("Bidder Representative Address"; Rec."Bidder Representative Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Representative Address field.';
                }
                field("Bidder Witness Name"; Rec."Bidder Witness Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Witness Name field.';
                }
                field("Bidder Witness Designation"; Rec."Bidder Witness Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Witness Designation field.';
                }
                field("Bidder Witness Address"; Rec."Bidder Witness Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Witness Address field.';
                }
                field("Tender Document Source"; Rec."Tender Document Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Document Source field.';
                }
                field("Bid Charge Code"; Rec."Bid Charge Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Charge Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

