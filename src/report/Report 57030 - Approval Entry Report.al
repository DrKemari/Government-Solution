report 57030 "Approval Entry Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Approval Entry Report.rdlc';

    dataset
    {
        dataitem("Approval Entry";"Approval Entry")
        {
            //The property 'DataItemTableView' shouldn't have an empty value.
            //DataItemTableView = '';
            RequestFilterFields = "Document Type","Approver ID",Status,"Document No.";
            column(CName;ObjCInfo.Name)
            {
            }
            column(CPic;ObjCInfo.Picture)
            {
            }
            column(Homepage;Homepage)
            {
            }
            column(Company_address;Address)
            {
            }
            column(Physical_address;Coaddress)
            {
            }
            column(DocumentDesc;DocumentDesc)
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
            column(LimitType_ApprovalEntry;"Approval Entry"."Limit Type")
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
            column(EntryNo_ApprovalEntry;"Approval Entry"."Entry No.")
            {
            }
            column(WorkflowStepInstanceID_ApprovalEntry;"Approval Entry"."Workflow Step Instance ID")
            {
            }
            column(RelatedtoChange_ApprovalEntry;"Approval Entry"."Related to Change")
            {
            }

            trigger OnAfterGetRecord()
            begin
                DocumentDesc:='';
                if "Approval Entry"."Table ID"=57000 then begin

                  Payments.Reset;
                  Payments.SetRange("No.","Approval Entry"."Document No.");
                  if Payments.FindFirst then begin
                    if Payments."Payment Type"=Payments."Payment Type"::"Salary Advance" then begin
                   DocumentDesc:=Payments.Purpose;
                  end else
                begin
                   DocumentDesc:=Payments."Payment Narration";
                  end;
                  end;

                end;
                if "Approval Entry"."Table ID"=69205 then begin
                  Leave.Reset;
                  Leave.SetRange("Application Code","Approval Entry"."Document No.");
                  if Leave.FindFirst then begin
                    DocumentDesc:=Leave."Leave Type";
                  end;
                  end;
                  if "Approval Entry"."Table ID"=38 then begin
                  PurchaseHeader.Reset;
                  PurchaseHeader.SetRange("No.","Approval Entry"."Document No.");
                  if PurchaseHeader.FindFirst then begin
                    DocumentDesc:='Purchase Order To Vendor:'+' '+PurchaseHeader."Pay-to Name";
                  end;
                  end;
                  if "Approval Entry"."Table ID"=69030 then begin
                  PayrollHeader.Reset;
                  PayrollHeader.SetRange("No.","Approval Entry"."Document No.");
                  if PayrollHeader.FindFirst then begin
                    DocumentDesc:=PayrollHeader.Description;
                  end;
                  end
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

    trigger OnInitReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
    end;

    trigger OnPreReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
        Coname:=ObjCInfo.Name;
        Address:=ObjCInfo."Address 2";
        Coaddress:=ObjCInfo.Address;
        Homepage:=ObjCInfo."Home Page";
    end;

    var
        ObjCInfo: Record "Company Information";
        Coname: Text;
        Address: Text;
        Coaddress: Text;
        Homepage: Text;
        Payments: Record Payments;
        Leave: Record "HR Leave Application";
        PurchaseHeader: Record "Purchase Header";
        DocumentDesc: Text;
        PayrollHeader: Record "Payroll Header";
}

