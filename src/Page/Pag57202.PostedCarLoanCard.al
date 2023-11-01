#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57202 "Posted Car Loan Card"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = Payments;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Unit Name';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("Loan Details")
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Payroll Deduction Code"; Rec."Payroll Deduction Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Loan Vendor"; Rec."Loan Vendor")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Loan Vendor Name"; Rec."Loan Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Loan Requested "; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Interest Amount"; Rec."Interest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Loan Amount"; Rec."Total Loan Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No installment "; Rec."No of months deducted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Monthly Installment"; Rec."Monthly Installment")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Salary Last Drawn"; Rec."Salary Last Drawn")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Recovery Month"; Rec."Recovery Month")
                {
                    ApplicationArea = Basic;
                }
                field("Recovery Start Month"; Rec."Recovery Start Month")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57015, true, true, Rec)
                end;
            }
            action("Create Payment Voucher")
            {
                ApplicationArea = Basic;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    CreatePaymentVoucher(Rec);
                end;
            }
            action("Re-Open")
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Reasons to Reopen");
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Payment Type" := Rec."payment type"::"Car Loan";
        Rec."Car loan" := true;


        Rec.Date := Today;
        Rec."Created By" := UserId;
        Rec."Account Type" := Rec."account type"::Employee;

        Usersetup.Reset;
        Usersetup.SetRange("User ID", Rec."Created By");
        if Usersetup.FindSet then begin

            Rec."Account No." := Usersetup."Employee No.";
            Rec."Account Name" := Usersetup."Employee Name";
        end;

        Employee.Reset;
        Employee.SetRange("No.", Rec."Account No.");
        if Employee.FindSet then begin
            // Employee.CALCFIELDS("Job Title");
            //  Designation := Employee."Job Title";
            Rec."Date of Joining" := Employee."Employment Date";
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            Rec."Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Car Loan";
        Rec."Car loan" := true;


        Rec.Date := Today;
        Rec."Created By" := UserId;
        Rec."Account Type" := Rec."account type"::Employee;

        Usersetup.Reset;
        Usersetup.SetRange("User ID", Rec."Created By");
        if Usersetup.FindSet then begin

            Rec."Account No." := Usersetup."Employee No.";
            Rec."Account Name" := Usersetup."Employee Name";
        end;

        Employee.Reset;
        Employee.SetRange("No.", Rec."Account No.");
        if Employee.FindSet then begin
            // Employee.CALCFIELDS("Job Title");
            //  Designation := Employee."Job Title";
            Rec."Date of Joining" := Employee."Employment Date";
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            Rec."Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
        end;
    end;

    trigger OnOpenPage()
    begin
        Rec."Payment Type" := Rec."payment type"::"Car Loan";
        Rec."Car loan" := true;


        Rec.Date := Today;
        Rec."Created By" := UserId;
        Rec."Account Type" := Rec."account type"::Employee;

        Usersetup.Reset;
        Usersetup.SetRange("User ID", Rec."Created By");
        if Usersetup.FindSet then begin

            Rec."Account No." := Usersetup."Employee No.";
            Rec."Account Name" := Usersetup."Employee Name";
        end;

        Employee.Reset;
        Employee.SetRange("No.", Rec."Account No.");
        if Employee.FindSet then begin
            // Employee.CALCFIELDS("Job Title");
            //  Designation := Employee."Job Title";
            Rec."Date of Joining" := Employee."Employment Date";
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            Rec."Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
        end;
    end;

    var
        Usersetup: Record "User Setup";
        Employee: Record Employee;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        ApprovalEntry: Record "Approval Entry";
        pvLines: Record "PV Lines";
        pvheader: Record Payments;
        ReopenPV: Codeunit Payments;
        PaymentsPost: Codeunit "Payments-Post";
        FileNo: Code[50];
        PVNo: Code[50];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CashMgt: Record "Cash Management Setup";

    local procedure CreatePaymentVoucher(AdvanceNo: Record Payments)
    var
        Payments: Record Payments;
        PVLines: Record "PV Lines";
        TEXT001: label 'The payment document for the advance request is already created,the No. is :- %1';
        AssignmentMatrixX: Record "Assignment Matrix-X";
        Ok: Boolean;
    begin
        Payments.Reset;
        Payments.SetRange("Applies- To Doc No.", AdvanceNo."No.");
        if not Payments.FindSet then begin
            Payments.Init;
            Payments."No." := '';
            Payments."File No." := '';
            PVNo := '';
            // FileNo:='';
            CashMgt.Get();
            CashMgt.TestField("PV Nos");
            CashMgt.TestField("PV File Numbering");
            if Payments."No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."PV Nos", Payments."No. Series", 0D, PVNo, Payments."No. Series");
            /* IF Payments."File No."='' THEN
                NoSeriesMgt.InitSeries(CashMgt."PV File Numbering",Payments."File No. Series",0D,FileNo,Payments."File No. Series");*/
            Payments."No." := PVNo;
            //Payments."File No.":=FileNo;
            Payments."Payment Type" := Payments."payment type"::"Payment Voucher";
            Payments."Document Type" := Payments."document type"::"Payment Voucher";
            Payments."Payment Narration" := AdvanceNo.Purpose;
            Payments."Shortcut Dimension 1 Code" := AdvanceNo."Shortcut Dimension 1 Code";
            Payments."Shortcut Dimension 2 Code" := AdvanceNo."Shortcut Dimension 2 Code";
            Payments."Shortcut Dimension 3 Code" := AdvanceNo."Shortcut Dimension 3 Code";
            Payments."Applies- To Doc No." := AdvanceNo."No.";
            Payments.Date := AdvanceNo.Date;
            Payments."Created By" := UserId;
            Payments.Insert;
            PVLines.Init;
            PVLines.No := Payments."No.";
            PVLines."Account Type" := PVLines."account type"::Employee;
            PVLines."Account No" := AdvanceNo."Account No.";
            PVLines.Validate("Account No");
            PVLines.Amount := AdvanceNo."Total Loan Amount";
            PVLines."Car Loan Doc. No" := AdvanceNo."No.";
            PVLines.Insert;
            AdvanceNo.Posted := true;
            AdvanceNo."Posted By" := UserId;
            AdvanceNo."Posted Date" := Today;
            AdvanceNo.Modify(true);
            AssignmentMatrixX.Reset;
            AssignmentMatrixX.SetRange("Employee No", Rec."Account No.");
            AssignmentMatrixX.SetRange(Code, Rec."Payroll Deduction Code");
            AssignmentMatrixX.DeleteAll;
            AssignmentMatrixX.Init;
            AssignmentMatrixX."Employee No" := Rec."Account No.";
            AssignmentMatrixX.Type := AssignmentMatrixX.Type::Deduction;
            AssignmentMatrixX.Code := Rec."Payroll Deduction Code";
            AssignmentMatrixX."Employee No" := Rec."Account No.";
            AssignmentMatrixX.Validate("Employee No");
            AssignmentMatrixX."Payroll Period" := Rec."Recovery From";
            AssignmentMatrixX.Validate("Payroll Period");
            AssignmentMatrixX.Validate(Code);
            AssignmentMatrixX.Amount := -1 * Rec."Monthly Installment";
            Ok := AssignmentMatrixX.Insert;
            Commit;
            Payments.SetRange("No.", PVNo);
            Payments.SetRange("Payment Type", Payments."payment type"::"Payment Voucher");
            if Payments.Find then
                Page.Run(57001, Payments);
        end else
            Error(TEXT001, Payments."No.");

    end;
}

#pragma implicitwith restore

