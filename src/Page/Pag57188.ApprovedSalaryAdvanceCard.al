#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57188 "Approved Salary Advance Card"
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
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Joining field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Unit Name';
                    ToolTip = 'Specifies the value of the Unit Name field.';
                }
                field("Salary Last Drawn"; Rec."Salary Last Drawn")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Salary Last Drawn field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field("No of months deducted"; Rec."No of months deducted")
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
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Amount Pending"; Rec."Amount Pending")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount Pending field.';
                }
                field("Recovery Start Month"; Rec."Recovery Start Month")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Recovery Start Month field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Approved field.';
                }
                field("Effective from Month"; Rec."Effective from Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective from Month field.';
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons to Reopen field.';
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
                Visible = false;
                ToolTip = 'Executes the P&ost action.';
                trigger OnAction()
                begin

                    PaymentsPost.PostSalaryAdvance(Rec);
                end;
            }
            action("Create Payment Voucher")
            {
                ApplicationArea = Basic;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Create Payment Voucher action.';
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Salary Advance";
        Rec."Document Type" := Rec."document type"::"Salary Advance";

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
            //Employee.CALCFIELDS("Job Title");
            //  Designation := Employee."Job Title";
            Rec."Date of Joining" := Employee."Employment Date";
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            Rec."Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
            Rec.Validate("Shortcut Dimension 2 Code");
            Rec.Validate("Shortcut Dimension 1 Code");

        end;
    end;

    var
        Usersetup: Record "User Setup";
        Employee: Record Employee;
        PaymentsPost: Codeunit "Payments-Post";
        FileNo: Code[50];
        PVNo: Code[50];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CashMgt: Record "Cash Management Setup";
        text027: label 'Approved Salary Advance amount cannot be 0. Please confirm the amount and try again.';

    local procedure CreatePaymentVoucher(AdvanceNo: Record Payments)
    var
        Payments: Record Payments;
        PVLines: Record "PV Lines";
        TEXT001: label 'The payment document for the advance request is already created,the No. is :- %1';
    begin
        if Rec."Amount Approved" = 0 then
            Error(text027);
        Rec.TestField("Posting Date");

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
            PVLines.Amount := AdvanceNo."Salary Advance";
            PVLines."Net Amount" := PVLines.Amount;
            PVLines."Applies to Doc. No" := AdvanceNo."No.";
            PVLines."S/Advance No" := AdvanceNo."No.";
            PVLines.Insert;
            Page.Run(57001, Rec, Payments."No.");
            /*AdvanceNo.Posted:=TRUE;
            AdvanceNo."Posted By":=USERID;
            AdvanceNo."Posted Date":=TODAY;
            AdvanceNo.MODIFY(TRUE);*/

        end else
            Error(TEXT001, Payments."No.");

    end;
}

#pragma implicitwith restore

