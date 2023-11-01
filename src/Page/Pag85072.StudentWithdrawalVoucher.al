#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Student Withdrawal Voucher (ID 85072).
/// </summary>
#pragma implicitwith disable
Page 85072 "Student Withdrawal Voucher"
{
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
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Student Reg. No."; Rec."Student Reg. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Student No."; Rec."Student No.")
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
                field("Withdrawal Code"; Rec."Withdrawal Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Withdrawal Reason"; Rec."Withdrawal Reason")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Withdrawal Amount"; Rec."Total Withdrawal Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawal Refund Amount"; Rec."Withdrawal Refund Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control20; "Exam Withdrawal Lines")
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
                    PromotedCategory = Category9;
                    PromotedIsBig = false;
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
                    PromotedCategory = Category9;
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
                action("Summary Withdrawal Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Summary Withdrawal Report';
                    Ellipsis = true;
                    Image = Report2;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(85010, true, false, Rec);
                    end;
                }
                action("Post Voucher")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve Withdrawal';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Post the withdrawal voucher';
                    begin
                        //TESTFIELD("Payment Created");
                        if Confirm(TXT001) = true then begin
                            Examination.PostWthdrawalVoucher(Rec);
                        end
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    var
                        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        TXT001: label 'Are you sure you want to reject the withdrawal request %1';
                    begin
                        Rec.TestField("Reason for Rejection");
                        if Confirm(TXT001, true, Rec."No.") = true then begin
                            Examination.RejectWithdrawal(Rec);
                        end
                    end;
                }
                action("Raise Payment Voucher")
                {
                    ApplicationArea = Basic;
                    Image = CreateForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Raise Payment Voucher for the Student %1';
                        TXT002: label 'The Payment Voucher for the withdrawal is already raised';
                        UserSetup: Record "User Setup";
                        TXT003: label 'You are not allowed to perform this action,consult the system administrator';
                    begin
                        if Confirm(TXT001, true, Rec."Student Reg. No.") = true then begin
                            //check is user is accounts approved
                            UserSetup.Reset;
                            UserSetup.SetRange("User ID", UserId);
                            UserSetup.SetRange("Accounts User", true);
                            if not UserSetup.FindFirst then
                                Error(TXT003);
                            if Rec."Payment Created" = false then
                                Examination.WithdrawalCreateVoucher(Rec)
                            else
                                Message(TXT002);
                        end
                    end;
                }
                action("Fetch Withdrawal Papers")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Student Reg. No.");
                        //VALIDATE("Student Reg. No.");
                        if (Rec."Document Type" = Rec."document type"::Withdrawal) or (Rec."Document Type" = Rec."document type"::Defferment) then begin
                            ExamBookingEntries.Reset;
                            ExamBookingEntries.SetRange("Student Reg No.", Rec."Student Reg. No.");
                            ExamBookingEntries.SetRange("Exam Sitting", Rec."Examination Sitting");

                            EntryNo := 0;
                            StudentBookingLines.Reset;
                            if StudentBookingLines.FindLast then begin
                                EntryNo := StudentBookingLines."Line No.";
                            end;
                            if ExamBookingEntries.FindSet then begin

                                repeat

                                    StudentBookingLines.Init;
                                    StudentBookingLines."Line No." := EntryNo + 1;
                                    StudentBookingLines."Document Type" := Rec."Document Type";
                                    StudentBookingLines."Booking Header No." := Rec."No.";
                                    if Rec."Document Type" = Rec."document type"::Withdrawal then begin
                                        StudentBookingLines.Type := StudentBookingLines.Type::Withdrawal;
                                    end;
                                    StudentBookingLines."Course Id" := ExamBookingEntries.Examination;
                                    StudentBookingLines.Part := ExamBookingEntries.Part;
                                    StudentBookingLines.Validate(Part);
                                    StudentBookingLines.Section := ExamBookingEntries.Section;
                                    StudentBookingLines.Validate(Section);
                                    StudentBookingLines.Paper := ExamBookingEntries.Paper;
                                    StudentBookingLines.Validate(Paper);
                                    StudentBookingLines.Amount := ExamBookingEntries."Fee Amount";
                                    StudentBookingLines."Amount LCY" := ExamBookingEntries."Fee Amount";
                                    StudentBookingLines.Description := ExamBookingEntries.Description;
                                    StudentBookingLines.Insert;

                                    //insert into withdrawal entries
                                    EntryNo := EntryNo + 1;
                                until ExamBookingEntries.Next = 0;
                            end;
                        end;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Withdrawal;
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
        Examination: Codeunit Examination;

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
}

#pragma implicitwith restore

