report 59073 "Rejected Requests"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Rejected Requests.rdlc';

    dataset
    {
        dataitem("Approval Entry";"Approval Entry")
        {
            DataItemTableView = WHERE("Table ID"=FILTER(59070),Status=CONST(Rejected));
            column(TableID_ApprovalEntry;"Approval Entry"."Table ID")
            {
            }
            column(DocumentType_ApprovalEntry;"Approval Entry"."Document Type")
            {
            }
            column(DocumentNo_ApprovalEntry;"Approval Entry"."Document No.")
            {
            }
            column(SequenceNo_ApprovalEntry;"Approval Entry"."Sequence No.")
            {
            }
            column(ApprovalCode_ApprovalEntry;"Approval Entry"."Approval Code")
            {
            }
            column(SenderID_ApprovalEntry;"Approval Entry"."Sender ID")
            {
            }
            column(SalespersPurchCode_ApprovalEntry;"Approval Entry"."Salespers./Purch. Code")
            {
            }
            column(ApproverID_ApprovalEntry;"Approval Entry"."Approver ID")
            {
            }
            column(Status_ApprovalEntry;"Approval Entry".Status)
            {
            }
            column(DateTimeSentforApproval_ApprovalEntry;"Approval Entry"."Date-Time Sent for Approval")
            {
            }
            column(LastDateTimeModified_ApprovalEntry;"Approval Entry"."Last Date-Time Modified")
            {
            }
            column(LastModifiedByUserID_ApprovalEntry;"Approval Entry"."Last Modified By User ID")
            {
            }
            column(Comment_ApprovalEntry;"Approval Entry".Comment)
            {
            }
            column(DueDate_ApprovalEntry;"Approval Entry"."Due Date")
            {
            }
            column(Amount_ApprovalEntry;"Approval Entry".Amount)
            {
            }
            column(AmountLCY_ApprovalEntry;"Approval Entry"."Amount (LCY)")
            {
            }
            column(CurrencyCode_ApprovalEntry;"Approval Entry"."Currency Code")
            {
            }
            column(ApprovalType_ApprovalEntry;"Approval Entry"."Approval Type")
            {
            }
            column(AvailableCreditLimitLCY_ApprovalEntry;"Approval Entry"."Available Credit Limit (LCY)")
            {
            }
            column(PendingApprovals_ApprovalEntry;"Approval Entry"."Pending Approvals")
            {
            }
            column(DelegationDateFormula_ApprovalEntry;"Approval Entry"."Delegation Date Formula")
            {
            }
            column(NumberofApprovedRequests_ApprovalEntry;"Approval Entry"."Number of Approved Requests")
            {
            }
            column(NumberofRejectedRequests_ApprovalEntry;"Approval Entry"."Number of Rejected Requests")
            {
            }
            column(WorkflowStepInstanceID_ApprovalEntry;"Approval Entry"."Workflow Step Instance ID")
            {
            }
            column(RelatedtoChange_ApprovalEntry;"Approval Entry"."Related to Change")
            {
            }
            column(Details;"Approval Entry".RecordDetails)
            {
            }
            column(ToApprove;RecordIDText)
            {
            }
            column(CI_Picture;CI.Picture)
            {
            }
            column(CI_Address;CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
            {
            }
            column(CI_City;CI.City)
            {
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
            }
            column(COMPANYNAME;CompanyName)
            {
            }

            trigger OnAfterGetRecord()
            begin
                RecordIDText := Format("Record ID to Approve",0,1);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin

        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        Overdue: Option Yes," ";
        RecordIDText: Text;
        ShowChangeFactBox: Boolean;
        DelegateEnable: Boolean;
        ShowRecCommentsEnabled: Boolean;
}

