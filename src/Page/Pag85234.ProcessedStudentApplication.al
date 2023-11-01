#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85234 "Processed Student Application"
{
    Caption = 'Processed Student Application';
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
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID/Passport No./Birth Certificate No';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = Existing;
                    Enabled = Existing;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Enabled = Existing;
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    Enabled = Existing;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Enabled = Existing;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    Enabled = Existing;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    Caption = 'PWD';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                    Editable = Editable;
                }
                group("Customer Details")
                {
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
                    field("Examination Sitting"; Rec."Examination Sitting")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Examination Project Name"; Rec."Examination Project Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Examination Sitting Name';
                        Editable = false;
                    }
                    field("Fee Type"; Rec."Fee Type")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Examination ID"; Rec."Examination ID")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Examination ID';
                    }
                    field("Examination Description"; Rec."Examination Description")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Examination Description';
                        Editable = false;
                    }
                    field("Payment Evidence"; Rec."Payment Evidence")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Payment Reference No."; Rec."Payment Reference No.")
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
                        Editable = false;
                    }
                    field("Application Amount"; Rec."Application Amount")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Application Receipt"; Rec."Application Receipt")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                }
            }
            group("Education Details")
            {
                field("Highest Academic QCode"; Rec."Highest Academic QCode")
                {
                    ApplicationArea = Basic;
                    Caption = 'Highest Academic Code';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Source of Information"; Rec."Source of Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'How did you know about Kasneb';
                }
                field("Information Source Name"; Rec."Information Source Name")
                {
                    ApplicationArea = Basic;
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
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mobile Phone No.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Caption = 'Postal Address';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Physical Address';
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

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //"Approval Status" := "approval status"::"2";
                        Rec.Modify(true);
                        Message('Approval succesfully');
                    end;
                }
                action("Print report")
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(85049, true, true, Rec);
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

                        Rec."Approval Status" := Rec."approval status"::Open;
                        Rec.Modify(true);
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

                    trigger OnAction()
                    begin
                        DMSManagement.FnUploadStudentDocuments(Rec."No.", 'Student Registration', Rec.RecordId);
                    end;
                }
                action(test)
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    var
                        Examination: Codeunit Examination;
                    begin
                        Examination.RegOnboardInstitutionCustomer(Rec);
                    end;
                }
                action("Assign Registration No.")
                {
                    ApplicationArea = Basic;
                    Image = AllocatedCapacity;
                    Promoted = false;
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

