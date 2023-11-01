#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59034 "Closed Fuel Requests"
{
    ApplicationArea = Basic;
    CardPageID = "Fuel Requisition Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = order(ascending)
                      where(Type = filter(Fuel),
                            Status = filter(Closed));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field("Total Price of Fuel"; Rec."Total Price of Fuel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount Reimbursed';
                    ToolTip = 'Specifies the value of the Amount Reimbursed field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reimbursement From Project';
                    ToolTip = 'Specifies the value of the Reimbursement From Project field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Name';
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Date';
                    ToolTip = 'Specifies the value of the Approved Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reimbursement Date';
                    ToolTip = 'Specifies the value of the Reimbursement Date field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reimbursed By';
                    ToolTip = 'Specifies the value of the Reimbursed By field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

