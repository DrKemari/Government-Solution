#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85546 "Checker Claim Voucher"
{
    PageType = Document;
    SourceTable = "Scripts Dispatch Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(DocumentNo;Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate;Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(ProjectNo;Rec."Project No.")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectName;Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(SittingCycle;Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                }
                field("Checker No";Rec."Marker No")
                {
                    ApplicationArea = Basic;
                }
                field("Checker Name";Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                }
                field(Allowances;Rec.Allowances)
                {
                    ApplicationArea = Basic;
                }
                field(TotalDaysPresent;Rec."Total Days Present")
                {
                    ApplicationArea = Basic;
                }
                field(CheckingAmount;Rec."Checking Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TotalCheckingAmount;Rec."Total Checking Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TotalCheckerEntitlements;Rec."Total Checker Entitlements")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BankCode;Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(BankName;Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(BranchName;Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(BankBranchNo;Rec."Bank Branch No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(BankAccountNo;Rec."Bank Account No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(MPesaNumber;Rec."M-Pesa Number")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(Email;Rec.Email)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(IDPassportNo;Rec."ID/Passport No")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(KRAPINNO;Rec."KRA PIN NO")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(PhoneNo;Rec."Phone No")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(ApprovalStatus;Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn;Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control25;Outlook)
            {
            }
            systempart(Control26;Notes)
            {
            }
            systempart(Control27;MyNotes)
            {
            }
            systempart(Control28;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Claim")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ExamBookingEntries: Record "Exam Booking Entries";
                begin

                    Commit;Rec.SetRange(Rec."Document No.",Rec."Document No.");
                    Report.Run(85229,true,false,Rec);
                end;
            }
            action("Compute Entitlements")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TXT0022: label 'Do you want to compute ?';
                begin
                     if Confirm(TXT0022)=true then begin
                    ExaminationSetup.Get;
                       ExaminationSetup.TestField("Default Checking Amount");
                       Rec.CalcFields(Rec."Total Days Present");
                       Rec."Checking Amount":=ExaminationSetup."Default Checking Amount";
                       Rec."Total Checking Amount":=Rec."Total Days Present"*ExaminationSetup."Default Checking Amount";
                       Rec."Total Checker Entitlements":=Rec.Allowances+Rec."Total Checking Amount";
                       Message('Submitted Successfully');
                     end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TXT0022: label 'Do you want to Submit the Details ?';
                begin
                     if Confirm(TXT0022)=true then begin
                       Rec.TestField(Rec.Posted,false);
                      Rec.Posted:=true;
                       Rec."Posted By":=UserId;
                       Rec."Posted On":=CreateDatetime(Today,Time);
                       Message('Submitted Successfully');
                     end
                end;
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
                    DMSManagement.FnUploadMarkerClaimDocs(Rec."Document No.",'MarkerClaim',Rec.RecordId);
                end;
            }
            group(RequestApproval)
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval cancelled');
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //calculate the amounts
        // CALCFIELDS("Total Days Present");
        // ExaminationSetup.GET;
        // "Total Lunch Allowance":="Total Days Present"*ExaminationSetup."Default Lunch Amount";
        // "Dummy Amount":=ExaminationSetup."Default Dummy Amount";
        // MODIFY(TRUE)
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type":=Rec."document type"::"Checker Claim Voucher";
    end;

    var
        Exam: Codeunit Examination;
        ExaminationSetup: Record "Examination Setup";
        DMSManagement: Codeunit "DMS Management";
}
