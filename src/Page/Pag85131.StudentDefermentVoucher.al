#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85131 "Student Deferment Voucher"
{
    Caption = 'Student Deferment Voucher';
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
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
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
                field("Prefered Examination Sitting"; Rec."Prefered Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawal Code"; Rec."Withdrawal Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Deferment Code';
                }
                field("Withdrawal Reason"; Rec."Withdrawal Reason")
                {
                    ApplicationArea = Basic;
                    Caption = 'Deferment Reason';
                    Editable = false;
                }
                field("Administrative Fees"; Rec."Administrative Fees")
                {
                    ApplicationArea = Basic;
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                }
                field(Invoice; Rec."Application Invoice")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Total Withdrawal Amount"; Rec."Total Withdrawal Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Deferal  Amount';
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
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
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
                        TXT001: label 'Are you sure you want to reject the deferment request %1';
                    begin
                        Rec.TestField("Reason for Rejection");
                        if Confirm(TXT001, true, Rec."No.") = true then begin
                            Examination.RejectDefferal(Rec);
                        end
                    end;
                }
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
                    Visible = false;

                    trigger OnAction()
                    begin
                        //CopyBookingVoucher(Rec);
                    end;
                }
                action("Create Invoice")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Create invoice for voucher %1';
                    begin
                        Rec.TestField("Prefered Examination Sitting");
                        Rec.TestField("Fee Type");
                        if Confirm(TXT001, true, Rec."No.") = true then begin
                            Examination.DefferalCreateInvoice(Rec);
                        end
                    end;
                }
                action("MPESA Payment Details")
                {
                    ApplicationArea = Basic;
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Mpesa Application";
                    RunPageLink = MPESA_TXN_ID = field("Payment Reference No.");
                    RunPageMode = View;
                }
                action("Apply Student Balance")
                {
                    ApplicationArea = Basic;
                    Image = CalendarWorkcenter;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Student Balances";
                    RunPageLink = "Customer No." = field("Student No.");

                    trigger OnAction()
                    var
                        TXT001: label 'Apply the value %1 to %2';
                    begin
                        Rec.TestField("Student No.");
                    end;
                }
                action("Apply Institution Payment ")
                {
                    ApplicationArea = Basic;
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Post payment for %1 to the institution %2';
                        TXT002: label 'An invoice for this booking is already processed';
                    begin
                        Rec.TestField("Institution Reference No.");
                        Rec.TestField("Institution Code");
                        if Confirm(TXT001, true, Rec."ID Number/Passport No.", Rec."Institution Name") = true then begin
                            if Rec."Booking Invoice No." = '' then begin
                                Examination.ApplyInstitutionPayment(Rec)
                            end
                            else
                                Error(TXT002);
                        end
                    end;
                }
                action("Bank Payment Details")
                {
                    ApplicationArea = Basic;
                    Image = AnalysisView;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bank Payment Details";
                    RunPageLink = "Reference No." = field("Payment Reference No.");
                    RunPageMode = View;
                    Visible = false;
                }
                action("Allocate Student Amount")
                {
                    ApplicationArea = Basic;
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Payment Reference No.");
                        Rec.TestField("Student No.");
                        Examination.AllocateTotalStudentBalance(Rec);
                    end;
                }
                action("Post Voucher")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Do you want to post the voucher?';
                        TXT002: label 'The center %1,is fully booked';
                        TXT003: label 'This function is not allowed for institution applications,kindly use  "Apply Institution Payment"';
                        SalesInvoice: Record "Sales Invoice Header";
                        TXT004: label 'A posted  invoice needs to exist before posting this application';
                    begin
                        if Confirm(TXT001) = true then begin
                            Rec.TestField(Posted, false);
                            Rec.TestField("Application Invoice");
                            Examination.PostDefferalVoucher(Rec);
                        end
                        else
                            Error(TXT003);
                    end;
                }
                action("Fetch Deferment Papers")
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
        Rec."Document Type" := Rec."document type"::Defferment;
    end;

    var
        TXT001: label 'Voucher %1 posted succesfully';
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ResourcePrice: Record "Resource Price";
        TXT004: label 'Credit Memo %1 created succesfully';
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
        /*
        CreateCreditMemo(PV);
        IF CONFIRM('Are you sure you want to post the Defferment Voucher No. '+PV."No."+' ?')=TRUE THEN BEGIN
        
        IF PV."Approval Status"<>PV."Approval Status"::Released THEN
         ERROR('The Defferment Voucher No %1 has not been fully approved',PV."No.");
        IF PV.Posted THEN
         ERROR('Defferment Voucher %1 has been posted',PV."No.");
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
        
        //block entries for examination
          StudentBookingLines.RESET;
          StudentBookingLines.SETRANGE("Booking Header No.",PV."No.");
          IF StudentBookingLines.FINDSET THEN BEGIN
            REPEAT
                ExamBookingEntries.RESET;
                ExamBookingEntries.SETRANGE("Student Reg No.",PV."Student Reg. No.");
                ExamBookingEntries.SETRANGE(Course,PV."Course ID");
                ExamBookingEntries.SETRANGE(Paper,StudentBookingLines.Paper);
                IF ExamBookingEntries.FINDSET THEN BEGIN
                  ExamBookingEntries.Blocked:=TRUE;
                  ExamBookingEntries.Status:=ExamBookingEntries.Status::Deffered;
                  ExamBookingEntries.MODIFY;
                END;
            UNTIL StudentBookingLines.NEXT=0
          END;
          MESSAGE('The Defferment no %1,has been posted successfully',PV."No.");
          END;
        PV.Posted:=TRUE;
        PV."Posted By":=USERID;
        PV."Posted On":=CURRENTDATETIME;
        PV.MODIFY;
        */

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

