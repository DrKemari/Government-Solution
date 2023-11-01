#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85214 "Approval Notification"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Approval Notification.rdlc';

    dataset
    {
        dataitem("Approval Entry";"Approval Entry")
        {
            column(ReportForNavId_1; 1)
            {
            }
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
}
