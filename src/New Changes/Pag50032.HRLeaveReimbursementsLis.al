page 50014 "HR Leave Reimbursements List"
{
    //ApplicationArea = All;
    Caption = 'HR Leave Reimbursements List';
    PageType = List;
    SourceTable = "HR Leave Allocation Request";
    CardPageId = "HR Leave Requests";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Application Type"; Rec."Application Type")
                {
                    ToolTip = 'Specifies the value of the Application Type field.';
                }
                field("Adjustment Type"; Rec."Adjustment Type")
                {
                    ToolTip = 'Specifies the value of the Adjustment Type field.';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field("Applied Days"; Rec."Applied Days")
                {
                    ToolTip = 'Specifies the value of the Applied Days field.';
                }
                field("Days Approved"; Rec."Days Approved")
                {
                    ToolTip = 'Specifies the value of the Days Approved field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Employee Dept"; Rec."Employee Dept")
                {
                    ToolTip = 'Specifies the value of the Employee Dept field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(HOD; Rec.HOD)
                {
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ToolTip = 'Specifies the value of the Approver ID field.';
                }
                field("Approvers Comments"; Rec."Approvers Comments")
                {
                    ToolTip = 'Specifies the value of the Approvers Comments field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = '&Functions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = true;


                    trigger OnAction()
                    begin
                        DocumentType := Documenttype::"Leave Application";
                        ApprovalEntries.Setfilters(Database::"HR Leave Allocation Request", DocumentType, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action(sendApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;


                    trigger OnAction()
                    var
                        // ApprovalMgt: Codeunit UnknownCodeunit439;
                        showmessage: Boolean;
                        ManualCancel: Boolean;
                        State: Option Open,"Pending Approval",Cancelled,Approved;
                        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                        tableNo: Integer;
                    begin
                        // TestField("Employee No");
                        // TestField("Applied Days");

                        // TestField(Purpose);
                        // if "Availlable Days" < 1 then Error('Please note that you dont have enough leave balance');


                        //Release the Imprest for Approval
                        State := State::Open;
                        // if Status <> Status::Open then State := State::"Pending Approval";
                        DocType := Doctype::"Leave Application";
                        Clear(tableNo);
                        VarVariant := Rec;
                        if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                            CustomApprovalMgt.OnSendDocForApproval(VarVariant);
                        end;
                    end;
                }
                action(cancellsApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        //  ApprovalMgt: Codeunit UnknownCodeunit439;
                        showmessage: Boolean;
                        ManualCancel: Boolean;
                        State: Option Open,"Pending Approval",Cancelled,Approved;
                        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                        tableNo: Integer;
                    begin
                        DocType := Doctype::"Leave Application";
                        showmessage := true;
                        ManualCancel := true;
                        Clear(tableNo);
                        tableNo := 39005550;
                        VarVariant := Rec;
                        if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                            CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
                        end;
                    end;
                }
                separator(Action1102755038)
                {
                }
                action(PrintPreview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                    begin
                        Rec.Reset;
                        Rec.SetFilter("No.", Rec."No.");
                        Report.Run(70135251, true, true, Rec);
                        Rec.Reset;
                    end;
                }
                separator(Action16)
                {
                }
                action("Leave Journal")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    Caption = 'Post';
                    Promoted = true;
                    trigger OnAction()
                    var
                    // LvJornal: Record "HR Employee Leave Journal";
                    // PostLeave: Codeunit "HR Post Leave Journal Ent.";
                    // UserSetup: Record "User Setup";
                    // leaveCal: Record "HR Leave Calendar";
                    // LeavAllc: Record "HR Leave Allocation";
                    begin
                        //     Rec.TestField("Days Approved");
                        //     Rec.TestField(Status, Rec.Status::Approved);
                        //     if Rec.Posted = true then Error('The document has already been posted');
                        //     if Rec.Status <> Rec.Status::Approved then Error('The status must be approved');
                        //     userSetup.Get(UserId);
                        //     If userSetup.Leave = false then Error('You do not have permission to post leave days');
                        //     if Confirm('Do you ant to post leave number ' + Rec."No.") = false then Error('Process Aborted');

                        //     leaveCal.Reset();
                        //     leaveCal.SetRange(Current, true);
                        //     if leaveCal.Find('-') then
                        //         LeavAllc.Init();
                        //     LeavAllc."Calendar Code" := leaveCal.Code;
                        //     LeavAllc."No." := Rec."Employee No";
                        //     LeavAllc."Staff Name" := Rec."Employee Name";
                        //     LeavAllc."Posting Date" := Today;
                        //     LeavAllc."Entry Type" := Rec."Adjustment Type";
                        //     if Rec."Application Type" = Rec."Application Type"::"Re-Imbursement" then
                        //         LeavAllc."Posting Type" := LeavAllc."Posting Type"::Reimbursement
                        //     else
                        //         if Rec."Application Type" = Rec."Application Type"::"Carry Forward" then
                        //             LeavAllc."Posting Type" := LeavAllc."Posting Type"::"Carry Forward"
                        //         else
                        //             LeavAllc."Posting Type" := LeavAllc."Posting Type"::Normal;
                        //     LeavAllc."No. Of days" := Rec."Days Approved";
                        //     LeavAllc."Posting Description" := Format(Rec."Adjustment Type") + Format(Rec."Application Type") + Rec."No.";
                        //     LeavAllc."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                        //     LeavAllc."Global Dimension 2 Code" := Rec."Department Code";
                        //     LeavAllc."Posted By" := UserId;
                        //     LeavAllc."Leave Type" := Rec."Leave Type";
                        //     LeavAllc.Posted := true;
                        //     LeavAllc."Application Start Date" := Rec."Starting Date";
                        //     LeavAllc."Application End Date" := Rec."End Date";
                        //     LeavAllc."Application Return Date" := Rec."Return Date";
                        //     LeavAllc."Calendar Start Date" := leaveCal."Start Date";
                        //     LeavAllc."Calendar End Date" := leaveCal."End Date";
                        //     LeavAllc."Document No." := Rec."No.";
                        //     LeavAllc."Posting Source" := LeavAllc."Posting Source"::Document;
                        //     LeavAllc."Posted By" := UserId;
                        //     LeavAllc.Posted := true;
                        //     LeavAllc.Closed := false;
                        //     LeavAllc.Insert();

                        //     LeavAllc.Reset();
                        //     LeavAllc.SetRange(LeavAllc."Document No.", Rec."No.");
                        //     LeavAllc.SetRange(LeavAllc."No.", Rec."Employee No");
                        //     LeavAllc.SetRange(LeavAllc."Calendar Code", leaveCal.Code);
                        //     if LeavAllc.Find('-') then
                        //         PostLeave.PostLeaveAllocation(LeavAllc."Entry No.", LeavAllc."No.", LeavAllc."Leave Type", LeavAllc."Calendar Code");
                        //     Rec.Status := Rec.Status::Posted;
                        //     Rec.Posted := true;
                        //     Rec."Posting Date" := Today;
                        //     Rec."Posted By" := UserId;
                        //     Rec.Modify();
                    end;
                }
            }
        }
    }
    var
        UserMgt: Codeunit "User Management";
        //ApprovalMgt: Codeunit UnknownCodeunit439;
        // ReqLine: Record UnknownRecord70135011;
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        //  JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        FixedAsset: Record "Fixed Asset";
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
}
