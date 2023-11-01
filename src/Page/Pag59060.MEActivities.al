#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50045 "M&E  Activities2"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Finance Cue";

    layout
    {
        area(content)
        {
            cuegroup("Payment and Imprest Management")
            {
                Caption = 'Payment and Imprest Management';
                field("Approved Payment Vouchers"; Rec."Approved Payment Vouchers")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approved Payment Vouchers";
                    ToolTip = 'Specifies the value of the Approved Payment Vouchers field.';
                }
                field("Pending Payment Vouchers"; Rec."Pending Payment Vouchers")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Payments Vouchers";
                    ToolTip = 'Specifies the value of the Pending Payment Vouchers field.';
                }
                field("Approved Surrenders"; Rec."Approved Surrenders")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approved Imprest Surrenders";
                    ToolTip = 'Specifies the value of the Approved Surrenders field.';
                }
                field("POs Pending Approval"; Rec."POs Pending Approval")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Purchase Order List";
                    ToolTip = 'Specifies the number of purchase orders that are pending approval.';
                    Visible = false;
                }
                field("SOs Pending Approval"; Rec."SOs Pending Approval")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of sales orders that are pending approval.';
                    Visible = false;
                }

                actions
                {
                    action("Create Reminders...")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Create Reminders...';
                        Image = CreateReminders;
                        RunObject = Report "Create Reminders";
                        ToolTip = 'Remind your customers of late payments.';
                    }
                    action("Create Finance Charge Memos...")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Create Finance Charge Memos...';
                        Image = CreateFinanceChargememo;
                        RunObject = Report "Create Finance Charge Memos";
                        ToolTip = 'Issue finance charge memos to your customers as a consequence of late payment.';
                    }
                }
            }
            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                // field("Requests to Approve"; "Requests to Approve")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Requests to Approve";
                //     ToolTip = 'Specifies the value of the Requests to Approve field.';
                // }
                // field("Requests Sent for Approval"; "Requests Sent for Approval")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Approval Entries";
                //     ToolTip = 'Specifies the value of the Requests Sent for Approval field.';
                // }
            }
            cuegroup("Cash Management")
            {
                Caption = 'Cash Management';
                field("Customer with balance"; Rec."Customer with balance")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Customer List";
                    ToolTip = 'Specifies the value of the Customer with balance field.';
                }
                field("Vendors with Balance"; Rec."Vendors with Balance")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Vendor List";
                    ToolTip = 'Specifies the value of the Vendors with Balance field.';
                }

                actions
                {
                    action("New Payment Reconciliation Journal")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Payment Reconciliation Journal';
                        ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing bank a bank statement feed or file.';

                        trigger OnAction()
                        var
                            BankAccReconciliation: Record "Bank Acc. Reconciliation";
                        begin
                            BankAccReconciliation.OpenNewWorksheet
                        end;
                    }
                }
            }
            cuegroup("Incoming Documents")
            {
                Caption = 'Incoming Documents';
                field("New Incoming Documents"; Rec."New Incoming Documents")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Incoming Documents";
                    ToolTip = 'Specifies the number of new incoming documents in the company. The documents are filtered by today''s date.';
                }
                field("Approved Incoming Documents"; Rec."Approved Incoming Documents")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Incoming Documents";
                    ToolTip = 'Specifies the number of approved incoming documents in the company. The documents are filtered by today''s date.';
                }
                field("OCR Completed"; Rec."OCR Completed")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Incoming Documents";
                    ToolTip = 'Specifies that incoming document records that have been created by the OCR service.';
                }

                actions
                {
                    action(CheckForOCR)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Receive from OCR Service';
                        RunObject = Codeunit "OCR - Receive from Service";
                        RunPageMode = View;
                        ToolTip = 'Process new incoming electronic documents that have been created by the OCR service and that you can convert to, for example, purchase invoices.';
                        Visible = ShowCheckForOCR;
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;


        //  SetFilter("User ID Filter", UserId);

        // SetFilter("User ID Filter", '=%1', UserId);
        ShowCheckForOCR := OCRServiceMgt.OcrServiceIsEnable;
    end;

    var
        OCRServiceMgt: Codeunit "OCR Service Mgt.";
        ShowCheckForOCR: Boolean;
}

#pragma implicitwith restore

