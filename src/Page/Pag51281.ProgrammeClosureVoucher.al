#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51281 "Programme Closure Voucher"
{
    // PageType = Card;
    // SourceTable = UnknownTable51237;

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Code"; Code)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Created By"; "Created By")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Job No"; "Job No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Job Name"; "Job Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Programme  Name"; "Programme  Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Termination Reason"; "Termination Reason")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             group(Control14)
    //             {
    //             }
    //             field("Institution No."; "Institution No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("insitution Name"; "insitution Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("insitution Email"; "insitution Email")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Status; Status)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             group("Accrediation Details")
    //             {
    //                 field("Board Verdict"; "Board Verdict")
    //                 {
    //                     ApplicationArea = Basic;

    //                     trigger OnValidate()
    //                     begin
    //                         if "Termination Reason" <> "termination reason"::"3" then
    //                             Error('Termination reason has to be--%1', "termination reason"::"3");
    //                     end;
    //                 }
    //                 field("Verdict Date"; "Verdict Date")
    //                 {
    //                     ApplicationArea = Basic;

    //                     trigger OnValidate()
    //                     begin
    //                         if "Termination Reason" <> "termination reason"::"3" then
    //                             Error('Termination reason has to be--%1', "termination reason"::"3");
    //                     end;
    //                 }
    //                 field("Board Comments"; "Board Comments")
    //                 {
    //                     ApplicationArea = Basic;

    //                     trigger OnValidate()
    //                     begin
    //                         if "Termination Reason" <> "termination reason"::"3" then
    //                             Error('Termination reason has to be--%1', "termination reason"::"3");
    //                     end;
    //                 }
    //                 field("Accreditation Reason"; "Accreditation Reason")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Ordinal Number"; "Ordinal Number")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //             }
    //             group("Request for Termination")
    //             {
    //                 field("Letter of Termination"; "Letter of Termination")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Letter of Termination Date';
    //                 }
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    //     area(processing)
    //     {
    //         group("Programme Closure")
    //         {
    //             Caption = 'Programme Closure';
    //             Image = "Order";
    //             action("Close Accreditation Process")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Close;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 begin
    //                     //close the job
    //                     TestField(Status, Rec.Status::"2");
    //                     Job.Reset;
    //                     Job.SetRange("No.", "Job No");
    //                     if Job.FindSet then begin
    //                         Job."Research Center" := "Board Verdict";
    //                         Job."Research Program" := "Verdict Date";
    //                         Job."Research Project Area" := "Board Comments";
    //                         Job.Status := Job.Status::Completed;
    //                         Job."Ending Date" := Today;
    //                         Job.Validate("Ending Date");
    //                         Job.Modify;
    //                         //modify the accreditation process
    //                         if "Termination Reason" <> "termination reason"::"3" then begin
    //                             ProgrammeTable.Reset;
    //                             ProgrammeTable.SetRange(Service, Job."No.");
    //                             if ProgrammeTable.FindFirst then begin
    //                                 ProgrammeTable.Status := ProgrammeTable.Status::"15";
    //                                 ProgrammeTable.Modify;
    //                                 //send email
    //                                 SendEmail(Rec);
    //                             end;

    //                         end;

    //                         TestField("Verdict Date");
    //                         TestField("Board Comments");
    //                         TestField("Board Verdict");

    //                         if "Termination Reason" <> "termination reason"::"3" then
    //                             Error('Termination reason has to be--%1', "termination reason"::"3");
    //                         if "Board Verdict" = "board verdict"::"1" then
    //                             if Confirm('Are you sure you want to onboard the programme') = true then begin
    //                                 ProgrammeTable.Reset;
    //                                 ProgrammeTable.SetRange(Service, "Job No");
    //                                 ProgrammeTable.SetRange(Status, ProgrammeTable.Status::"11");
    //                                 if ProgrammeTable.FindFirst then begin

    //                                     //get No for programme
    //                                     Customer.Reset;
    //                                     Customer.SetRange("No.", ProgrammeTable.Description);
    //                                     if Customer.FindSet then begin

    //                                         Customer.TestField("Programme No. Series");
    //                                         NoSeriesMgt.InitSeries(Customer."Programme No. Series", Customer."Programme No. Series", 0D, ProgrammeNo, Customer."Programme No. Series");
    //                                     end;
    //                                     Programme.Init;
    //                                     Programme.Code := ProgrammeNo;
    //                                     Programme."Institution Code" := ProgrammeTable.Description;
    //                                     Programme."Instiution Name" := ProgrammeTable.Currency;
    //                                     Programme."Date Created" := Today;
    //                                     Programme."Accreditation Status" := Programme."accreditation status"::"1";
    //                                     Programme."Program Level" := ProgrammeTable."Resource No.";
    //                                     Programme.Description := ProgrammeTable."Applies To New";
    //                                     Programme."External Document No." := ProgrammeTable.Service;
    //                                     Programme."Time Created" := Time;
    //                                     Programme."Program Domain" := ProgrammeTable.Blocked;
    //                                     Programme."Programme Duration" := ProgrammeTable."Programme Duration";
    //                                     Programme."Date of Submission" := ProgrammeTable."Date Created";
    //                                     if Programme.Insert(true) then

    //                                         //send E-Certificate

    //                                         SMTPMailSet.Get;
    //                                     Notification1.CreateMessage('Commision For University Education', SMTPMailSet."Email Sender Address", Customer."E-Mail", 'SUCCESSS-ACCREDITATION',
    //                                       'Dear ' + Customer.Name + ',<BR><BR>' +
    //                                       ' Your involvement in ' + UpperCase(Programme.Description) + ' has been successfully processed.<BR>' +
    //                                       '' + '<BR>' + '<BR>' + 'Attached find the E-Certificate', true);
    //                                     Notification1.AppendToBody(
    //                                    '<BR><BR>Kind Regards,' +
    //                                    '<BR><BR>For any Information or questions, Please Contact' + '<BR>Information and Communication Department<BR>' +
    //                                    CompInfo.Name + '<BR>' +
    //                                    CompInfo.Address + '<BR>' +
    //                                    CompInfo."Address 2" + '<BR>' +
    //                                    CompInfo."Phone No." + '<BR>' +
    //                                    CompInfo.City);
    //                                     FileDirectory := 'D:\Insitution Documents\ECert_' + Programme.Description + '.pdf';
    //                                     //Report.SaveAsPdf(51154, FileDirectory, ProgrammeTable);
    //                                     Notification1.AddAttachment(FileDirectory, FileDirectory);
    //                                     Notification1.AddBCC(SMTPMailSet."Email Sender Address");
    //                                     Notification1.Send;
    //                                     Message('The notification and E-certificate was successfully sent');
    //                                 end;
    //                             end;
    //                         ProgrammeTable.Reset;
    //                         ProgrammeTable.SetRange(Service, "Job No");
    //                         if ProgrammeTable.FindSet then begin
    //                             ProgrammeTable.Status := ProgrammeTable.Status::"6";
    //                             ProgrammeTable.Modify;
    //                         end;



    //                         Message('Accreditation process closed succesfully');
    //                         Posted := true;
    //                         "Posted By" := UserId;
    //                         "Posted Date" := Today;
    //                         Modify;

    //                     end
    //                 end;
    //             }
    //             action("Add Programme")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Add;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 Visible = false;

    //                 trigger OnAction()
    //                 begin
    //                     TestField("Verdict Date");
    //                     TestField("Board Comments");
    //                     TestField("Board Verdict");

    //                     if "Termination Reason" <> "termination reason"::"3" then
    //                         Error('Termination reason has to be--%1', "termination reason"::"3");
    //                     if "Board Verdict" = "board verdict"::"1" then
    //                         ProgrammeTable.Reset;
    //                     ProgrammeTable.SetRange(Service, "Job No");
    //                     ProgrammeTable.SetRange(Status, ProgrammeTable.Status::"11");
    //                     if ProgrammeTable.FindFirst then begin

    //                         //get No for programme
    //                         Customer.Reset;
    //                         Customer.SetRange("No.", ProgrammeTable.Description);
    //                         if Customer.FindSet then begin

    //                             Customer.TestField("Programme No. Series");
    //                             NoSeriesMgt.InitSeries(Customer."Programme No. Series", Customer."Programme No. Series", 0D, ProgrammeNo, Customer."Programme No. Series");
    //                         end;
    //                         Programme.Init;
    //                         Programme.Code := ProgrammeNo;
    //                         Programme."Institution Code" := ProgrammeTable.Description;
    //                         Programme."Instiution Name" := ProgrammeTable.Currency;
    //                         Programme."Date Created" := Today;
    //                         Programme."Accreditation Status" := Programme."accreditation status"::"1";
    //                         Programme."Program Level" := ProgrammeTable."Resource No.";
    //                         Programme.Description := ProgrammeTable."Applies To New";
    //                         Programme."External Document No." := ProgrammeTable.Service;
    //                         Programme."Time Created" := Time;
    //                         Programme."Program Domain" := ProgrammeTable.Blocked;
    //                         Programme."Programme Duration" := ProgrammeTable."Programme Duration";
    //                         Programme."Date of Submission" := ProgrammeTable."Date Created";
    //                         if Programme.Insert(true) then

    //                             //send E-Certificate

    //                             SMTPMailSet.Get;
    //                         Notification1.CreateMessage('Commision For University Education', SMTPMailSet."Email Sender Address", Customer."E-Mail", 'SUCCESSS-ACCREDITATION',
    //                           'Dear ' + Customer.Name + ',<BR><BR>' +
    //                           ' Your involvement in ' + UpperCase(Programme.Description) + ' has been successfully processed.<BR>' +
    //                           '' + '<BR>' + '<BR>' + 'Attached find the E-Certificate', true);
    //                         Notification1.AppendToBody(
    //                        '<BR><BR>Kind Regards,' +
    //                        '<BR><BR>For any Information or questions, Please Contact' + '<BR>Information and Communication Department<BR>' +
    //                        CompInfo.Name + '<BR>' +
    //                        CompInfo.Address + '<BR>' +
    //                        CompInfo."Address 2" + '<BR>' +
    //                        CompInfo."Phone No." + '<BR>' +
    //                        CompInfo.City);
    //                         FileDirectory := 'D:\Insitution Documents\ECert_' + Programme.Description + '.pdf';
    //                         //Report.SaveAsPdf(51154, FileDirectory, ProgrammeTable);
    //                         Notification1.AddAttachment(FileDirectory, FileDirectory);
    //                         Notification1.AddBCC(SMTPMailSet."Email Sender Address");
    //                         Notification1.Send;
    //                         Message('The notification and E-certificate was successfully sent');

    //                     end;
    //                     ProgrammeTable.Reset;
    //                     ProgrammeTable.SetRange(Service, "Job No");
    //                     if ProgrammeTable.FindSet then begin
    //                         ProgrammeTable.Status := ProgrammeTable.Status::"6";
    //                         ProgrammeTable.Modify;
    //                     end;
    //                     Posted := true;
    //                     "Posted By" := UserId;
    //                     "Posted Date" := Today;
    //                     Modify;
    //                 end;
    //             }
    //             action(Dimensions)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Dimensions';
    //                 Image = Dimensions;
    //                 Promoted = true;
    //                 PromotedIsBig = true;
    //                 ShortCutKey = 'Shift+Ctrl+D';

    //                 trigger OnAction()
    //                 begin
    //                     CurrPage.SaveRecord;
    //                 end;
    //             }
    //             action(Approvals)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Approvals';
    //                 Image = Approvals;
    //                 Promoted = true;
    //                 PromotedIsBig = false;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalEntries: Page "Approval Entries";
    //                 begin
    //                     //ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
    //                     ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Code);
    //                     ApprovalEntries.Run;
    //                 end;
    //             }
    //             action("Co&mments")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Co&mments';
    //                 Image = ViewComments;
    //                 RunObject = Page "Purch. Comment Sheet";
    //             }
    //         }
    //         group(ActionGroup25)
    //         {
    //             Caption = 'Release';
    //             Image = ReleaseDoc;
    //             separator(Action24)
    //             {
    //             }
    //             action(Release)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Re&lease';
    //                 Image = ReleaseDoc;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ShortCutKey = 'Ctrl+F9';

    //                 trigger OnAction()
    //                 var
    //                     //ReleasePurchDoc: Codeunit "Release Purchase Document";
    //                 begin
    //                     //ReleasePurchDoc.PerformManualRelease(Rec);
    //                     Message('');
    //                 end;
    //             }
    //             action("Re&open")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Re&open';
    //                 Image = ReOpen;

    //                 trigger OnAction()
    //                 var
    //                     //ReleasePurchDoc: Codeunit "Release Purchase Document";
    //                 begin
    //                     ////ReleasePurchDoc.PerformManualReopen(Rec);
    //                 end;
    //             }
    //             separator(Action21)
    //             {
    //             }
    //         }
    //         group("Request Approval")
    //         {
    //             Caption = 'Request Approval';
    //             action(SendApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Send A&pproval Request';
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category9;

    //                 trigger OnAction()
    //                 var
    //                     //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     if "Termination Reason" = "termination reason"::"2" then
    //                         TestField("Letter of Termination");
    //                     if "Termination Reason" = "termination reason"::"3" then
    //                         TestField("Board Verdict");
    //                     //if //ApprovalsMgmt.OnCancelProcPlanApprovalRequest(Rec) then
    //                         //ApprovalsMgmt.CheckIFPApprovalPossible(Rec);
    //                 end;
    //             }
    //             action(CancelApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Cancel Approval Re&quest';
    //                 Enabled = true;
    //                 Image = Cancel;
    //                 Promoted = true;
    //                 PromotedCategory = Category9;

    //                 trigger OnAction()
    //                 var
    //                     //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     //ApprovalsMgmt.IsIFPApprovalsWorkflowEnabled(Rec);
    //                 end;
    //             }
    //         }
    //         group(Print)
    //         {
    //             Caption = 'Print';
    //             Image = Print;
    //             action("&Print")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Print';
    //                 Ellipsis = true;
    //                 Image = Print;
    //                 Promoted = true;
    //                 PromotedCategory = Process;

    //                 trigger OnAction()
    //                 begin
    //                     Report.Run(51213, true, false, Rec);
    //                 end;
    //             }
    //         }
    //     }
    // }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     Type := Type::"1";
    // end;

    // var
    //     Programme: Record UnknownRecord51015;
    //     ProgrammeTable: Record "Acc Fee Schedules";
    //     ProgrammeNo: Code[30];
    //     Customer: Record Customer;
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    //     Job: Record Job;
    //     FileDirectory: Text[100];
    //     FileName: Text[100];
    //     CompInfo: Record "Company Information";
    //     Notification1: Codeunit "Email Message";
    //     SMTPMailSet: Record "Email Account";
    //     ServiceItem: Record "Service Item";

    // local procedure SendEmail(Header: Record UnknownRecord51237)
    // begin
    //     CompInfo.Get;
    //     SMTPMailSet.Get;
    //     if Header."Termination Reason" = Header."termination reason"::"0" then begin
    //         Notification1.CreateMessage('Commision For University Education', SMTPMailSet."Email Sender Address", Header."insitution Name", 'ACCREDITATION-TIME LAPSE',
    //         'The Vice Chancellor/Principal<BR>' + Header."insitution Name" + ',<BR><BR>' +
    //         'The evaluation process for<b> ' + UpperCase(Header."Programme  Name") + ' ' + 'of' + Header."insitution Name" + ' ' +
    //         'has been terminated by the Commission for University Education due to time lapse. During the accreditation period,' + Header."insitution Name" + ' ' +
    //          ' did not adhere to the stipulated timelines as per the provisions of the Universities Regulations. ', true);
    //         Notification1.AppendToBody(
    //                 '<BR><BR>Deputy Commission Secretary, Accreditation Division,<BR>' +
    //                 CompInfo.Name + '<BR>');
    //         Notification1.AddBCC(SMTPMailSet."Email Sender Address");
    //         Notification1.Send;
    //         Message('The notification and Documents were successfully sent');
    //     end;
    //     if Header."Termination Reason" = Header."termination reason"::"1" then begin
    //         Notification1.CreateMessage('Commision For University Education', SMTPMailSet."Email Sender Address", Header."insitution Name", 'ACCREDITATION-PLAGIARISM',
    //        'The Vice Chancellor/Principal<BR>' + Header."insitution Name" + ',<BR><BR>' +
    //        'The evaluation process for<b> ' + UpperCase(Header."Programme  Name") + ' ' + 'of' + Header."insitution Name" + ' ' +
    //        'has been terminated by the Commission for University Education due to the University’s' +
    //        ' failure to demonstrate originality of content and a unique niche in the curriculum as per the provisions of the Universities Regulations.', true);
    //         Notification1.AppendToBody(
    //                 '<BR><BR>Deputy Commission Secretary, Accreditation Division,<BR>' +
    //                 CompInfo.Name + '<BR>');
    //         Notification1.AddBCC(SMTPMailSet."Email Sender Address");
    //         Notification1.Send;
    //         Message('The notification and Documents were successfully sent');
    //     end;
    //     if Header."Termination Reason" = Header."termination reason"::"2" then begin
    //         Notification1.CreateMessage('Commision For University Education', SMTPMailSet."Email Sender Address", Header."insitution Name", 'ACCREDITATION-REQUEST FOR TERMINATION',
    //     'The Vice Chancellor/Principal<BR>' + Header."insitution Name" + ',<BR><BR>' +
    //     'The evaluation process for<b> ' + UpperCase(Header."Programme  Name") + ' ' + 'of' + Header."insitution Name" + ' ' +
    //     'has been terminated by the Commission for University Education following the request from ' + '' + Header."insitution Name" + ' ' + 'vide a letter dated' +
    //     ' ' + Format(Header."Letter of Termination", 0, '<Month Text> <Closing><Day>,<Year4>') + ' ' + 'to terminate the process.', true);
    //         Notification1.AppendToBody(
    //                 '<BR><BR>Deputy Commission Secretary, Accreditation Division,<BR>' +
    //                 CompInfo.Name + '<BR>');
    //         Notification1.AddBCC(SMTPMailSet."Email Sender Address");
    //         Notification1.Send;
    //         Message('The notification and Documents were successfully sent');
    //     end
    // end;
}

