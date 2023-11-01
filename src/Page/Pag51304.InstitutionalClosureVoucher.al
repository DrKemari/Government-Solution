#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51304 "Institutional Closure Voucher"
{
    // PageType = Card;
    // SourceTable = UnknownTable51213;

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
    //                 ToolTip = 'Specifies the value of the Code field.';
    //             }
    //             field("Job No"; "Job No")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Job No field.';
    //             }
    //             field("Job Name"; "Job Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //                 ToolTip = 'Specifies the value of the Job Name field.';
    //             }
    //             field("Application Type"; "Application Type")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Application Type field.';
    //             }
    //             field("Accreditation Reason"; "Accreditation Reason")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Accreditation Decision';
    //                 ToolTip = 'Specifies the value of the Accreditation Decision field.';
    //             }
    //             field("Board Verdict"; "Board Verdict")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Board Verdict field.';
    //                 trigger OnValidate()
    //                 begin
    //                     if "Termination Reason" <> "termination reason"::Accreditation then
    //                         Error('Termination reason has to be--%1', "termination reason"::Accreditation);
    //                 end;
    //             }
    //             field("Verdict Date"; "Verdict Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Verdict Date field.';
    //                 trigger OnValidate()
    //                 begin
    //                     if "Termination Reason" <> "termination reason"::Accreditation then
    //                         Error('Termination reason has to be--%1', "termination reason"::Accreditation);
    //                 end;
    //             }
    //             field("Board Comments"; "Board Comments")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Board Comments field.';
    //                 trigger OnValidate()
    //                 begin
    //                     if "Termination Reason" <> "termination reason"::Accreditation then
    //                         Error('Termination reason has to be--%1', "termination reason"::Accreditation);
    //                 end;
    //             }
    //             field("Created By"; "Created By")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //                 ToolTip = 'Specifies the value of the Created By field.';
    //             }
    //             field("Created On"; "Created On")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //                 ToolTip = 'Specifies the value of the Created On field.';
    //             }
    //             field(Status; Status)
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Status field.';
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
    //                 PromotedCategory = Category5;
    //                 PromotedIsBig = true;
    //                 ToolTip = 'Executes the Close Accreditation Process action.';
    //                 trigger OnAction()
    //                 begin
    //                     //close the job
    //                     TestField(Status, Status::Approved);
    //                     if Confirm('Are you sure you want to close the accreditation process for this application?') = true then begin
    //                         Job.Reset;
    //                         Job.SetRange("No.", "Job No");
    //                         if Job.FindSet then begin
    //                             Job."Board Verdict" := "Board Verdict";
    //                             Job."Board Verdict Date" := "Verdict Date";
    //                             Job."Board Verdict Description" := "Board Comments";
    //                             Job.Status := Job.Status::Completed;
    //                             Job."Ending Date" := Today;
    //                             Job.Validate("Ending Date");
    //                             Job.Modify;
    //                             //modify the accreditation process
    //                             if "Termination Reason" <> "termination reason"::Accreditation then begin
    //                                 ProgrammeTable.Reset;
    //                                 ProgrammeTable.SetRange("Accreditation No.", Job."No.");
    //                                 if ProgrammeTable.FindFirst then begin
    //                                     ProgrammeTable.Status := ProgrammeTable.Status::Completed;
    //                                     ProgrammeTable.Modify;
    //                                 end;
    //                             end;/* ELSE BEGIN
    //                             ProgrammeTable.RESET;
    //                             ProgrammeTable.SETRANGE("Accreditation No.","Job No");
    //                             IF ProgrammeTable.FINDSET THEN BEGIN
    //                             ProgrammeTable.Status:=ProgrammeTable.Status::Completed;
    //                             ProgrammeTable.MODIFY;
    //                         END;
    //                           END;*/
    //                             Message('Job closed succesfully');
    //                             Posted := true;
    //                             "Posted By" := UserId;
    //                             "Posted Date" := Today;
    //                             Modify;

    //                         end
    //                     end

    //                 end;
    //             }
    //             action("Onboard Institution")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Add;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 ToolTip = 'Executes the Onboard Institution action.';
    //                 trigger OnAction()
    //                 begin
    //                     TestField("Verdict Date");
    //                     TestField("Board Comments");
    //                     TestField("Board Verdict");
    //                     TestField("Termination Reason");

    //                     if "Termination Reason" <> "termination reason"::Accreditation then
    //                         Error('Termination reason has to be--%1', "termination reason"::Accreditation);

    //                     Message('Institution Onboarded succesfully,proceed to commit the programmes');
    //                     "Assigned Campus No." := AssignedCampusNo;
    //                     Modify(true);

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
    //                 ToolTip = 'Executes the Dimensions action.';
    //                 trigger OnAction()
    //                 begin
    //                     CurrPage.SaveRecord;
    //                 end;
    //             }
    //             action("Request Re-visit")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Recalculate;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;
    //                 PromotedIsBig = true;
    //                 ToolTip = 'Executes the Request Re-visit action.';
    //                 trigger OnAction()
    //                 begin
    //                     /*IF "Percentage Score">70.0 THEN BEGIN
    //                       ERROR('You cannot Request for Re-Visit,');
    //                       END
    //                     ELSE BEGIN
    //                     TESTFIELD(Status,Status::Approved);
    //                     IF CONFIRM('Are you sure you want to notify a re-visit to the institution?')=TRUE THEN BEGIN
    //                       SendEmail(Rec);
    //                     END;
    //                     Published:=TRUE;
    //                     Status:=Status::Completed;
    //                     //Publish lines
    //                     {Site.RESET;
    //                     Site.SETRANGE("App No.",Rec."Application No.");
    //                     IF Site.FINDSET THEN BEGIN
    //                       REPEAT
    //                         Site.Published:=TRUE;
    //                         UNTIL Site.NEXT=0;
    //                         END;}

    //                     {IDCLinesApp.RESET;
    //                     IDCLinesApp.SETRANGE("IDC Header No.","Notice No.");
    //                     IF IDCLinesApp.FINDSET THEN BEGIN
    //                       REPEAT
    //                       IDCLinesApp."Document Status":=IDCLinesApp."Document Status"::Published;
    //                       IDCLinesApp.MODIFY(TRUE);
    //                       UNTIL IDCLinesApp.NEXT=0;
    //                     END;}
    //                     MODIFY(TRUE);
    //                      END;*/

    //                 end;
    //             }
    //             action(Approvals)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Approvals';
    //                 Image = Approvals;
    //                 Promoted = true;
    //                 PromotedIsBig = false;
    //                 ToolTip = 'Executes the Approvals action.';
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
    //                 ToolTip = 'Executes the Co&mments action.';
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
    //                 ToolTip = 'Executes the Re&lease action.';
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
    //                 ToolTip = 'Executes the Re&open action.';
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
    //                 Caption = 'Send Approval Request';
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category9;
    //                 ToolTip = 'Executes the Send Approval Request action.';
    //                 trigger OnAction()
    //                 var
    //                     //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     /*//if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
    //                       //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
    //                       */
    //                     Message('');

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
    //                 ToolTip = 'Executes the Cancel Approval Re&quest action.';
    //                 trigger OnAction()
    //                 var
    //                     //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     ////ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
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
    //                 ToolTip = 'Executes the &Print action.';
    //                 trigger OnAction()
    //                 begin
    //                     //DocPrint.PrintPurchHeader(Rec);
    //                 end;
    //             }
    //         }
    //     }
    // }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     Type := Type::Institution;
    // end;

    // var
    //     ProgrammeTable: Record "Ins. Accreditation Table";
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
    //     InsAccreditationTable: Record "Ins. Accreditation Table";
    //     AccreditationSetups: Record "Proposal Documen Topic";
    //     FeeSchedules: Record "Acc Fee Schedules";
    //     CampusNo: Code[30];
    //     AssignedCampusNo: Code[30];
}

