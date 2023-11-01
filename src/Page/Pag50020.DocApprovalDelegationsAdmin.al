#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50020 "Doc Approval Delegations Admin"
{
    CardPageID = "Doc Approval Delegation Admin";
    Editable = false;
    PageType = List;
    SourceTable = "Document Approval Delegation";
    SourceTableView = where(Status = const(Open));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Current Approver ID"; Rec."Current Approver ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Approver ID field.';
                }
                field("New Approver ID"; Rec."New Approver ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Approver ID field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
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
        // SETRANGE("Current Approver ID",USERID);
    end;
}

