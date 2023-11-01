#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57174 "App. Prepayment Header"
{
    PageType = Card;
    SourceTable = "Prepayment Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On behalf of field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control21; "Prepayment Lines")
            {
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
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
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        ApprovalEntries.Setfilters(Database::Payments, 7, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57013, true, true, Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                    end;
                }
                separator(Action29)
                {
                }
            }
        }
        area(creation)
        {
            action("Banked Payment Voucher")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Banked Payment Voucher action.';
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
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
                    begin
                        PaymentsPost."Post Prepayment Voucher"(Rec);
                    end;
                }
                action(PreviewCheck)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'P&review Check';
                    Image = ViewCheck;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Preview the check before printing it.';

                    trigger OnAction()
                    begin
                        if Rec."Pay Mode" = 'CHEQUE' then begin
                            GenJnLine.DeleteAll;
                            LineNo := 252;
                            GenJnLine.Init;
                            if CMSetup.Get then
                                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                            GenJnLine."Line No." := LineNo;
                            PVLines.SetRange(No, Rec."No.");
                            if PVLines.FindSet then begin
                                GenJnLine."Account Type" := PVLines."Account Type";
                                GenJnLine."Account No." := PVLines."Account No";
                                GenJnLine.Validate(GenJnLine."Account No.");
                                GenJnLine."Posting Date" := Rec."Posting Date";
                                GenJnLine."Document No." := Rec."No.";
                                GenJnLine."External Document No." := Rec."Cheque No";
                                GenJnLine."Payment Method Code" := Rec."Pay Mode";
                                GenJnLine.Amount := Rec."Total Amount";
                                GenJnLine.Description := CopyStr((Rec."Payment Narration"), 50);
                                //Ruth
                                GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
                                GenJnLine."Bal. Account No." := Rec."Paying Bank Account";

                                GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
                                GenJnLine.Validate("Currency Code");
                                GenJnLine.Validate(GenJnLine.Amount);
                                GenJnLine.Validate("Bal. Account No.");

                            end;
                            GenJnLine.Insert(true);
                            Page.Run(404, GenJnLine, Rec."No.");
                        end
                    end;
                }
            }
        }
    }

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        ReopenPV: Codeunit Payments;
        usersetup: Record "User Setup";
        Payments: Record Payments;
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        CMSetup: Record "Cash Management Setup";
        PVLines: Record "PV Lines";

    local procedure CalcContribution(PrepaymentHeader: Record "Prepayment Header")
    var
        Employee: Record Employee;
        AssignmentMatrixX: Record "Assignment Matrix-X";
        PHeader: Record "Prepayment Header";
        EarningsX: Record EarningsX;
        EmployerAmnt: Decimal;
        EmployeeAmnt: Decimal;
        PrepaymentLines: Record "Prepayment Lines";
    begin

        Employee.Reset;
        Employee.SetRange(Status, Employee.Status::Active);
        if Employee.FindSet then begin
            repeat
                EarningsX.Reset;
                EarningsX.SetRange("Basic Salary Code", true);
                if EarningsX.FindSet then begin
                    AssignmentMatrixX.SetRange("Employee No", Employee."No.");
                    AssignmentMatrixX.SetRange(Code, EarningsX.Code);
                    if AssignmentMatrixX.FindLast then begin
                        EmployeeAmnt := (AssignmentMatrixX.Amount) * 0.1;
                        EmployerAmnt := (AssignmentMatrixX.Amount) * 0.2;
                        //get last int used
                        PrepaymentLines.Reset;
                        if PrepaymentLines.FindLast then begin
                            LineNo := PrepaymentLines."Line No";

                        end;
                        //insert on lines
                        PrepaymentLines.Init;
                        PrepaymentLines.No := PrepaymentHeader."No.";
                        PrepaymentLines."Line No" := LineNo + 1;
                        PrepaymentLines."Account Type" := PrepaymentLines."account type"::Employee;
                        PrepaymentLines."Account No." := Employee."No.";
                        PrepaymentLines.Validate("Account No.");
                        PrepaymentLines."Employee Contribution" := EmployeeAmnt;
                        PrepaymentLines."Employer Contribution" := EmployerAmnt;
                        PrepaymentLines.Validate("Employer Contribution");

                        PrepaymentLines.Insert;
                    end;
                end;
            //calculate amount based on last basic pay
            until Employee.Next = 0;
        end
    end;
}

#pragma implicitwith restore

