page 54985 "Document Attachments"
{
    Caption = 'Documents Attached';
    PageType = CardPart;
    SourceTable = "Document Attachment";

    layout
    {
        area(content)
        {
            group(Control2)
            {
                ShowCaption = false;
                field(Documents; Rec.Count)
                {
                    ApplicationArea = All;
                    Caption = 'Documents';
                    StyleExpr = TRUE;
                    ToolTip = 'Specifies the number of attachments.';

                    trigger OnDrillDown()
                    var
                        Customer: Record Customer;
                        Vendor: Record Vendor;
                        Item: Record Item;
                        Employee: Record "Employee";
                        FixedAsset: Record "Fixed Asset";
                        Resource: Record Resource;
                        SalesHeader: Record "Sales Header";
                        PurchaseHeader: Record "Purchase Header";
                        Job: Record Job;
                        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                        SalesInvoiceHeader: Record "Sales Invoice Header";
                        PurchInvHeader: Record "Purch. Inv. Header";
                        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
                        ImpHeader: Record "Payments";
                        ImpSurrHeader: Record Payments;
                        StaffClaim: Record Payments;
                        //Conf: Record "Conference Attendance";
                        Jb: Record "Company Positions";
                        JobApp: Record "Job Applications";
                        HRJobApp: Record Applicant;
                        PV: record "Payments";
                        ImpMemo: record "Payments";

                        DocumentAttachmentDetails: Page "Document Attachment Det Custom";
                        InterBank: Record "Payments";
                        RecRef: RecordRef;
                        ImpSur: Record "Payments";

                        StaffAdv: record "Payments";
                        // JV: record "JV Header";
                        StaffAdvSurr: record "Payments";
                        GLBudget: Record "G/L Budget Name";
                        IMPMEMOS: Record "Imprest Memo";
                    // LeaveReq: Record "HR Leave Allocation Request";
                    // CostReimbursement: Record "Cost Reimbursement Request";
                    begin
                        case Rec."Table ID" of
                            DATABASE::Customer:
                                begin
                                    RecRef.Open(DATABASE::Customer);
                                    if Customer.Get(Rec."No.") then
                                        RecRef.GetTable(Customer);
                                end;
                            DATABASE::Vendor:
                                begin
                                    RecRef.Open(DATABASE::Vendor);
                                    if Vendor.Get(Rec."No.") then
                                        RecRef.GetTable(Vendor);
                                end;
                            DATABASE::Item:
                                begin
                                    RecRef.Open(DATABASE::Item);
                                    if Item.Get(Rec."No.") then
                                        RecRef.GetTable(Item);
                                end;
                            DATABASE::Employee:
                                begin
                                    RecRef.Open(DATABASE::Employee);
                                    if Employee.Get(Rec."No.") then
                                        RecRef.GetTable(Employee);
                                end;
                            // DATABASE::"InterBank Transfers":
                            //     begin
                            //         RecRef.Open(DATABASE::"InterBank Transfers");
                            //         if InterBank.Get("No.") then
                            //             RecRef.GetTable(InterBank);
                            //     end;
                            DATABASE::"Fixed Asset":
                                begin
                                    RecRef.Open(DATABASE::"Fixed Asset");
                                    if FixedAsset.Get(Rec."No.") then
                                        RecRef.GetTable(FixedAsset);
                                end;
                            DATABASE::Resource:
                                begin
                                    RecRef.Open(DATABASE::Resource);
                                    if Resource.Get(Rec."No.") then
                                        RecRef.GetTable(Resource);
                                end;
                            // DATABASE::"Imprest Header":
                            //     begin
                            //         RecRef.Open(DATABASE::"Imprest Header");
                            //         if ImpHeader.Get("No.") then
                            //             RecRef.GetTable(ImpHeader);
                            //     end;
                            DATABASE::"Payments":
                                begin
                                    RecRef.Open(DATABASE::"Payments");
                                    if PV.Get(Rec."No.") then
                                        RecRef.GetTable(PV);
                                end;

                            //                GLBudget: Record "G/L Budget Name";

                            DATABASE::"G/L Budget Name":
                                begin
                                    RecRef.Open(DATABASE::"G/L Budget Name");
                                    if GLBudget.Get(Rec."No.") then
                                        RecRef.GetTable(GLBudget);
                                end;

                            //IMPMEMOS
                            DATABASE::"Imprest Memo":
                                begin
                                    RecRef.Open(DATABASE::"Imprest Memo");
                                    if IMPMEMOS.Get(Rec."No.") then
                                        RecRef.GetTable(IMPMEMOS);
                                end;
                            // DATABASE::"Imprest Surrender Header":
                            //     begin
                            //         RecRef.Open(DATABASE::"Imprest Surrender Header");
                            //         if ImpSurrHeader.Get("No.") then
                            //             RecRef.GetTable(ImpSurrHeader);
                            //     end;
                            // DATABASE::"Staff Claims Header":
                            //     begin
                            //         RecRef.Open(DATABASE::"Staff Claims Header");
                            //         if StaffClaim.Get("No.") then
                            //             RecRef.GetTable(StaffClaim);
                            //     end;
                            // DATABASE::"Imprest Memo Header":
                            //     begin
                            //         RecRef.Open(DATABASE::"Imprest Memo Header");
                            //         if ImpMemo.Get("No.") then
                            //             RecRef.GetTable(ImpMemo);
                            //     end;
                            // DATABASE::"Staff Advance Header":
                            //     begin
                            //         RecRef.Open(DATABASE::"Staff Advance Header");
                            //         if StaffAdv.Get("No.") then
                            //             RecRef.GetTable(StaffAdv);
                            //     end;
                            // DATABASE::"Staff Advance Surrender Header":
                            //     begin
                            //         RecRef.Open(DATABASE::"Staff Advance Surrender Header");
                            //         if StaffAdvSurr.Get("No.") then
                            //             RecRef.GetTable(StaffAdvSurr);
                            //     end;
                            DATABASE::Job:
                                begin
                                    RecRef.Open(DATABASE::Job);
                                    if Job.Get(Rec."No.") then
                                        RecRef.GetTable(Job);
                                end;
                            DATABASE::"Company Positions":
                                begin
                                    RecRef.Open(DATABASE::"Company Positions");
                                    if Jb.Get(Rec."No.") then
                                        RecRef.GetTable(Jb);
                                end;
                            // DATABASE::"Conference Attendance":
                            //     begin
                            //         RecRef.Open(DATABASE::"Conference Attendance");
                            //         if Conf.Get("No.") then
                            //             RecRef.GetTable(Conf);
                            //     end;
                            DATABASE::"Job Applications":
                                begin
                                    RecRef.Open(DATABASE::"Job Applications");
                                    if JobApp.Get(Rec."No.") then
                                        RecRef.GetTable(JobApp);
                                end;
                            DATABASE::"Applicant":
                                begin
                                    RecRef.Open(DATABASE::"Applicant");
                                    if HRJobApp.Get(Rec."No.") then
                                        RecRef.GetTable(HRJobApp);
                                end;
                            DATABASE::"Sales Header":
                                begin
                                    RecRef.Open(DATABASE::"Sales Header");
                                    if SalesHeader.Get(SalesHeader."Document Type", Rec."No.") then
                                        RecRef.GetTable(SalesHeader);
                                end;
                            DATABASE::"Sales Invoice Header":
                                begin
                                    RecRef.Open(DATABASE::"Sales Invoice Header");
                                    if SalesInvoiceHeader.Get(Rec."No.") then
                                        RecRef.GetTable(SalesInvoiceHeader);
                                end;
                            DATABASE::"Sales Cr.Memo Header":
                                begin
                                    RecRef.Open(DATABASE::"Sales Cr.Memo Header");
                                    if SalesCrMemoHeader.Get(Rec."No.") then
                                        RecRef.GetTable(SalesCrMemoHeader);
                                end;
                            DATABASE::"Purchase Header":
                                begin
                                    RecRef.Open(DATABASE::"Purchase Header");
                                    if PurchaseHeader.Get(PurchaseHeader."Document Type", Rec."No.") then
                                        RecRef.GetTable(PurchaseHeader);
                                end;
                            DATABASE::"Purch. Inv. Header":
                                begin
                                    RecRef.Open(DATABASE::"Purch. Inv. Header");
                                    if PurchInvHeader.Get(Rec."No.") then
                                        RecRef.GetTable(PurchInvHeader);
                                end;
                            DATABASE::"Purch. Cr. Memo Hdr.":
                                begin
                                    RecRef.Open(DATABASE::"Purch. Cr. Memo Hdr.");
                                    if PurchCrMemoHdr.Get(Rec."No.") then
                                        RecRef.GetTable(PurchCrMemoHdr);
                                end;
                            // DATABASE::"Service Transfer Header":
                            //     begin
                            //         RecRef.Open(DATABASE::"Service Transfer Header");
                            //         if Servicetrans.Get("No.") then
                            //             RecRef.GetTable(Servicetrans);
                            //     end;
                            // DATABASE::"Registration Form":
                            //     begin
                            //         RecRef.Open(DATABASE::"Registration Form");
                            //         if RegFormH.Get("No.") then
                            //             RecRef.GetTable(RegFormH);
                            //     end;
                            // DATABASE::"HR Leave Allocation Request":
                            //     begin
                            //         RecRef.Open(DATABASE::"HR Leave Allocation Request");
                            //         if LeaveReq.Get("No.") then
                            //             RecRef.GetTable(LeaveReq);
                            //     end;
                            // DATABASE::"JV Header":
                            //     begin
                            //         RecRef.Open(DATABASE::"JV Header");
                            //         if JV.Get("No.") then
                            //             RecRef.GetTable(JV);
                            //     end;
                            // DATABASE::"Cost Reimbursement Request":
                            //     begin
                            //         RecRef.Open(DATABASE::"Cost Reimbursement Request");
                            //         if CostReimbursement.Get("No.") then
                            //             RecRef.GetTable(CostReimbursement);
                            //     end;
                            else
                                OnBeforeDrillDown(Rec, RecRef);
                        end;

                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    begin
    end;
}
