#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57175 "Posted Imprest Warrant Voucher"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Warrant Voucher"));

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
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Quick-Pay No.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Imprest Voucher Amount"; Rec."Imprest Voucher Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000017; "Posted Warrant Lines")
            {
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        // IF Status<>Status::Released THEN
                        // ERROR(Txt0001);
                        // IF Status=Status::Released THEN BEGIN
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57014, true, true, Rec)
                    end;
                }
                action("Reverse Voucher")
                {
                    ApplicationArea = Basic;
                    Image = Post;

                    trigger OnAction()
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Post Requisition" = false then
                            Error(Text003);
                        PaymentPost.ReverseWarrantVoucher(Rec);
                    end;
                }
                action("Create Surrender")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                    begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."post surrender" <> true then
                                Error('You are not allowed to run this function');
                            PaymentPost.CreateSurrender(Rec."Imprest Memo No", Rec."Cheque No", Rec."No.");
                        end
                    end;
                }
                action(EFT)
                {
                    ApplicationArea = Basic;
                    Image = ElectronicBanking;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        ImprestVoucherLines.Reset;
                        ImprestVoucherLines.SetRange(No, Rec."No.");
                        if ImprestVoucherLines.FindSet then begin
                            Report.Run(69066, true, false, ImprestVoucherLines);
                        end
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //ShowAttach:=OpenEntries(Rec);
        SetControlAppearance;
    end;

    trigger OnOpenPage()
    begin
        //ShowAttach:=OpenEntries(Rec);
        SetControlAppearance;
    end;

    var
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Txt0001: label 'You Can only Print Fully Approved Imprest Requisition';
        users: Record "User Setup";
        Text001: label 'Imprest Amount for document number %1 cannot be 0. Kindly check the lines. Attach memo.';
        UserSetup: Record "User Setup";
        Text0001: label 'You cannot Cancel document No. %1. Documents can only be cancelled by initiators ';
        cmsetup: Record "Cash Management Setup";
        Text002: label 'The imprest application has already expired based on the travel date %1,kindly follow up with your Department.';
        Text003: label 'You have insufficient rights to post this voucher,kindly follow up with the ICT';
        ImprestVoucherLines: Record "Imprest Voucher Lines";

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

