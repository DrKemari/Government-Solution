#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51363 "Accreditation Completeness"
{
    PageType = Card;
    SourceTable = "Evaluation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Accreditation Application" where(Status = const("Awaiting Completeness Checks"));
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Insitution Code"; Rec."Insitution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insitution Code field.';
                }
                field("Application Description"; Rec."Application Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Description field.';
                }
                field("Institution Email"; Rec."Institution Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Email field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
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
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            // part(Control24; "Checks Lines")
            // {
            //     SubPageLink = "Evaluation Header No." = field(Code);
            //     ApplicationArea = Basic;
            // }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Close Completeness Checks")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Close Completeness Checks action.';
                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                begin
                    //if complete modify status to awaiting finance
                    //send email to institution to sanction payment
                    Rec.TestField("Document Status", Rec."document status"::Complete);
                    //TESTFIELD(Status,Status::Approved);
                    if Confirm('Are you sure you want to complete the completeness checks for this application?') = true then begin
                        ProgramAccreditation.Reset;
                        ProgramAccreditation.SetRange("Application No.", Rec."Application No.");
                        if ProgramAccreditation.FindFirst then begin
                            ProgramAccreditation.Status := ProgramAccreditation.Status::"Awaiting Peer Review";
                            ProgramAccreditation.Published := true;
                            ProgramAccreditation.Modify(true);
                            Examination.AccreditationCloseCompleteness(Rec);
                        end;
                        Rec.Status := Rec.Status::Completed;
                        Rec.Published := true;
                        Rec.Modify(true);

                    end;
                end;
            }
            action("Notify Institution")
            {
                ApplicationArea = Basic;
                Caption = 'Send Feedback Voucher';
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Send Feedback Voucher action.';
            }
            action("Preview Feedback Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Preview Feedback Report action.';
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Commit;
                    Report.Run(51155, true, false, Rec);
                end;
            }
            action("Request Resubmission")
            {
                ApplicationArea = Basic;
                Image = Recalculate;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Request Resubmission action.';
                trigger OnAction()
                begin

                    //create a version for the application
                    Rec.TestField("Document Status", Rec."document status"::Incomplete);
                    if Confirm('Are you sure you want to request a re-submission from the institution?') = true then begin
                        Rec.Status := Rec.Status::Completed;
                        Rec.Published := true;
                        Rec.Modify(true);
                        // END;
                    end
                end;
            }
            group(APPROVAL)
            {
                Caption = 'APPROVAL';
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Enabled = true;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        Text001: label 'This request is already pending approval';
                    begin
                        if Rec.Status <> Rec.Status::Open then begin
                            Error(Text001);
                        end

                    end;
                }
                action("Approval Request Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Run;
                    end;
                }
                action("Approved Request Entries")
                {
                    ApplicationArea = Basic;
                    Image = approval;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Entries";
                    RunPageLink = "Document No." = field("No. Series");
                    Visible = false;
                    ToolTip = 'Executes the Approved Request Entries action.';
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must not be open.

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ChecksLines.Reset;
        ChecksLines.SetRange("Evaluation Header No.", Rec.Code);
        ChecksLines.SetRange(Status, ChecksLines.Status::Incomplete);
        if ChecksLines.FindFirst then begin
            Rec."Document Status" := Rec."document status"::Incomplete;
            Rec.Modify(true);
        end else begin
            Rec."Document Status" := Rec."document status"::Complete;
            Rec.Modify(true);
        end
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Check;
    end;

    trigger OnOpenPage()
    begin
        // ChecksLines.RESET;
        // ChecksLines.SETRANGE("Evaluation Header No.",Code);
        // ChecksLines.SETRANGE(Status,ChecksLines.Status::Incomplete);
        // IF ChecksLines.FINDFIRST THEN BEGIN
        //  "Document Status":="Document Status"::Incomplete;
        //  MODIFY(TRUE);
        // END ELSE BEGIN
        // "Document Status":="Document Status"::Complete;
        //  MODIFY(TRUE);
        //  END
    end;

    var
        ScoringSetup: Record "Evaluation Verdicts";
        EaluationVerdict: Text;
        ProgramAccreditation: Record "Accreditation Application";
        ChecksLines: Record "Checks Lines";
        applications: Record "Accreditation Application";

    local procedure SendEmail(Header: Record "Evaluation Header")
    var
        AccreditationTable: Record "Acc Fee Schedules";
        AccreditationSetup: Record "Accreditation Type Series";
        Description: Text;
        Institution: Record Customer;
        EvaluationHeader: Record "Evaluation Header";
        Header2: Record "Evaluation Header";
    begin
    end;


    procedure CReceipt("ApplicationNo.": Code[30]) Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        cashmgtsetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ReceiptLines: Record "Receipt Lines1";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        AccreditationApplication: Record "Accreditation Application";
        UserSetup: Record "User Setup";
        AccreditationSetup: Record "Acc Fee Schedules";
        Amount: Decimal;
        ProgramAccreditation: Record "Accreditation Application";
        Examination: Codeunit Examination;
        CompInfo: Record "Company Information";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        ReceiptHeader1: Record "Receipts Header1";
        Filelocation1: Text;
        Filename1: Text;
    begin



        // ExaminationSetup.Get;
        // Email2 := ExaminationSetup."Registration Sender Email";
        // //SMTP.Create('KASNEB ACCREDITATION', Email2, "Institution Email",
        // 'KASNEB ACCREDITATION',
        //  'Dear ' + "Application Description" + ',<BR><BR>' +
        //  'Your payment in relation to the accreditation done on <b>' + ' ' + Format("Created On") + ' ' + '</b> has been processed.<BR>' +
        //  'Find attached the confirmation', true);

        // Filename1 := 'Confirmation-' + "Application No." + '.pdf';
        // Filelocation1 := ExaminationSetup."Examination Path" + Filename1;
        // AccreditationApplication.Reset;
        // AccreditationApplication.SetRange("Application No.", "ApplicationNo.");
        // if AccreditationApplication.FindFirst then begin
        //     //Report.SaveAsPdf(51252, Filelocation1, AccreditationApplication);

        // end;

        // //SMTP.AddAttachment(Filelocation, Filename);
        // //SMTP.AddBCC(Email2);
        // //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>KASNEB ACCREDITATION<BR>');
        // //SMTP.Send();


    end;
}

#pragma implicitwith restore

