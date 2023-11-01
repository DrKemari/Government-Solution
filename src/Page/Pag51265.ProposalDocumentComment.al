#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51265 "Proposal Document Comment"
{
    PageType = Card;
    SourceTable = "Proposal Document Headr";

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
                }
                field("Accreditation No."; Rec."Accreditation No.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Institution Email"; Rec."Institution Email")
                {
                    ApplicationArea = Basic;
                }
                field("Campus No."; Rec."Campus No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Campus Name"; Rec."Campus Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control11; Comments)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Preview Voucher")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.RunModal(51198, true, false, Rec);
                end;
            }
            action("Detailed Feedback Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    ProposalDocument.Reset;
                    ProposalDocument.SetRange("Primary Key", Rec.Code);
                    if ProposalDocument.FindFirst then begin
                        Report.Run(51199, true, false, ProposalDocument);
                    end
                end;
            }
            action("Previous Response")
            {
                ApplicationArea = Basic;
            }
            action("Request Resubmission")
            {
                ApplicationArea = Basic;
                Image = Recalculate;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    //create a version for the application
                    Rec.TestField("Document Status", Rec."document status"::Incomplete);
                    Rec.TestField(Status, Rec.Status::Released);

                    if Confirm('Are you sure you want to request a re-submission from the institution?') = true then begin
                        InsAccreditation.Reset;
                        InsAccreditation.SetRange("Accreditation No.", Rec."Accreditation No.");
                        /*InsAccreditation.SETRANGE("Current Version",TRUE);
                        IF InsAccreditation.FINDFIRST THEN BEGIN
                          Accreditation.CreateInstVersion(InsAccreditation);*/
                        SendEmail(Rec);
                        //END;

                        Rec.Status := Rec.Status::Completed;
                        Rec.Published := true;
                        Rec.Modify(true);
                    end;


                end;
            }
            action("Close Completeness Checks")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //if complete modify status to awaiting finance
                    //send email to institution to sanction payment
                    Rec.TestField("Document Status", Rec."document status"::Complete);
                    Rec.TestField(Status, Rec.Status::Released);
                    if Confirm('Are you sure you want to complete the completeness checks for this application?') = true then begin
                        InsAccreditation.Reset;
                        InsAccreditation.SetRange("Accreditation No.", Rec."Accreditation No.");
                        if InsAccreditation.FindSet then begin
                            if InsAccreditation.Type = InsAccreditation.Type::Original then begin
                                InsAccreditation.Status := InsAccreditation.Status::"Awaiting Payment Processing";
                                InsAccreditation.Modify(true);
                            end;
                            //MARK ORIGINAL as wawiting finance

                        end;
                        SendEmail(Rec);
                        Rec."Document Status" := Rec."document status"::Complete;
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
                    Visible = false;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must not be open.

                    end;
                }
            }
        }
    }

    var
        usersetup: Record "User Setup";
        Cust: Record Customer;
        CompInfo: Record "Company Information";
        // Notification1: Codeunit "Email Message";
        // SMTPMailSet: Record "Email Account";
        FileDirectory: Text;
        FileName: Text;
        FileObject: Codeunit "File Management";
        CommentList: Record "Accreditation Setups";
        FileDirectory1: Text;
        InsAccreditation: Record "Ins. Accreditation Table";
        ProgramAccreditation: Record "Ins. Accreditation Table";
        Accreditation: Codeunit "Accreditation-Quality Audit";
        Applicationnumber1: Text;
        Applicationnumber2: Text;
        filelocation: Text;
        ProposalDocument: Record "Accreditation Setups";

    local procedure SendEmail(Header: Record "Proposal Document Headr")
    var
        ProposalLines: Record "Accreditation Setups";
    begin
        // CompInfo.Get;
        // SMTPMailSet.Get;
        // if Header."Document Status" = Header."document status"::Incomplete then begin
        //     Notification1.CreateMessage('Commision For University Education', SMTPMailSet."Email Sender Address", Header."Institution Email", 'Completeness Feedback',
        //     'Dear ' + Header."Institution Name" + ',<BR><BR>' +
        //     ' The completeness check for the application relating to' + ' ' + UpperCase(Header."Accreditation No.") + ' has been processed.<BR>' +
        //     '' + '<BR>' + '<BR>' + 'Attached find the completeness feedback report', true);
        //     //change address to email

        //     Notification1.AppendToBody(
        //     '<BR><BR>Kind Regards,' +
        //     '<BR><BR>For any Information or questions, Please Contact' + '<BR>Information and Communication Department<BR>' +
        //     CompInfo.Name + '<BR>' +
        //     CompInfo.Address + '<BR>' +
        //     CompInfo."Address 2" + '<BR>' +
        //     CompInfo."Phone No." + '<BR>' +
        //     CompInfo.City);

        //     ProposalLines.Reset;
        //     ProposalLines.SetRange("Primary Key", Header.Code);
        //     if ProposalLines.FindFirst then begin
        // Save on the Portal(To be Downloadable)
        // Applicationnumber1 := ConvertStr(Header."Accreditation No.", '-', '_');
        // Applicationnumber2 := ConvertStr(Applicationnumber1, ':', '_');
        // FileName := Format(Header."Accreditation No.") + '.pdf';
        // filelocation := 'C:\inetpub\wwwroot\cue\cue\cue\Downloads\' + Applicationnumber2 + '.pdf';
        // if Exists(filelocation) then begin
        //     Erase(filelocation);
        // end;
        // //Report.SaveAsPdf(51199, filelocation, ProposalLines);
        // //Save on the Portal(To be Downloadable)
        // FileDirectory := 'D:\Insitution Documents\' + Header."Accreditation No." + '.pdf';
        // //Report.SaveAsPdf(51199, FileDirectory, ProposalLines);
        // Notification1.AddAttachment(FileDirectory, FileName);
        // Notification1.AddBCC(SMTPMailSet."Email Sender Address");
        // Notification1.Send;
        // Message('The notification and Documents were successfully sent');
        // end;
        //end else begin

        //     Notification1.CreateMessage('Commision For University Education', SMTPMailSet."Email Sender Address", Header."Institution Email", 'Completeness Feedback',
        //   'Dear ' + Header."Institution Name" + ',<BR><BR>' +
        //   ' The application' + ' ' + UpperCase(Header."Accreditation No.") + ' has succesfully passed the preliminary checks.<BR>' +
        //   '' + '<BR>' + '<BR>' + 'You are cleared to  proceed with making payment based on the pro-forma invoice shared.Attached find the final completeness feedback report', true);
        //     //change address to email
        //     Notification1.AppendToBody(
        //     '<BR><BR>Kind Regards,' +
        //     '<BR><BR>For any Information or questions, Please Contact' + '<BR>Information and Communication Department<BR>' +
        //     CompInfo.Name + '<BR>' +
        //     CompInfo.Address + '<BR>' +
        //     CompInfo."Address 2" + '<BR>' +
        //     CompInfo."Phone No." + '<BR>' +
        //     CompInfo.City);
        //     ProposalLines.Reset;
        //     ProposalLines.SetRange("Primary Key", Header.Code);
        //     if ProposalLines.FindFirst then begin
        //         // Save on the Portal(To be Downloadable)
        //         Applicationnumber1 := ConvertStr(Header."Accreditation No.", '-', '_');
        //         Applicationnumber2 := ConvertStr(Applicationnumber1, ':', '_');
        //         FileName := Format(Header."Accreditation No.") + '.pdf';
        //         filelocation := 'C:\inetpub\wwwroot\cue\cue\cue\Downloads\' + Applicationnumber2 + '.pdf';
        //         if Exists(filelocation) then begin
        //             Erase(filelocation);
        //         end;
        //         //Report.SaveAsPdf(51199, filelocation, ProposalLines);

        //         //Save on the Portal(To be Downloadable)
        //         FileDirectory := 'D:\Insitution Documents\' + FileName;
        //         //Report.SaveAsPdf(51199, FileDirectory, ProposalLines);
        //         Notification1.AddAttachment(FileDirectory, FileName);
        //         Notification1.AddBCC(SMTPMailSet."Email Sender Address");
        //         Notification1.Send;
        //         Message('The notification and Documents were successfully sent');
        //     end;
        // end

    end;
}

#pragma implicitwith restore

