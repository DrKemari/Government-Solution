#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57198 "Car Loan Card"
{
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
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
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
                    Editable = true;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Interest Amount"; Rec."Interest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Interest Amount field.';
                }
                field("Total Loan Amount"; Rec."Total Loan Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Loan Amount field.';
                }
                field("No installment "; Rec."No of months deducted")
                {
                    ApplicationArea = Basic;
                    Editable = true;
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
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Attach Documents action.';
                    trigger OnAction()
                    begin
                        DMSManagement.UploadcarloanDocuments(Rec."No.", 'Car Naration', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                    end;
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
                        Rec.ShowDocDim;
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

                        //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin

                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval

                        Rec.TestField("Salary Advance");
                        Rec.TestField(Purpose);
                        Rec.TestField("No of months deducted");
                        Rec.TestField("Recovery Start Month");


                        Payroll3.FnCheckAthirdRule(Rec);
                        //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action30)
                {
                }
            }
            group(ActionGroup29)
            {
                Caption = 'Print';
                Image = Print;
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
                        Usersetup.Get(UserId);
                        Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                        ReopenPV.PerformManualReopen(Rec);
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
                        Usersetup.Get(UserId);
                        Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);
                    end;
                }
                separator(Action24)
                {
                }
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
        DMSManagement: Codeunit "DMS Management";
        Payroll3: Codeunit Payroll3;
}

#pragma implicitwith restore

