#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85048 "Existing Student Application"
{
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
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student No. field.';
                }
                field("Student Reg. No."; Rec."Student Reg. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Reg. No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = Existing;
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
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    Editable = Existing;
                    ToolTip = 'Specifies the value of the ID Number/Passport No./Birth Certificate field.';
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
                    Enabled = true;
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
                field("NCPWD No."; Rec."NCPWD No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NCPWD No. field.';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Examination Project Code"; Rec."Examination Project Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination Sitting Code';
                    LookupPageID = "Examination Projects";
                    ToolTip = 'Specifies the value of the Examination Sitting Code field.';
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
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Rejection field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mobile Phone No.';
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
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
                    field("Payment Reference No."; Rec."Payment Reference No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Payment Reference No. field.';
                    }
                    field("Payment Evidence"; Rec."Payment Evidence")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Payment Evidence field.';
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
                field("Examination Center Code"; Rec."Examination Center Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination Centre Code';
                    ToolTip = 'Specifies the value of the Examination Centre Code field.';
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination Centre';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination Centre field.';
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
                field("Telephone Number"; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
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
        }
        area(factboxes)
        {
            part(Control10; "Applicant Picture")
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
            systempart(Control5; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control4; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Onboard Student")
            {
                ApplicationArea = Basic;
                Enabled = Existing;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Onboard Student action.';
            }
            action("Register Student")
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Register Student action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you would like to process an invoice for this application?';
                begin
                    Rec.TestField(Email);
                    Rec.TestField(Image);
                    Rec.TestField(Gender);
                    Rec.TestField("Examination Project Code");
                    Rec.TestField("Examination ID");
                    Rec.TestField("ID Number/Passport No.");
                    Rec.TestField("First Name");
                    if Confirm(TXT001) = true then begin
                        Examination.ApplicationCreateInvoice(Rec);
                    end;
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
            action("Reject Application")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reject Application action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to send a regret email to the applicant?';
                begin
                    //send email notification for rejection with reasons
                    Rec.TestField("Reason for Rejection");
                    if Confirm(TXT001) = true then begin
                        Examination.ApplicationSendRegretEmail(Rec);
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
            action("Pay Now")
            {
                ApplicationArea = Basic;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "MPESA Payment";
                RunPageLink = "No." = field("No.");
                ToolTip = 'Executes the Pay Now action.';
                trigger OnAction()
                var
                    TXT001: label 'Initiate an MPESA payment request?';
                begin
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
            action("Remove Invoice")
            {
                ApplicationArea = Basic;
                Image = Delete;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Remove Invoice action.';
                trigger OnAction()
                var
                    TXT001: label 'Do you want to delete the invoice for %1';
                    UserSetup: Record "User Setup";
                    TXT002: label 'You do not have sufficient rights to perform this transaction,consult the system administrator';
                begin
                    // IF CONFIRM(TXT001,TRUE,Rec."No.")=TRUE THEN BEGIN
                    //  UserSetup.RESET;
                    //  UserSetup.SETRANGE("Revenue Admin",TRUE);
                    //  UserSetup.SETRANGE("User ID",USERID);
                    //  IF UserSetup.FINDFIRST THEN BEGIN
                    //    Examination.BookingRemoveInvoice(Rec);
                    //  END ELSE
                    //  ERROR(TXT002);

                    //END;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Executes the Print action.';
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
                    begin
                        //TESTFIELD("Institution Reference No.");
                        Rec.TestField("Institution Code");
                        if Confirm(TXT001, true, Rec."ID Number/Passport No.", Rec."Institution Name") = true then begin
                            Examination.ApplyInstitutionPayment(Rec)
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
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    Visible = false;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval sent');
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
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval cancelled');
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
                    ToolTip = 'Executes the Mandatory Requirements action.';
                }
                action(Remarks)
                {
                    ApplicationArea = Basic;
                    Image = ResetStatus;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page Remarks;
                    RunPageLink = "Student No." = field("Student No.");
                    Visible = false;
                    ToolTip = 'Executes the Remarks action.';
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
                    var
                        UserSetup: Record "User Setup";
                    begin

                        if UserSetup.Get(UserId) then begin
                            if not UserSetup."Approval Administrator" then
                                Error('You do  not have sufficient rights to assign a number directly') else
                                Examination.ApplicationAssignRegistrationNo(Rec);
                        end
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Registration;
        Rec.Type := Rec.Type::Existing;
    end;

    trigger OnOpenPage()
    begin
        Existing := false;
    end;

    var
        Existing: Boolean;
        Examination: Codeunit Examination;
        Payment: Codeunit "Student management";
        Studentmanagement: Codeunit "Student management";
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

