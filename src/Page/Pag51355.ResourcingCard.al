#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51355 "Resourcing Card"
{
    // SourceTable = UnknownTable51263;

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
    //             field("Accreditation No."; "Accreditation No.")
    //             {
    //                 ApplicationArea = Basic;
    //                 Enabled = false;
    //                 Visible = false;
    //             }
    //             field("Required No. of Resources"; "Required No. of Resources")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Available No. of Resources"; "Available No. of Resources")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("No. of Days"; "No. of Days")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Start Date"; "Start Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Tentative End Date"; "Tentative End Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Expected Submission Date';
    //                 Editable = true;
    //             }
    //             field("Meeting Link"; "Meeting Link")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Added when  the meeting is online';
    //             }
    //             field("Appointment Date"; "Appointment Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Commissioning Date';
    //             }
    //             field("Created By"; "Created By")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Created On"; "Created On")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field(Status; Status)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //         }
    //         part(Control1; "Resource Project Allocation")
    //         {
    //             SubPageLink = "Resource Card No." = field(Code);
    //             ApplicationArea = Basic;
    //         }
    //     }
    // }

    // actions
    // {
    //     area(creation)
    //     {
    //         action("Invite Resources")
    //         {
    //             ApplicationArea = Basic;
    //             Image = Email;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 //TESTFIELD(Status,Status::Approved);

    //                 SendResourcesDocuments.InvitationEmail(Rec);
    //             end;
    //         }
    //         action("Suggest Resources")
    //         {
    //             ApplicationArea = Basic;
    //             Image = SuggestCapacity;
    //             Promoted = true;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 //get initial peer reviewers
    //                 ResourceAllocationLines.Reset;
    //                 if ResourceAllocationLines.FindLast then begin
    //                     LineNo := ResourceAllocationLines.Code;
    //                 end;
    //                 ResourceLines.Reset;
    //                 ResourceLines.SetRange("Job No", "Job No");
    //                 ResourceLines.SetRange(Booked, true);//assumes the task was already completed and resources paid
    //                 ResourceLines.SetRange(Confirmed, true);
    //                 if ResourceLines.FindSet then begin
    //                     repeat
    //                         ResourceAllocationLines.Init;
    //                         ResourceAllocationLines.Code := LineNo + 1;
    //                         ResourceAllocationLines."Resource Card No." := Code;
    //                         ResourceAllocationLines."Account Type" := ResourceLines."Account Type";
    //                         ResourceAllocationLines."Account No" := ResourceLines."Account No";
    //                         ResourceAllocationLines.Validate("Account No");
    //                         LineNo += 1;
    //                         ResourceAllocationLines.Insert(true);

    //                     until ResourceLines.Next = 0;
    //                 end;
    //             end;
    //         }
    //         action("Appoint Resources")
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Notify Resources';
    //             Image = AdjustEntries;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 CalcFields("Available No. of Resources");
    //                 if "Available No. of Resources" <> "Required No. of Resources" then begin
    //                     Message('Available number of Resource Should be equal to the Required Number of Resources');
    //                 end;

    //                 if "Available No. of Resources" = "Required No. of Resources" then begin
    //                     //TESTFIELD(Status,Status::Approved);
    //                     TestField(Posted, false);
    //                     TestField("Start Date");
    //                     TestField("Tentative End Date");

    //                     JobPlanningLines.Reset;
    //                     if JobPlanningLines.FindLast then begin
    //                         LineNo := JobPlanningLines."Line No.";
    //                     end;
    //                     ResourceLines.Reset;
    //                     ResourceLines.SetRange("Resource Card No.", Code);
    //                     ResourceLines.SetRange("Job No", "Job No");
    //                     ResourceLines.SetRange(Appoint, true);
    //                     //ResourceLines.SETRANGE(Appoint,FALSE);
    //                     if ResourceLines.FindSet then begin

    //                         repeat
    //                             JobPlanningLines.Init;
    //                             JobPlanningLines."Line No." := LineNo + 1;
    //                             JobPlanningLines."Job No." := ResourceLines."Job No";
    //                             JobPlanningLines."Job Task No." := ResourceLines."Job Task Code";
    //                             JobPlanningLines.Validate(Type, ResourceLines."Account Type");
    //                             JobPlanningLines.Validate("No.", ResourceLines."Account No");
    //                             JobPlanningLines."Planning Date" := "Start Date";
    //                             JobPlanningLines."Planned Delivery Date" := "Tentative End Date";
    //                             JobPlanningLines."Document No." := Code;
    //                             JobPlanningLines.Quantity := ResourceLines.Quantity;
    //                             //JobPlanningLines."Unit Cost":=ResourceLines.Amount;
    //                             JobPlanningLines."Work Type Code" := ResourceLines."Work Type";
    //                             JobPlanningLines.Validate("Work Type Code");
    //                             JobPlanningLines.Validate(Quantity);
    //                             JobPlanningLines.Validate("Unit Cost");
    //                             JobPlanningLines.Insert(true);
    //                             ResourceLines.Status := ResourceLines.Status::Completed;
    //                             Status := Status::Completed;
    //                             LineNo := LineNo + 1;
    //                             ResourceLines.Appoint := true;
    //                             ResourceLines."Appointed On" := CurrentDatetime;
    //                             ResourceLines.Modify(true);
    //                         until ResourceLines.Next = 0;
    //                         Posted := true;
    //                         Status := Status::Completed;
    //                         "Posted By" := UserId;
    //                         "Posted Date" := Today;
    //                         SendResourcesDocuments.CommisioningEmail(Rec);
    //                         Message('Resources to the project %1, have been assigned succesfully and email notifications sent', ResourceLines."Job No");
    //                     end else
    //                         Message('There are no resources to appoint');
    //                 end;
    //             end;
    //         }
    //         action("Send Email ")
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Send Documents';
    //             Image = Certificate;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             Visible = false;

    //             trigger OnAction()
    //             var
    //                 Customer: Text;
    //             begin
    //             end;
    //         }
    //         action("Applications Attached")
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Applications Attached';
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             RunObject = Page "Applications Attached";
    //             RunPageLink = "Job No." = field("Job No");
    //         }
    //     }
    //     area(processing)
    //     {
    //         group("F&unctions")
    //         {
    //             Caption = 'F&unctions';
    //             Image = "Action";
    //             action(SendApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Send A&pproval Request';
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;

    //                 trigger OnAction()
    //                 begin
    //                     /*//if //ApprovalsMgmt.CheckAppointmentWorkflowEnabled(Rec) THEN
    //                       //ApprovalsMgmt.OnSendAppointmentForApproval(Rec);*/

    //                 end;
    //             }
    //             action(CancelApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Cancel Approval Re&quest';
    //                 Image = Cancel;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;

    //                 trigger OnAction()
    //                 begin
    //                     TestField(Status, Status::"Pending Approval");//status must be open.
    //                     ////ApprovalsMgmt.OnCancelAppointmentApprovalRequest(Rec);
    //                 end;
    //             }
    //             separator(Action18)
    //             {
    //             }
    //         }
    //         group(ActionGroup31)
    //         {
    //         }
    //         action("Notify Institution")
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Notify Institutions';
    //             Image = SendConfirmation;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             var
    //                 AccreditationApplication: Record "Accreditation Application";
    //             begin
    //                 SetRange(Code, Code);
    //                 Examination.AccreditationAssessmentVisit(Rec);
    //             end;
    //         }
    //         action("Team Distribution")
    //         {
    //             ApplicationArea = Basic;
    //             Image = "Report";
    //             Promoted = true;
    //             PromotedCategory = "Report";
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 SetRange(Code, Code);
    //                 Report.Run(51257, true, false, Rec);
    //             end;
    //         }
    //     }
    // }

    // var
    //     ResourceLines: Record "Resource Accreditation Lines";
    //     JobPlanningLines: Record "Job Planning Line";
    //     JobTaskLines: Record "Job Task";
    //     FileDirectory: Text;
    //     FileName: Text;
    //     SMTPMailSet: Record "Email Account";
    //     ServiceItem: Record "Service Item";
    //     Service: Text;
    //     Notification1: Codeunit "Email Message";
    //     objCustomer: Record Resource;
    //     CompInfo: Record "Company Information";
    //     Obj: BigText;
    //     ObjInstr: InStream;
    //     ObjOutStr: OutStream;
    //     ObjText: Text;
    //     LineNo: Integer;
    //     Accreditation: Record Customer;
    //     FileDirectory1: Text;
    //     FileName1: Text;
    //     Resource: Record Resource;
    //     FileName2: Text;
    //     //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     OpenApprovalEntriesExist: Boolean;
    //     Payments: Record Payments;
    //     SalesHeader: Record "Sales Header";
    //     ResourceTable: Record Resource;
    //     ResourceAllocationLines: Record "Resource Accreditation Lines";
    //     SendResourcesDocuments: Report NotifyResources;
    //     Editable: Boolean;
    //     AccreditationProject: Record "Accreditation Project";
    //     Examination: Codeunit Examination;
}

