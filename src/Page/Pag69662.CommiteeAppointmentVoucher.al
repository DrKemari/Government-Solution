#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69662 "Commitee Appointment Voucher"
{
    PageType = Card;
    SourceTable = "Commitee Appointment Voucher";

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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Committee Type ID"; Rec."Committee Type ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Type ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Effective Date field.';
                }
                field("Tenure End Date"; Rec."Tenure End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tenure End Date field.';
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointing Authority field.';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Staff ID"; Rec."Staff ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Terms of Reference"; Rec."Terms of Reference")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Terms of Reference field.';
                }
                field("Additional Brief"; Rec."Additional Brief")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Additional Brief field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }
            part(Control6; "Committe Appointment Lines")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Selection Committee Vacancy")
            {
                ApplicationArea = Basic;
                Image = SelectLineToApply;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Selection Committee Vacancy";
                RunPageLink = "Document No." = field("Document No.");
                ToolTip = 'Executes the Selection Committee Vacancy action.';
            }
            action(Appoint)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Appoint action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    Recruitment.NotifyMembers(Rec);
                    Message('Appointed Successfully');
                    // CommiteeAppointed.RESET;
                    // CommiteeAppointed.SETRANGE("Document No.","Document No.");
                    // IF CommiteeAppointed.FINDSET THEN BEGIN
                    //  REPEAT
                    // Recruitment.NotifyMembers(Rec);
                    //
                    // CommiteeAppointed."Notified on Email":=TRUE;
                    // CommiteeAppointed."Date/Time Notified":=CURRENTDATETIME;
                    // CommiteeAppointed.MODIFY(TRUE);
                    // UNTIL CommiteeAppointed.NEXT=0;
                    //
                    //
                    // END;
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify(true);
                end;
            }
            action("Appointment Letter")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Appointment Letter action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69632, true, true, Rec);
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    Message('Approval Request has been approved');
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify(true);
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
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    Message('Approval Request has been cancelled');
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify(true);
                end;
            }
        }
    }

    var
        CommiteeAppointed: Record "Commitee Appointed Member";
        Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore

