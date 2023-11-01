#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59038 "Approved Maintenance Requests"
{
    ApplicationArea = Basic;
    CardPageID = "Maintenance Request";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = order(ascending)
                      where(Status = filter(Approved),
                            Type = filter(Maintenance),
                            "PO Created" = filter(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field("Vehicle Reg No"; Rec."Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vehicle Reg No field.';
                }
                field("Vendor(Dealer)"; Rec."Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vendor(Dealer) field.';
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Odometer Reading field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Date Taken for Maintenance"; Rec."Date Taken for Maintenance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Taken for Maintenance field.';
                }
                field("Type of Maintenance"; Rec."Type of Maintenance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Maintenance field.';
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prepared By field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
                field("Vendor Invoice No"; Rec."Vendor Invoice No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Invoice No field.';
                }
                field("Posted Invoice No"; Rec."Posted Invoice No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Invoice No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

