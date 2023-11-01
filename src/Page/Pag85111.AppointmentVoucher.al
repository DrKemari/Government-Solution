#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85111 "Appointment Voucher"
{
    PageType = Card;
    SourceTable = "Appointment Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
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
                field("Project Staff Template ID"; Rec."Project Staff Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Staff Template ID field.';
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Examination Start Date"; Rec."Examination Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Start Date field.';
                }
                field("Examination End Date"; Rec."Examination End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination End Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Minimum Required No."; Rec."Minimum Required No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Minimum Required No. field.';
                }
                field("Actual No."; Rec."Actual No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Actual No. field.';
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointing Authority field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control23; "Staff Appointment Lines")
            {
                SubPageLink = "Header No." = field(Code),
                              "Document Type" = field("Document Type");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                begin
                    Message('');
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                begin
                    Message('The approval request has been sent');
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Message('The approval request has been sent');
                end;
            }
            action(ReOpen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the ReOpen action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);
                end;
            }
            action("Re-Open")
            {
                ApplicationArea = Basic;
                Caption = 'Re-Open';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
                ToolTip = 'Executes the Re-Open action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(85006, true, false, Rec);
                end;
            }
            action("Suggest Appointment Details")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Appointment Details action.';
                trigger OnAction()
                begin
                    StaffTemplateExperience.Reset;
                    StaffTemplateExperience.SetRange("Staff Template ID", Rec."Project Staff Template ID");
                    if StaffTemplateExperience.FindSet then begin
                        repeat
                            //get entry no.
                            StaffAppointExperience.Reset;
                            if StaffAppointExperience.FindLast then begin
                                "EntryNo." := StaffAppointExperience."Entry No.";
                            end;
                            StaffAppointExperience."Entry No." := "EntryNo." + 1;
                            StaffAppointExperience."Staff Role Code" := StaffTemplateExperience."Staff Role Code";
                            StaffAppointExperience."Minimum Experience Requirement" := StaffTemplateExperience."Minimum Experience Requirement";
                            StaffAppointExperience."Minimum Years of Experience" := StaffTemplateExperience."Minimum Years of Experience";
                            StaffAppointExperience."Experience Category" := StaffTemplateExperience."Experience Category";
                            StaffAppointExperience."Staff Appointment ID" := Rec.Code;
                            StaffAppointExperience.Insert;

                        until StaffTemplateExperience.Next = 0;
                    end;

                    StaffTemplateQualifications.Reset;
                    StaffTemplateQualifications.SetRange("Staff Template ID", Rec."Project Staff Template ID");
                    if StaffTemplateQualifications.FindSet then begin
                        repeat

                            StaffAppointQualifications.Reset;
                            if StaffAppointQualifications.FindLast then begin
                                "EntryNo." := StaffAppointQualifications."Line No.";
                            end;
                            StaffAppointQualifications."Line No." := "EntryNo." + 1;
                            StaffAppointQualifications."Staff Role Code" := StaffTemplateQualifications."Staff Role Code";
                            StaffAppointQualifications."Qualification Category" := StaffTemplateQualifications."Qualification Category";
                            StaffAppointQualifications."Qualification Description" := StaffTemplateQualifications."Qualification Description";
                            StaffAppointQualifications."Staff Appointment ID" := Rec.Code;
                            StaffAppointQualifications.Insert;
                        until StaffTemplateQualifications.Next = 0;
                    end;
                end;
            }
            action("Notify Appointees")
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Notify Appointees action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    ExaminationCodeunit.NotifyResources(Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Appointment;
    end;

    var
        StaffAppointExperience: Record "Staff Appoint Experience";
        StaffAppointQualifications: Record "Staff Appoint Qualifications";
        StaffTemplateExperience: Record "Staff Template Experience";
        StaffTemplateQualifications: Record "Staff Template Qualifications";
        "EntryNo.": Integer;
        ExaminationCodeunit: Codeunit Examination;
}

#pragma implicitwith restore

