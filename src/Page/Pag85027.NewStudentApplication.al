#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85027 "New Student Application"
{
    Caption = 'New Student Application';
    DeleteAllowed = false;
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID/Passport No./Birth Certificate No';
                    ToolTip = 'Specifies the value of the ID/Passport No./Birth Certificate No field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = Existing;
                    Enabled = Existing;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Enabled = Existing;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    Enabled = Existing;
                    ToolTip = 'Specifies the value of the Surname field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Enabled = Existing;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    Enabled = Existing;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    Caption = 'PWD';
                    ToolTip = 'Specifies the value of the PWD field.';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                    Editable = Editable;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reason for Rejection field.';
                }
                group("Institution Sponsored Only")
                {
                    Caption = 'Institution Sponsored Only';
                    field("Institution Code"; Rec."Institution Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Institution Code field.';
                    }
                    field("Institution Name"; Rec."Institution Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Institution Name field.';
                    }
                    field("Institution Reference No."; Rec."Institution Reference No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Institution Reference No. field.';
                    }
                }
                group("Customer Details")
                {
                    field("Student No."; Rec."Student No.")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Student No. field.';
                    }
                    field("Student Name"; Rec."Student Name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Student Name field.';
                    }
                    field(Balance; Rec.Balance)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Balance field.';
                    }
                    field("Balance (LCY)"; Rec."Balance (LCY)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Balance (LCY) field.';
                    }
                    field("Currency Code"; Rec."Currency Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Currency Code field.';
                    }
                    field("Examination Sitting"; Rec."Examination Sitting")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Examination Sitting field.';
                    }
                    field("Examination Project Name"; Rec."Examination Project Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Examination Sitting Name';
                        Editable = false;
                        ToolTip = 'Specifies the value of the Examination Sitting Name field.';
                    }
                    field("Fee Type"; Rec."Fee Type")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Fee Type field.';
                    }
                    field("Examination ID"; Rec."Examination ID")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Examination ID';
                        ToolTip = 'Specifies the value of the Examination ID field.';
                    }
                    field("Examination Description"; Rec."Examination Description")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Examination Description';
                        Editable = false;
                        ToolTip = 'Specifies the value of the Examination Description field.';
                    }
                    field("Payment Evidence"; Rec."Payment Evidence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Payment Evidence field.';
                    }
                    field("Payment Reference No."; Rec."Payment Reference No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Payment Reference No. field.';
                    }
                    field("Pay Mode"; Rec."Pay Mode")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Pay Mode field.';
                    }
                    field("Application Invoice"; Rec."Application Invoice")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Application Invoice field.';
                    }
                    field("Application Amount"; Rec."Application Amount")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Application Amount field.';
                    }
                    field("Application Receipt"; Rec."Application Receipt")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Application Receipt field.';
                    }
                }
            }
            group("Education Details")
            {
                field("Highest Academic QCode"; Rec."Highest Academic QCode")
                {
                    ApplicationArea = Basic;
                    Caption = 'Highest Academic Code';
                    ToolTip = 'Specifies the value of the Highest Academic Code field.';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Highest Academic Qualification field.';
                }
                field("Source of Information"; Rec."Source of Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'How did you know about Kasneb';
                    ToolTip = 'Specifies the value of the How did you know about Kasneb field.';
                }
                field("Information Source Name"; Rec."Information Source Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Information Source Name field.';
                }
                field("Training Institution Code"; Rec."Training Institution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Institution Code field.';
                }
                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Institution field.';
                }
            }
            group("Contact Details")
            {
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mobile Phone No.';
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Caption = 'Postal Address';
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Physical Address';
                    ToolTip = 'Specifies the value of the Physical Address field.';
                }
                field("County Code"; Rec."County Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                group("Next of Kin Details")
                {
                    field(" Relationship"; Rec."Contact Relationship")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Contact Relationship field.';
                    }
                    field("Full Name"; Rec."Contact Full Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Contact Full Name field.';
                    }
                    field(" Email"; Rec."Contact Email")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Contact Email field.';
                    }
                    field(" Phone No."; Rec."Contact Phone No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Contact Phone No. field.';
                    }
                }
            }
            part(Control75; "Disability Details")
            {
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
            action("Onboard Students")
            {
                ApplicationArea = Basic;
                Caption = 'Register Student';
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Register Student action.';
                trigger OnAction()
                var
                    TXT001: label 'Register student %1';
                    Header: Record "Student Processing Header";
                    TXT002: label 'This function is not allowed for institution applications,kindly use  "Apply Institution Payment"';
                begin
                    //onboard student
                    Rec.TestField(Image);
                    Rec.TestField(Gender);
                    Rec.TestField("Examination Sitting");
                    Rec.TestField("Examination ID");
                    Rec.TestField("ID Number/Passport No.");
                    Rec.TestField("First Name");
                    Rec.TestField(Email);
                    //ensure institution code is blank
                    if Rec."Institution Code" = '' then begin
                        if Confirm(TXT001, true, Rec."ID Number/Passport No.") = true then begin
                            if Rec."Student No." = '' then begin
                                Examination.ApplicationOnboardCustomer(Rec);
                            end else
                                Examination.ApplicationCreateInvoice(Rec);
                        end
                    end else
                        Error(TXT002);
                end;
            }
            action("Reject Application")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reject Application action.';
                trigger OnAction()
                begin
                    //send email notification for rejection with reasons
                    Rec.TestField("Reason for Rejection");
                    Examination.ApplicationSendRegretEmail(Rec);
                end;
            }
            action(SendRegistration)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the SendRegistration action.';
                trigger OnAction()
                var
                    DynasoftPortalUser: Record "Dynasoft Portal User";
                    Studentmanagement: Codeunit "Student management";
                begin
                end;
            }
            action("Send Student Invoice")
            {
                ApplicationArea = Basic;
                Image = OrderReminder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Student Invoice action.';
                trigger OnAction()
                begin
                    Rec.TestField("Application Invoice");
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85099, true, false, Rec);
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
                ToolTip = 'Executes the Pay Now action.';
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
            action("Process Receipt")
            {
                ApplicationArea = Basic;
                Image = CalculatePlanChange;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Process Receipt action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to post a receipt for this application') = true then begin
                        Rec.TestField("Application Invoice");
                        Examination.ApplicationCReceipt(Rec);

                    end
                end;
            }
            action("Post Voucher")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post Voucher action.';
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
            action(Print)
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85042, true, false, Rec);
                end;
            }
            action("Apply Student Balance")
            {
                ApplicationArea = Basic;
                Image = CalendarWorkcenter;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                RunObject = Page "Student Balances";
                RunPageLink = "Customer No." = field("Student No.");
                ToolTip = 'Executes the Apply Student Balance action.';
                trigger OnAction()
                var
                    TXT001: label 'Apply the value %1 to %2';
                begin
                    Rec.TestField("Student No.");
                end;
            }
            action("Bank Payment Details")
            {
                ApplicationArea = Basic;
                Image = AnalysisView;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Bank Payment Details";
                RunPageLink = "Reference No." = field("Payment Reference No.");
                RunPageMode = View;
                Visible = false;
                ToolTip = 'Executes the Bank Payment Details action.';
            }
            action("Allocate Student Amount")
            {
                ApplicationArea = Basic;
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Allocate Student Amount action.';
                trigger OnAction()
                begin
                    Rec.TestField("Payment Reference No.");
                    Rec.TestField("Student No.");
                    Examination.AllocateTotalStudentBalance(Rec);
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
                ToolTip = 'Executes the MPESA Payment Details action.';
            }
            action("Remove Invoice")
            {
                ApplicationArea = Basic;
                Image = Delete;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                ToolTip = 'Executes the Remove Invoice action.';
                trigger OnAction()
                var
                    TXT001: label 'Do you want to delete the invoice for %1';
                    UserSetup: Record "User Setup";
                    TXT002: label 'You do not have sufficient rights to perform this transaction,consult the system administrator';
                begin
                    if Confirm(TXT001, true, Rec."No.") = true then begin
                        UserSetup.Reset;
                        UserSetup.SetRange("Revenue Admin", true);
                        UserSetup.SetRange("User ID", UserId);
                        if UserSetup.FindFirst then begin
                            Examination.BookingRemoveInvoice(Rec);
                        end else
                            Error(TXT002);

                    end;
                end;
            }
            action("Set As Existing")
            {
                ApplicationArea = Basic;
                Image = Migration;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Set As Existing action.';
                trigger OnAction()
                begin
                    if UserSetup.Get(UserId) then begin
                        if UserSetup."Exam Support Admin" = true then begin
                            Rec.Type := Rec.Type::Existing;
                            Rec.Modify(true);
                            Commit;
                            Message(TXT005, Rec."No.");
                        end
                        else begin
                            UserSetup.Reset;
                            UserSetup.SetRange("User ID", UserId);
                            UserSetup.SetRange("Exam Support Admin", true);
                            if not UserSetup.FindLast then begin

                                Error(TXT006);
                            end
                        end
                    end
                end;
            }
            group("Institution Payment")
            {
                action("Apply Institution Payment ")
                {
                    ApplicationArea = Basic;
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Apply Institution Payment  action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Post payment for %1 to the institution %2';
                        ProcessingHeader1: Record "Student Processing Header";
                        Customer: Record Customer;
                    begin
                        Rec.TestField("Institution Reference No.");
                        Rec.TestField("Institution Code");
                        if Confirm(TXT001, true, Rec."ID Number/Passport No.", Rec."Institution Name") = true then begin
                            Examination.ApplyInstitutionPayment(Rec);

                            Customer.Reset;
                            Customer.SetRange("ID. No.", Rec."ID Number/Passport No.");
                            if Customer.FindFirst then begin
                                ProcessingHeader1.Reset;
                                ProcessingHeader1.SetRange("No.", Rec."No.");
                                if ProcessingHeader1.FindFirst then begin
                                    ProcessingHeader1."Student No." := Customer."No.";
                                    ProcessingHeader1."Student Name" := Customer.Name;
                                    ProcessingHeader1.Modify(true);
                                end;
                            end;
                        end
                    end;
                }
                action("Bank Import Entries")
                {
                    ApplicationArea = Basic;
                    Image = CheckRulesSyntax;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    RunObject = Page "Bank Import Entries";
                    RunPageMode = View;
                    RunPageView = where(Closed = filter(false));
                    Visible = false;
                    ToolTip = 'Executes the Bank Import Entries action.';
                }
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
                    Visible = false;
                    ToolTip = 'Executes the Dimensions action.';
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
                    Visible = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
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
                    ToolTip = 'Executes the Mandatory Requirements action.';
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
                    Visible = false;
                    ToolTip = 'Executes the Document Requirements action.';
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
                        DMSManagement.FnUploadStudentDocuments(Rec."No.", 'Student Registration', Rec.RecordId);
                    end;
                }
                action("Assign Registration No.")
                {
                    ApplicationArea = Basic;
                    Image = AllocatedCapacity;
                    Promoted = false;
                    ToolTip = 'Executes the Assign Registration No. action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category8;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if UserId <> 'EMPOWER\ERPPORTAL' then
                            Error('You do  not have sufficient rights to assign a number directly');
                        Examination.ApplicationAssignRegistrationNo(Rec);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Registration;
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
        Payment: Codeunit "Student management";
        DMSManagement: Codeunit "DMS Management";
        UserSetup: Record "User Setup";
        TXT004: label 'Kindly consult the system administrator';
        TXT005: label 'The transaction %1,is now under existing applications';
        TXT006: label 'You do not have sufficient rights to perform this action,consult the system administrator';

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

