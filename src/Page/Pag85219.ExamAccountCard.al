#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85219 "Exam Account Card"
{
    Caption = 'Exam Account Card';
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,New Document,Approve,Request Approval,Prices and Discounts,Navigate,Customer';
    SourceTable = "Examination Account";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Student Cust No."; Rec."Student Cust No.")
                {
                    ApplicationArea = Basic;
                    Editable = True;
                    ToolTip = 'Specifies the value of the Student Cust No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Surname field.';
                }
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ID No. field.';
                }
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Course ID field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Course Description field.';
                }
                field("Current Examination Sitting"; Rec."Current Examination Sitting")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Examination Sitting field.';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }
                field("Last Renewal Date"; Rec."Last Renewal Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Renewal Date field.';
                }
                field("Renewal Date L"; Rec."Renewal Date L")
                {
                    ApplicationArea = Basic;
                    Caption = 'Renewal Date';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Renewal Date field.';
                }
                field("Renewal Amount"; Rec."Renewal Amount")
                {
                    ApplicationArea = Basic;
                    Editable = ModifyTrue;
                    ToolTip = 'Specifies the value of the Renewal Amount field.';
                }
                field("Re-Activation Amount"; Rec."Re-Activation Amount")
                {
                    ApplicationArea = Basic;
                    Editable = ModifyTrue;
                    ToolTip = 'Specifies the value of the Re-Activation Amount field.';
                }
                field("Renewal Pending"; Rec."Renewal Pending")
                {
                    ApplicationArea = Basic;
                    Editable = ModifyTrue;
                    ToolTip = 'Specifies the value of the Renewal Pending field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = StatusModify;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Status Remarks"; Rec."Status Remarks")
                {
                    ApplicationArea = Basic;
                    Editable = ModifyTrue;
                    ToolTip = 'Specifies the value of the Status Remarks field.';
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
                field("Reason for Blocking"; Rec."Reason for Blocking")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Blocking field.';
                }
                field("Blocking Remarks"; Rec."Blocking Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocking Remarks field.';
                }
                field("Blocked Start Date"; Rec."Blocked Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = BlockTrue;
                    ToolTip = 'Specifies the value of the Blocked Start Date field.';
                }
                field("Blocked End Date"; Rec."Blocked End Date")
                {
                    ApplicationArea = Basic;
                    Editable = BlockTrue;
                    ToolTip = 'Specifies the value of the Blocked End Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            group("Communication Details")
            {
                Editable = false;
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
            group("Examination Details")
            {
                Editable = false;
                field("Last Modified Date Time"; Rec."Last Modified Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Modified Date Time field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Certificate No."; Rec."Certificate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate No. field.';
                }
                field("Collection Date"; Rec."Collection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collection Date field.';
                }
                field("Collected By Name"; Rec."Collected By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By Name field.';
                }
                field("Collected By ID No."; Rec."Collected By ID No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By ID No. field.';
                }
                field("Collected By Email"; Rec."Collected By Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By Email field.';
                }
                field("Issued By Officer"; Rec."Issued By Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By Officer field.';
                }
                field("Issued By Officer Name"; Rec."Issued By Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By Officer Name field.';
                }
                field("Issued By User ID"; Rec."Issued By User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By User ID field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control149; "Customer Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("Student Cust No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(History)
            {
                Caption = 'History';
                Image = History;
                action(Remarks)
                {
                    ApplicationArea = Basic;
                    Image = ResetStatus;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page Remarks;
                    RunPageLink = "Registration No." = field("Registration No.");
                    ToolTip = 'Executes the Remarks action.';
                }
                action("Examination Booking Entries")
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Exam Booking Entries";
                    RunPageLink = "Student Reg No." = field("Registration No.");
                    ToolTip = 'Executes the Examination Booking Entries action.';
                }
                action("Exemption Entries")
                {
                    ApplicationArea = Basic;
                    Image = RemoveLine;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Exemption Entries";
                    RunPageLink = "Stud. Reg. No" = field("Registration No.");
                    ToolTip = 'Executes the Exemption Entries action.';
                }
                action("Deffered Entries")
                {
                    ApplicationArea = Basic;
                    Image = WIPEntries;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Exam Defered Entries";
                    RunPageLink = "Student Reg No." = field("Registration No.");
                    ToolTip = 'Executes the Deffered Entries action.';
                }
                action("Withdrawn Entries")
                {
                    ApplicationArea = Basic;
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Exam Withdrawn Entries";
                    RunPageLink = "Student Reg No." = field("Registration No.");
                    ToolTip = 'Executes the Withdrawn Entries action.';
                }
                action("Ledger E&ntries")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ledger E&ntries';
                    Image = CustomerLedger;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    RunObject = Page "Customer Ledger Entries";
                    RunPageLink = "Customer No." = field("Student Cust No.");
                    RunPageView = sorting("Customer No.")
                                  order(descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
                action("Exam Result Entries")
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Student Exam Result";
                    RunPageLink = "Student Reg No." = field("Registration No."),
                                  Examination = field("Course ID");
                    ToolTip = 'Executes the Exam Result Entries action.';
                }
                action("Renewal Entries")
                {
                    ApplicationArea = Basic;
                    Image = ElectronicRegister;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Student Renewals Entries";
                    RunPageLink = "Stud. Reg. No" = field("Registration No."),
                                  "Course Id" = field("Course ID");
                    ToolTip = 'Executes the Renewal Entries action.';
                }
                action("Examination History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Examination History";
                    RunPageLink = "Student Reg No." = field("Registration No.");
                    ToolTip = 'Executes the Examination History action.';
                    trigger OnAction()
                    var
                        Examination: Codeunit Examination;
                        Studentmanagement: Codeunit "Student management";
                        DynasoftPortalUser: Record "Dynasoft Portal User";
                    begin
                    end;
                }

                action("Result Notification")
                {
                    ApplicationArea = Basic;
                    Image = Notes;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Result Notification action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange("Registration No.", Rec."Registration No.");
                        Report.Run(85016, true, false, Rec);
                    end;
                }
                action("Block Student")
                {
                    ApplicationArea = Basic;
                    Image = BreakRulesOff;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Block Student action.';
                    trigger OnAction()
                    begin
                        UserSetup.Reset;
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Student Mgmt Admin" = true then begin
                                Examination.BlockStudentAccount(Rec);
                            end else
                                Error(TXT001);
                        end
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
        AgedAccReceivable: Codeunit "Aged Acc. Receivable";
    begin
    end;

    trigger OnInit()
    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
    end;

    trigger OnOpenPage()
    var
        OfficeManagement: Codeunit "Office Management";
        PermissionManager: Codeunit "Permission Manager";
    begin
        BlockTrue := false;
        ModifyTrue := false;
        StatusModify := false;
        UserSetup.Reset;
        if UserSetup.Get(UserId) then begin
            if UserSetup."Student Mgmt Admin" = true then begin
                BlockTrue := true;
                StatusModify := true;
            end;
            if UserSetup."Exam Support Admin" = true then begin
                ModifyTrue := true;
            end;

        end;

        //check the blocked field
        if Rec.Blocked = true then begin
            StudentRemarks.Reset;
            StudentRemarks.SetRange("Registration No.", Rec."Registration No.");
            StudentRemarks.SetRange(Disciplinary, true);
            if StudentRemarks.FindSet then begin
                Message(TXT002);
            end
        end
    end;

    var
        UserSetup: Record "User Setup";
        TXT001: label 'You do not have sufficient rights to ammend student details,Consult the system administrator';
        Examination: Codeunit Examination;
        BlockTrue: Boolean;
        StudentRemarks: Record "Student Remarks";
        TXT002: label 'The candidate is blocked for disciplinary remarks';
        ModifyTrue: Boolean;
        StatusModify: Boolean;
        ExamAccounts: Record "Examination Account";
}

#pragma implicitwith restore

