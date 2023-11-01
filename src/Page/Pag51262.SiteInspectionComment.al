#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51262 "Site Inspection Comment"
{
    //     Caption = 'Technical Inspection Voucher';
    //     PageType = Card;
    //     SourceTable = UnknownTable51219;

    //     layout
    //     {
    //         area(content)
    //         {
    //             group(General)
    //             {
    //                 field("Code"; Code)
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Inst Application No."; "Inst Application No.")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Institution Application No.';
    //                 }
    //                 field("User ID"; "User ID")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field("User Name"; "User Name")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field("Date Created"; "Date Created")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field(Status; Status)
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Assinged officer"; "Assinged officer")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Assigned Officer';
    //                 }
    //                 field("Report Status"; "Report Status")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field(Comments; Comments)
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("User Category"; "User Category")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field(Published; Published)
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field(Observation; Obstxt)
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Observation';
    //                     MultiLine = true;

    //                     trigger OnValidate()
    //                     begin
    //                         CalcFields(Observation);
    //                         Observation.CreateInstream(ObjInstr);
    //                         Obj.Read(ObjInstr);


    //                         if Obstxt <> Format(Obj) then begin
    //                             Clear(Observation);
    //                             Clear(Obj);
    //                             Obj.AddText(Obstxt);
    //                             Observation.CreateOutstream(ObjOutStr);
    //                             Obj.Write(ObjOutStr);
    //                             // MODIFY;
    //                         end;
    //                     end;
    //                 }
    //                 field(Recommendation; Obstxt1)
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Recommendation';
    //                     MultiLine = true;

    //                     trigger OnValidate()
    //                     begin
    //                         CalcFields(Recommendation);
    //                         Recommendation.CreateInstream(ObjInstr1);
    //                         Obj1.Read(ObjInstr1);


    //                         if Obstxt1 <> Format(Obj1) then begin
    //                             Clear(Recommendation);
    //                             Clear(Obj1);
    //                             Obj1.AddText(Obstxt1);
    //                             Recommendation.CreateOutstream(ObjOutStr1);
    //                             Obj1.Write(ObjOutStr1);
    //                             // MODIFY;
    //                         end;
    //                     end;
    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(creation)
    //         {
    //             action("Print report")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Print;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;

    //                 trigger OnAction()
    //                 begin
    //                     SetRange(Code, Code);
    //                     Report.Run(51190, true, true, Rec);
    //                 end;
    //             }
    //             action("Request Re-Submission")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Request Re-Submission';
    //                 Image = Recalculate;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 begin
    //                     if Confirm('Are you sure you want to notify a re-visit to the institution?') = true then begin
    //                         Checker := 1;
    //                         SendEmail(Rec, Checker);
    //                     end;
    //                 end;
    //             }
    //             action("Request Peer Reviewer Payment")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Request Peer Reviewer Payment';
    //                 Image = Recalculate;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 begin
    //                     //if complete modify status to awaiting finance
    //                     //send email to institution to sanction payment
    //                     //TESTFIELD(Verdict,Verdict::"Minor Revamp");
    //                     if Confirm('Are you sure you want to complete the verification of resources for this application?') = true then begin
    //                         InsAccreditationTable.Reset;
    //                         InsAccreditationTable.SetRange("Accreditation No.", "Inst Application No.");
    //                         if InsAccreditationTable.FindFirst then begin
    //                             InsAccreditationTable.Status := InsAccreditationTable.Status::"Awaiting Board Approval";
    //                             InsAccreditationTable.Modify(true);
    //                             Checker := 2;
    //                             SendEmail(Rec, Checker);
    //                         end;
    //                     end;
    //                     //MARK ORIGINAL as wawiting finance
    //                 end;
    //             }
    //             action("Send Approval Request")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Send Approval Request';
    //                 Enabled = true;
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;

    //                 trigger OnAction()
    //                 var
    //                     Text001: label 'This request is already pending approval';
    //                 begin
    //                     /*  IF Status<>Status::Open THEN BEGIN
    //                         ERROR(Text001);
    //                       END ELSE BEGIN
    //                         IF Status=Status::Open THEN
    //                            //if //ApprovalsMgmt.CheckProgEvaluationWorkflowEnabled(Rec) THEN
    //                                  //ApprovalsMgmt.OnSendProgEvaluationForApproval(Rec);
    //                                  Status:=Status::Completed;

    //                             END*/


    //                 end;
    //             }
    //             action("Approval Request Entries")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Approvals';
    //                 Image = Approval;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalEntries: Page "Approval Entries";
    //                 begin
    //                     /*ApprovalEntries.Setfilters(DATABASE::"Programme Evaluation Header", entries."Document Type"::"Prog. Evaluation",Code);
    //                     ApprovalEntries.RUN;*/

    //                 end;
    //             }
    //             action("Cancel Approval Request")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Cancel Approval Request';
    //                 Enabled = true;
    //                 Image = Cancel;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;

    //                 trigger OnAction()
    //                 begin
    //                     /*TESTFIELD(Status,Status::Ongoing);//status must not be open.
    //                      IF UserSetup.GET(USERID) AND UserSetup."Approval Administrator" THEN
    //                             //ApprovalsMgmt.OnCancelProgEvaluationApprovalRequest(Rec)
    //                         ELSE
    //                             //ApprovalsMgmt.OnCancelProgEvaluationApprovalRequest(Rec);*/

    //                 end;
    //             }
    //             action("Assign Officer")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Assign Officer';
    //                 Enabled = true;
    //                 Image = Allocate;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;

    //                 trigger OnAction()
    //                 begin
    //                     /*TESTFIELD(Status,Status::Ongoing);//status must not be open.
    //                      IF UserSetup.GET(USERID) AND UserSetup."Approval Administrator" THEN
    //                             //ApprovalsMgmt.OnCancelProgEvaluationApprovalRequest(Rec)
    //                         ELSE
    //                             //ApprovalsMgmt.OnCancelProgEvaluationApprovalRequest(Rec);*/

    //                 end;
    //             }
    //         }
    //     }

    //     trigger OnAfterGetRecord()
    //     begin

    //         CalcFields(Observation);
    //         Observation.CreateInstream(ObjInstr);
    //         Obj.Read(ObjInstr);
    //         Obstxt := Format(Obj);

    //         CalcFields(Recommendation);
    //         Recommendation.CreateInstream(ObjInstr1);
    //         Obj1.Read(ObjInstr1);
    //         Obstxt1 := Format(Obj1);
    //     end;

    //     var
    //         Obj: BigText;
    //         ObjInstr: InStream;
    //         ObjOutStr: OutStream;
    //         Obstxt: Text;
    //         Rectxt: Text;
    //         Obj1: BigText;
    //         ObjInstr1: InStream;
    //         ObjOutStr1: OutStream;
    //         Obstxt1: Text;
    //         CompInfo: Record "Company Information";
    //         SMTPMailSet: Record "Email Account";
    //         Notification1: Codeunit "Email Message";
    //         FileDirectory: Text;
    //         fileName: Text;
    //         ScoringSetup: Record "Proposal Document Headr";
    //         EaluationVerdict: Text;
    //         Header: Record "Application Chapter";
    //         Site: Record "Application SubTopics";
    //         Verdictname: Text;
    //         InsAccreditationTable: Record "Ins. Accreditation Table";
    //         Checker: Integer;

    //     local procedure SendEmail(Header: Record UnknownRecord51219; Checker: Integer)
    //     begin
    //         /*CompInfo.GET;
    //         SMTPMailSet.GET;
    //         IF Checker=1 THEN BEGIN
    //           InsAccreditationTable.RESET;
    //           InsAccreditationTable.SETRANGE("Accreditation No.",Header."Inst Application No.");
    //           IF InsAccreditationTable.FINDFIRST THEN BEGIN
    //                Notification1.CreateMessage('Commision For University Education',SMTPMailSet."Email Sender Address",InsAccreditationTable.Email,'Technical Inspection',
    //               'Dear '+ InsAccreditationTable."Institution Name." + ',<BR><BR>'+
    //               ' The application' +' '+UPPERCASE(Header."Inst Application No.") + ' has not met the minimum requirements required for Tecnical Approval recommendation <BR>'+
    //               ''+'<BR>'+'<BR>'+'Attached Please find the report and make the recommended adjustments',TRUE);
    //               //change address to email
    //               Notification1.AppendToBody(
    //               '<BR><BR>Kind Regards,'+
    //               '<BR><BR>For any Information or questions, Please Contact'+'<BR>Institution Accreditation Department<BR>'+
    //               CompInfo.Name+'<BR>'+
    //               CompInfo.Address+'<BR>'+
    //               CompInfo."Address 2"+'<BR>'+
    //               CompInfo."Phone No."+'<BR>'+
    //               CompInfo.City);
    //               FileDirectory:='D:\Receipts\Verification_'+FORMAT(Header.Code)+'.pdf';
    //               fileName:='Verification_'+FORMAT(Header.Code)+'.pdf';
    //               //Report.SaveAsPdf(51190,FileDirectory,Header);//56231
    //               Notification1.AddAttachment(FileDirectory,FileDirectory);
    //               Notification1.AddBCC(SMTPMailSet."Email Sender Address");
    //               Notification1.Send;
    //         MESSAGE('The notification was successfully sent');
    //         END
    //         END ELSE BEGIN
    //               InsAccreditationTable.RESET;
    //                 InsAccreditationTable.SETRANGE("Accreditation No.",Header."Inst Application No.");
    //                 IF InsAccreditationTable.FINDFIRST THEN BEGIN
    //                     Notification1.CreateMessage('Commision For University Education',SMTPMailSet."Email Sender Address",InsAccreditationTable.Email,'Technical Inspection',
    //                   'Dear '+ InsAccreditationTable."Institution Name." + ',<BR><BR>'+
    //                   ' The application' +' '+UPPERCASE(Header."Inst Application No.") + ' has succesfully passed the Technical Inspection.<BR>'+
    //                   ''+'<BR>'+'<BR>'+'Attached find the verification of resources report',TRUE);
    //                   //change address to email
    //                   Notification1.AppendToBody(
    //                   '<BR><BR>Kind Regards,'+
    //                   '<BR><BR>For any Information or questions, Please Contact'+'<BR>Information and Communication Department<BR>'+
    //                   CompInfo.Name+'<BR>'+
    //                   CompInfo.Address+'<BR>'+
    //                   CompInfo."Address 2"+'<BR>'+
    //                   CompInfo."Phone No."+'<BR>'+
    //                   CompInfo.City);
    //                   FileDirectory:='D:\Receipts\Verification_'+FORMAT(Header.Code)+'.pdf';
    //                   fileName:='Verification_'+FORMAT(Header.Code)+'.pdf';
    //                   //Report.SaveAsPdf(51190,FileDirectory,Header);//56231
    //                   Notification1.AddAttachment(FileDirectory,FileDirectory);
    //                   Notification1.AddBCC(SMTPMailSet."Email Sender Address");
    //                   Notification1.Send;
    //                   MESSAGE('The notification and Documents were successfully sent');
    //           END
    //           END
    //           */

    //     end;
}

