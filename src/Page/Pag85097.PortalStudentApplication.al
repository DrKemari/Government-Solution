#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85097 "Portal Student Application"
{
    Caption = 'Portal Student Application';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
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
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID/Passport No.';
                    Editable = false;
                }
                field("Type Code"; Rec."Type Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type Code field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Birth Certificate No."; Rec."Birth Certificate No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = Existing;
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = Existing;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = Existing;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = Existing;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = Existing;
                }
                field("NCPWD No."; Rec."NCPWD No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = Existing;
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Highest Academic QCode"; Rec."Highest Academic QCode")
                {
                    ApplicationArea = Basic;
                    Caption = 'Highest Academic Code';
                    Editable = false;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                    Editable = Editable;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                    Editable = Editable;
                }
                group("Customer Details")
                {
                    Editable = true;
                    field("Student No."; Rec."Student No.")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Student Name"; Rec."Student Name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Currency Code"; Rec."Currency Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Fee Type"; Rec."Fee Type")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                    field("Payment Evidence"; Rec."Payment Evidence")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Pay Mode"; Rec."Pay Mode")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Application Invoice"; Rec."Application Invoice")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                    field("Application Amount"; Rec."Application Amount")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                    field("Application Receipt"; Rec."Application Receipt")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                }
            }
            group("Education Details")
            {
                Editable = true;
                field("Source of Information"; Rec."Source of Information")
                {
                    ApplicationArea = Basic;
                }
                field("Information Source Name"; Rec."Information Source Name")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Project Code"; Rec."Examination Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Project Name"; Rec."Examination Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ID';
                    Editable = true;
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination Description';
                    Editable = false;
                }
                field("Examination Center Code"; Rec."Examination Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training Institution Code"; Rec."Training Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Contact Details")
            {
                Editable = false;
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mobile Phone No.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                group("Next of Kin Details")
                {
                    Editable = false;
                    field(" Relationship"; Rec."Contact Relationship")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Full Name"; Rec."Contact Full Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field(" Email"; Rec."Contact Email")
                    {
                        ApplicationArea = Basic;
                    }
                    field(" Phone No."; Rec."Contact Phone No.")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            part(Control75; "Disability Details")
            {
                Editable = false;
                SubPageLink = "Student No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control56; "Applicant Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(18),
                              "No." = field("No.");
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
            }
            systempart(Control53; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control48; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Process Payment")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                var
                    TXT001: label 'The payment for application no. %1 is already processed';
                begin
                    Rec.TestField(Image);
                    if Rec."Application Invoice" <> '' then
                        Error(TXT001);
                    if Confirm('Are you sure you want to process payment for this application') = true then begin
                        Examination.ApplicationOnboardCustomer(Rec);
                    end
                end;
            }
            //SendEmailNotif
            action("Test Email")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                var
                    TXT001: label 'The payment for application no. %1 is already processed';
                begin
                    Examination.SendEmailNotif(Rec);

                end;
            }
            action("Test Email2")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                var
                    TXT001: label 'The payment for application no. %1 is already processed';
                begin
                    Examination.SendEmailNotif2(Rec);

                end;
            }
            action("Approve Application")
            {
                ApplicationArea = Basic;
                Image = CalculatePlanChange;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to approve this application') = true then begin
                        Rec.TestField("Application Invoice");
                        Rec.TestField("Application Receipt");
                        //TESTFIELD("Examination Sitting");
                        Rec.TestField("Examination ID");
                        Examination.ApplicationAssignRegistrationNo(Rec);
                    end
                end;
            }
            action("Open Application")
            {
                ApplicationArea = Basic;
                Image = OpenWorksheet;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Find the registration under New or Existing Applications';
                begin
                    if Confirm('Are you sure you want to open this registration request') = true then begin
                        if ((Rec."Application Receipt" = '')) then begin
                            Rec.Portal := false;
                            Rec.Modify(true);
                            Message(TXT001);
                        end

                    end
                end;
            }
            action("Reject Application")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //send email notification for rejection with reasons
                    Rec.TestField("Reason for Rejection");
                    Examination.ApplicationSendRegretEmail(Rec);
                    Rec."Approval Status" := Rec."approval status"::Rejected;
                end;
            }
            action("Pay Now")
            {
                ApplicationArea = Basic;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "MPESA Payment";
                RunPageLink = "No." = field("No.");

                trigger OnAction()
                var
                    TXT001: label 'Initiate an MPESA payment request?';
                begin
                    // CALCFIELDS("Booking Amount");
                    // IF "Booking Amount">0 THEN BEGIN
                    //  IF CONFIRM(TXT001)=TRUE THEN BEGIN
                    //
                    //       Payment.FnSendstkpush("No.","Phone No.","Booking Amount");
                    //    END
                    // END
                end;
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
            action("Payment Details")
            {
                ApplicationArea = Basic;
                Image = AnalysisView;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Bank Payment Details";
                RunPageLink = "Reference No." = field("Payment Reference No.");
                RunPageMode = View;
                Visible = false;
            }
            action("Student Registration Qualifications")
            {
                ApplicationArea = Basic;
                Image = AnalysisView;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Student Reg Qualifications";
                RunPageLink = "Application No" = field("No.");
                RunPageMode = View;
                //Visible = false;
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
                    TXT005: label 'Kindly clear the negative balance on the student %1,before proceeding';
                    ExaminationAccount: Record "Examination Account";
                begin
                    if Confirm(TXT001) = true then begin
                        ExaminationAccount.Reset;
                        ExaminationAccount.SetRange("ID No.", Rec."ID Number/Passport No.");
                        ExaminationAccount.SetRange("Course ID", Rec."Examination ID");
                        if ExaminationAccount.FindFirst then begin
                            Rec.Posted := true;
                            Rec."Posted By" := UserId;
                            Rec."Posted Date" := Today;
                            Rec."Posted On" := CurrentDatetime;
                            Rec.Modify(true);
                        end
                    end
                end;
            }
            action("MPESA Payment Details")
            {
                ApplicationArea = Basic;
                Image = ApplicationWorksheet;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Mpesa Application";
                RunPageLink = MPESA_TXN_ID = field("Payment Reference No.");
                RunPageMode = View;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Visible = false;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85042, true, false, Rec);
                end;
            }
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
                action(Approvals)
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
                action("Mandatory Requirements")
                {
                    ApplicationArea = Basic;
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Examination Mandatory Req";
                    RunPageLink = "Course Id" = field("Examination ID");
                    RunPageMode = View;
                    Visible = false;
                }
                action("Document Requirements")
                {
                    ApplicationArea = Basic;
                    Image = DocumentsMaturity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Document Requirements";
                    RunPageLink = "Application No." = field("No.");
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        DMSManagement: Codeunit "DMS Management";
                    begin
                        DMSManagement.FnUploadStudentDocuments(Rec."No.", 'Student Registration', Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Registration;
        Rec.Portal := true;
    end;

    trigger OnOpenPage()
    begin
        Existing := true;
        //IF "Approval Status"="Approval Status"::Released THEN BEGIN
        Editable := true;
        //END;
    end;

    var
        TXT001: label 'Are you sure you want to create the Account';
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        Cust: Record Customer;
        Contact: Record Contact;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ExamFee: Record Resource;
        ExamFeeCost: Record "Resource Cost";
        Amount: Decimal;
        TXT002: label 'The student %1 has been created to the customer account %2';
        TXT003: label 'The student %1 already has an existing customer account %2';
        WorkType: Record "Work Type";
        Existing: Boolean;
        ExamAccountNo: Code[30];
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        SalesHeader: Record "Sales Header";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Editable: Boolean;
        Examination: Codeunit Examination;

    local procedure AssignRegistrationNo(BulkProcessingHeader: Record "Student Processing Header")
    var
        ExaminationAccount: Record "Examination Account";
        Courses: Record Courses;
    begin
        ExamAccountNo := '';
        Courses.Reset;
        Courses.SetRange(Code, BulkProcessingHeader."Examination ID");
        if Courses.FindFirst then begin
            NoSeriesMgt.InitSeries(Courses."No. Series", Courses."No. Series", 0D, ExamAccountNo, Courses."No. Series");
            ExaminationAccount.Init;
            ExaminationAccount."Registration No." := ExamAccountNo;
            ExaminationAccount."Student Cust No." := BulkProcessingHeader."Student No.";
            ExaminationAccount.Validate("Student Cust No.");
            ExaminationAccount."Course ID" := BulkProcessingHeader."Examination ID";
            ExaminationAccount.Validate("Course ID");
            ExaminationAccount.Email := BulkProcessingHeader.Email;
            ExaminationAccount."Current Examination Sitting" := BulkProcessingHeader."Examination Sitting";
            ExaminationAccount.Insert;
        end;
    end;
}

#pragma implicitwith restore

