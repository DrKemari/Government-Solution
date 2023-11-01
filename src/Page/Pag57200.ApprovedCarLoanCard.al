#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57200 "Approved Car Loan Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Payments;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Joining field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Unit Name';
                    ToolTip = 'Specifies the value of the Unit Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Loan Details")
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Payroll Deduction Code"; Rec."Payroll Deduction Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Payroll Deduction Code field.';
                }
                field("Loan Vendor"; Rec."Loan Vendor")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Loan Vendor field.';
                }
                field("Loan Vendor Name"; Rec."Loan Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Vendor Name field.';
                }
                field("Loan Requested "; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Interest Amount"; Rec."Interest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Interest Amount field.';
                }
                field("Total Loan Amount"; Rec."Total Loan Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Loan Amount field.';
                }
                field("No installment "; Rec."No of months deducted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of months deducted field.';
                }
                field("Monthly Installment"; Rec."Monthly Installment")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Monthly Installment field.';
                }
                field("Salary Last Drawn"; Rec."Salary Last Drawn")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Salary Last Drawn field.';
                }
                field("Recovery Month"; Rec."Recovery Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recovery Month field.';
                }
                field("Recovery Start Month"; Rec."Recovery Start Month")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Recovery Start Month field.';
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
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57015, true, true, Rec)
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'P&ost';
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'F9';
                ToolTip = 'Executes the P&ost action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to post the loan %1';
                begin
                    Rec.TestField("Recovery Month");
                    Rec.TestField("Loan Vendor");
                    if Confirm(TXT001, true, Rec."No.") = true then begin
                        PaymentsPost.PostCarloan(Rec);
                    end;
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
                ToolTip = 'Executes the Create Payment Voucher action.';
            }
            action("Re-Open")
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Re-Open action.';
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
            Payments.Insert;
            PVLines.Init;
            PVLines.No := Payments."No.";
            PVLines."Account Type" := PVLines."account type"::Employee;
            PVLines."Account No" := AdvanceNo."Account No.";
            PVLines.Validate("Account No");
            PVLines.Amount := AdvanceNo."Amount Approved";
            PVLines.Insert;
            Page.Run(57001, Rec, Payments."No.");
            AdvanceNo.Posted := true;
            AdvanceNo."Posted By" := UserId;
            AdvanceNo."Posted Date" := Today;
            AdvanceNo.Modify(true);
        end else
            Error(TEXT001, Payments."No.");

    end;
}

#pragma implicitwith restore

