#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85277 "Marker Claim Voucher"
{
    PageType = Document;
    SourceTable = "Scripts Dispatch Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No. field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Sitting Cycle"; Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sitting Cycle field.';
                }
                field("Marker No"; Rec."Marker No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker No field.';
                }
                field("Marker Name"; Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker Name field.';
                }
                field("Total Marking Amount"; Rec."Total Marking Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Marking Amount field.';
                }
                field("Total Days Present"; Rec."Total Days Present")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Days Present field.';
                }
                field("Total Lunch Allowance"; Rec."Total Lunch Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Lunch Allowance field.';
                }
                field("Marks Distribution"; Rec."Marks Distribution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marks Distribution field.';
                }
                field("Marking Scheme"; Rec."Marking Scheme")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marking Scheme field.';
                }
                field("Examiner Report"; Rec."Examiner Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examiner Report field.';
                }
                field("Solution Amount"; Rec."Solution Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Solution Amount field.';
                }
                field("Dummy Amount"; Rec."Dummy Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dummy Amount field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field("Team Leader Amount"; Rec."Team Leader Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Team Leader Amount field.';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("Bank Branch No."; Rec."Bank Branch No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Bank Branch No. field.';
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Bank Account No. field.';
                }
                field("M-Pesa Number"; Rec."M-Pesa Number")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the M-Pesa Number field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("ID/Passport No"; Rec."ID/Passport No")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the ID/Passport No field.';
                }
                field("KRA PIN NO"; Rec."KRA PIN NO")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the KRA PIN NO field.';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Phone No field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control29; "Markers Claim Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control25; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; Links)
            {
                ApplicationArea = Basic;
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
                ToolTip = 'Executes the Print Claim action.';
                trigger OnAction()
                var
                    ExamBookingEntries: Record "Exam Booking Entries";
                begin

                    Commit;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(85198, true, false, Rec);
                end;
            }
            action("Suggest Papers")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Suggest Papers action.';
                trigger OnAction()
                var
                    TXT002: label 'Do you want to suggest ?';
                begin
                    if Confirm(TXT002) = true then begin
                        Exam.FnSuggestMarkersPapers(Rec);
                    end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
                    TXT0022: label 'Do you want to Submit the Details ?';
                begin
                    if Confirm(TXT0022) = true then begin
                        Rec.TestField(Posted, false);
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CreateDatetime(Today, Time);
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
                ToolTip = 'Executes the Attach Documents action.';
                trigger OnAction()
                begin
                    DMSManagement.FnUploadMarkerClaimDocs(Rec."Document No.", 'MarkerClaim', Rec.RecordId);
                end;
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
                    PromotedCategory = Category4;
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
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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
        Rec.CalcFields("Total Days Present");
        ExaminationSetup.Get;
        Rec."Total Lunch Allowance" := Rec."Total Days Present" * ExaminationSetup."Default Lunch Amount";
        Rec."Dummy Amount" := ExaminationSetup."Default Dummy Amount";
        Rec.Modify(true)
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Marker Claim Voucher";
    end;

    var
        Exam: Codeunit Examination;
        ExaminationSetup: Record "Examination Setup";
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

