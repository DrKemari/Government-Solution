#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69483 "Safe Work Permit Application"
{
    PageType = Card;
    SourceTable = "Safe Work Permit Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("HSE Plan Type"; Rec."HSE Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("OSH Management Plan ID"; Rec."OSH Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Permit Type"; Rec."Permit Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Works Location Details"; Rec."Works Location Details")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Emergency Coordinator"; Rec."Lead Emergency Coordinator")
                {
                    ApplicationArea = Basic;
                }
                field("Final Permit Verdict"; Rec."Final Permit Verdict")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan ID"; Rec."Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control44; "Safety Permit Application Line")
            {
                Caption = 'Safety Compliance Checklist';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Safety Checklist")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Permit Type");
                    SafetyPermitApplicationLine.Reset;
                    SafetyPermitApplicationLine.SetRange("Document No.", Rec."Document No.");
                    if SafetyPermitApplicationLine.FindSet then
                        SafetyPermitApplicationLine.DeleteAll;
                    SafetyPermitChecklist.Reset;
                    SafetyPermitChecklist.SetRange("Permit Type", Rec."Permit Type");
                    if SafetyPermitChecklist.FindSet then begin
                        repeat
                            SafetyPermitApplicationLine.Init;
                            SafetyPermitApplicationLine."Document No." := Rec."Document No.";
                            SafetyPermitApplicationLine."Document Type" := Rec."Document Type";
                            SafetyPermitApplicationLine."Line No." := SafetyPermitApplicationLine."Line No." + 100;
                            SafetyPermitApplicationLine."Compliance Requirement" := SafetyPermitChecklist.Description;
                            SafetyPermitApplicationLine."Requirement Type" := SafetyPermitChecklist."Condition Type";
                            SafetyPermitApplicationLine."Severity Level for Violation" := SafetyPermitChecklist."Severity Level for Violation";
                            SafetyPermitApplicationLine.Insert(true);
                        until SafetyPermitChecklist.Next = 0;
                    end;
                    Message('Suggested Successfully');
                end;
            }
            action("Safe Works Personnel")
            {
                ApplicationArea = Basic;
                Image = PersonInCharge;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Safety Permit Teams";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
            action("Emergency Contacts")
            {
                ApplicationArea = Basic;
                Image = ContactPerson;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Safety Permit Workgroups";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Record Type" = filter("Emergency Response");
            }
            action("Other Informed Workgroups")
            {
                ApplicationArea = Basic;
                Image = Group;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Safety Permit Workgroups";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Record Type" = filter("To-be Informed");
            }
            action("Safety Equipment Register")
            {
                ApplicationArea = Basic;
                Image = Registered;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Safety Equipment Registers";
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Approval Request has been sent.');
                end;
            }
            action("Cancel Approval Requestl ")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Approval Request has been canceled.');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;

                    Message('The document has been released successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;

                    Message('The document has been reopened successfully');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Approval Request has been sent.');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    if Rec.FindSet then
                        Report.Run(69452, true, true, Rec);
                end;
            }
            action(Close)
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // IF UserSetup.GET(USERID) THEN BEGIN
                    //  IF UserSetup."Original Approver ID"=TRUE THEN BEGIN
                    //    TESTFIELD(Status,Status::Released);
                    //
                    //  END;
                    //    END;
                    Message('Closed successfully');
                end;
            }
            action("e-Permit")
            {
                ApplicationArea = Basic;
                Image = Permission;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    if Rec.FindSet then
                        Report.Run(69458, true, true, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Dimensions');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Safe Work Permit Application";
    end;

    var
        UserSetup: Record "User Setup";
        SafetyPermitChecklist: Record "Safety Permit Checklist";
        SafetyPermitApplicationLine: Record "Safety Permit Application Line";
}

#pragma implicitwith restore

