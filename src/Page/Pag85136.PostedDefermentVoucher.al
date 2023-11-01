#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85136 "Posted Deferment Voucher"
{
    Caption = 'Posted Deferment Voucher';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Student Processing Header";

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
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student Reg. No."; Rec."Student Reg. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                }
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination  ID';
                    Editable = false;
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ';
                }
                field("Preferred Exam Center"; Rec."Preferred Exam Center")
                {
                    ApplicationArea = Basic;
                }
                field("Preferred Exam Center Name"; Rec."Preferred Exam Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field("Highest Academic QCode"; Rec."Highest Academic QCode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawal Code"; Rec."Withdrawal Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Defferment Code';
                }
                field("Withdrawal Reason"; Rec."Withdrawal Reason")
                {
                    ApplicationArea = Basic;
                    Caption = 'Defferment Reason';
                    Editable = false;
                }
                field("Total Withdrawal Amount"; Rec."Total Withdrawal Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawal Refund Amount"; Rec."Withdrawal Refund Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Booking Amount"; Rec."Booking Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control20; "Exam Deferment Lines")
            {
                SubPageLink = "Booking Header No." = field("No."),
                              "Course Id" = field("Examination ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            group("Student Application")
            {
                Caption = 'Student Application';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                action(Action25)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
        area(navigation)
        {
            group("&Credit Memo")
            {
                Caption = '&Credit Memo';
                Image = CreditMemo;
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Sales Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'View or add comments for the record.';
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, Database::"Sales Header", Rec."Document Type", Rec."No.");
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval sent');
                        //"Approval Status" := "approval status"::"2";
                        Rec.Modify;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval cancelled');
                        Rec."Approval Status" := Rec."approval status"::Open;
                        Rec.Modify;
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the approval request.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the approval to a substitute approver.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup46)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        Message('Approval released');
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        Message('Approval opened');
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Copy document lines and header information from another sales document to this document. You can copy a posted sales invoice into a new sales invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        //CopyBookingVoucher(Rec);
                    end;
                }
                action("Post Voucher")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        // TestField("Approval Status", Rec."approval status"::"2");
                        PostDefferalVoucher(Rec);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Defferment;
    end;

    var
        TXT001: label 'Voucher %1 posted succesfully';
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ResourcePrice: Record "Resource Price";
        TXT004: label 'Invoice %1 sent succesfully';
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        ExamBookingEntries: Record "Exam Booking Entries";
        StudentBookingLines: Record "Student Processing Lines";

    local procedure PostVoucher(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
    begin
        ExamBookingEntries.Reset;
        if ExamBookingEntries.FindLast then begin
            EntryNo := ExamBookingEntries."Entry No.";
        end;
        ExamBookingEntries.Init;
        ExamBookingEntries."Entry No." := EntryNo + 1;
        ExamBookingEntries.Code := StudentProcessingHeader."No.";
        ExamBookingEntries."Student Reg No." := StudentProcessingHeader."Student Reg. No.";
        ExamBookingEntries.Validate("Student Reg No.");
        ExamBookingEntries."Exam Center" := StudentProcessingHeader."Preferred Exam Center";
        ExamBookingEntries.Examination := StudentProcessingHeader."Examination ID";
        ExamBookingEntries.Paper := StudentProcessingHeader.Paper;
        ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
        ExamBookingEntries."Fee Amount" := StudentProcessingHeader."Booking Amount";
        ExamBookingEntries.Validate("Currency Code");
        ExamBookingEntries.Insert;

        Message(TXT001, StudentProcessingHeader."No.");
        //Payment using a journal


        /*
        ExaminationSetup.GET;
                      Email2:= ExaminationSetup."Registration Sender Email";
                   //SMTP.Create('KASNEB STUDENT REGISTRATION',Email2,BulkProcessingHeader.Email,
                   'KASNEB STUDENT REGISTRATION',
                    'Dear '+BulkProcessingHeader."Student Name"+',<BR><BR>'+
                    'Your registration request done on <b>'+' '+FORMAT(BulkProcessingHeader."Created On")+' '+'</b> has been processed.<BR>'+
                    'Find attached the invoice for payment',TRUE);
                    Filename:=SalesInv."No."+'.pdf';
                    FileLocation:='D:\RUTH\KASNEB\KASNEB DOCUMENTS\'+Filename;
                    SalesHeader.RESET;
                    SalesHeader.SETRANGE("No.",SalesInv."No.");
                    IF SalesHeader.FINDSET THEN BEGIN
                    //Report.SaveAsPdf(1303,FileLocation, SalesHeader);
                      END;
                    //SMTP.AddAttachment(FileLocation,Filename);
                    //SMTP.AddBCC(Email2);
                    //SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>For more details contact the following:<BR>');
                    //SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>KASNEB STUDENT REGISTRATION<BR>');
                    //SMTP.Send();
                    MESSAGE(TXT004,SalesInv."No.");*/

    end;

    local procedure CopyBookingVoucher(StudentHeader: Record "Student Processing Header")
    var
        StudentBookingLines: Record "Student Processing Lines";
        StudentPHeader: Record "Student Processing Header";
        BookingEntries: Record "Exam Booking Entries";
        LineNo: Integer;
    begin
        //get the document to be reversed
        BookingEntries.Reset;
        BookingEntries.SetRange("Student Reg No.", StudentHeader."Student Reg. No.");
        BookingEntries.SetRange(Examination, StudentHeader."Examination ID");
        BookingEntries.SetRange(Paper, StudentHeader.Paper);
        if BookingEntries.FindSet then begin
            StudentBookingLines.Reset;
            if StudentBookingLines.FindLast then begin
                LineNo := StudentBookingLines."Line No.";
            end;
            StudentBookingLines.Init;
            StudentBookingLines."Line No." := LineNo + 1;
            StudentBookingLines."Booking Header No." := StudentHeader."No.";
            StudentBookingLines."Registration No." := StudentHeader."Student Reg. No.";
            StudentBookingLines.Type := StudentBookingLines.Type::Withdrawal;
            StudentBookingLines.Section := BookingEntries.Section;
            StudentBookingLines.Part := BookingEntries.Part;
            StudentBookingLines."Course Id" := BookingEntries.Examination;
            StudentBookingLines.Validate("Course Id");
            StudentBookingLines.Validate("Registration No.");
            StudentBookingLines.Insert;

        end;
    end;


    procedure PostDefferalVoucher(PV: Record "Student Processing Header")
    var
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Examination Setup";
    begin
        //create an action to reduce the income
        //CreateCreditMemo(PV);
        if Confirm('Are you sure you want to post the Defferment Voucher No. ' + PV."No." + ' ?') = true then begin
            /*
          IF PV."Approval Status"<>PV."Approval Status"::Released THEN
           ERROR('The Withdrawal Voucher No %1 has not been fully approved',PV."No.");
          IF PV.Posted THEN
           ERROR('Withdrawal Voucher %1 has been posted',PV."No.");
          ExaminationSetup.GET;
          PV.CALCFIELDS("Booking Amount");
          IF PV."Booking Amount"=0 THEN
          ERROR('Amount is cannot be zero');
            // Delete Lines Present on the General Journal Line
            GenJnLine.RESET;
            GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."Withdrawal Journal Template");
            GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",CMSetup."Withdrawal Journal Batch");
            IF GenJnLine.FINDSET THEN
              BEGIN
                  GenJnLine.DELETEALL;
                END;
          //Bank Entries
          GenJnLine.RESET;
          IF GenJnLine.FINDLAST THEN BEGIN
            LineNo:=GenJnLine."Line No.";
          END;
          LineNo:=LineNo+1;
          GenJnLine.INIT;
          IF CMSetup.GET THEN
          GenJnLine."Journal Template Name":=CMSetup."Withdrawal Journal Template";
          GenJnLine."Journal Batch Name":=CMSetup."Withdrawal Journal Batch";
          GenJnLine."Line No.":=LineNo;
          GenJnLine."Account Type":=GenJnLine."Account Type"::Customer;
          GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
          GenJnLine."Account No.":=PV."Student No.";
          GenJnLine.VALIDATE(GenJnLine."Account No.");
           IF PV.Date=0D THEN
            ERROR('You must specify the PV date');
          GenJnLine."Posting Date":=TODAY;
          GenJnLine."Document No.":=PV."No.";
          GenJnLine."External Document No.":=PV."No.";
          GenJnLine.Description:='Pay To:'+PV."Student Name";
          GenJnLine.Amount:=PV."Booking Amount";
          GenJnLine."Bal. Account Type":=GenJnLine."Account Type"::"Bank Account";
          GenJnLine."Bal. Account No.":=CMSetup."Withdrawal Paying Bank";
          GenJnLine.VALIDATE("Currency Code");
          GenJnLine.VALIDATE(GenJnLine.Amount);

          IF GenJnLine.Amount<>0 THEN
           GenJnLine.INSERT;

          CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnLine);
          PV.Posted:=TRUE;
          PV.MODIFY;
          END;
          */
            //block entries for examination
            StudentBookingLines.Reset;
            StudentBookingLines.SetRange("Booking Header No.", PV."No.");
            if StudentBookingLines.FindSet then begin
                repeat
                    ExamBookingEntries.Reset;
                    ExamBookingEntries.SetRange("Student Reg No.", PV."Student Reg. No.");
                    ExamBookingEntries.SetRange(Examination, PV."Examination ID");
                    ExamBookingEntries.SetRange(Paper, StudentBookingLines.Paper);
                    if ExamBookingEntries.FindSet then begin
                        ExamBookingEntries.Blocked := true;
                        ExamBookingEntries.Status := ExamBookingEntries.Status::Defered;
                        ExamBookingEntries.Modify;
                    end;
                until StudentBookingLines.Next = 0
            end;
            Message('The Defferment no %1,has been posted successfully', PV."No.");
        end;
        PV.Posted := true;
        PV."Posted By" := UserId;
        PV."Posted On" := CurrentDatetime;
        PV.Modify;

    end;

    local procedure CreateCreditMemo(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        SalesInv.Init;
        SalesInv."Document Type" := SalesInv."document type"::"Credit Memo";
        SalesInv."No." := '';
        SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv."Document Date" := Today;
        SalesInv."Order Date" := Today;
        SalesInv."Posting Date" := Today;
        SalesInv."External Document No." := BulkProcessingHeader."No.";
        SalesInv.Type := SalesInv.Type::Normal;
        SalesInv."Prepayment %" := 100;//enforce prepayment`
        SalesInv.Insert(true);
        BulkProcessingHeader.CalcFields("Total Withdrawal Amount");
        //get resource entry
        ResourcePrice.Reset;
        ResourcePrice.SetRange(Code, BulkProcessingHeader."Fee Type");
        if ResourcePrice.FindSet then begin
            SalesLine.Init;
            SalesLine."Document Type" := SalesLine."document type"::"Credit Memo";
            SalesLine."Document No." := SalesInv."No.";
            SalesLine."No." := ResourcePrice.Code;
            SalesLine.Type := SalesLine.Type::Resource;
            SalesLine.Validate(SalesLine."No.");
            SalesLine.Validate(SalesLine.Quantity, 1);
            SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Total Withdrawal Amount");
            SalesLine.Insert(true);
        end;
        Message(TXT004, SalesInv."No.");
    end;
}

#pragma implicitwith restore

