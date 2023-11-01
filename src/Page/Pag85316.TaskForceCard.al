#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85316 "TaskForce Card"
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
    //             field("Job No"; "Job No")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Project No';
    //             }
    //             field("Job Name"; "Job Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Project Name';
    //                 Editable = false;
    //             }
    //             field("Resource Template ID"; "Resource Template ID")
    //             {
    //                 ApplicationArea = Basic;
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
    //                 Editable = false;
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
    //             }
    //         }
    //         part(Control1; "TaskForce Lines")
    //         {
    //             SubPageLink = "Resource Card No." = field(Code),
    //                           "Job No" = field("Job No");
    //             ApplicationArea = Basic;
    //         }
    //     }
    // }

    // actions
    // {
    //     area(creation)
    //     {
    //         action("Invite Members")
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Invite Members';
    //             Image = Email;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             Visible = false;

    //             trigger OnAction()
    //             begin
    //                 TestField(Status, Status::Approved);

    //                 //SendResourcesDocuments.InvitationEmail(Rec);
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
    //         action("Appoint Members")
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Appoint Members';
    //             Image = AdjustEntries;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             var
    //                 TXT001: label 'Appoint the defined Members?';
    //             begin
    //                 if Confirm(TXT001) = true then begin
    //                     CalcFields("Available No. of Resources");
    //                     if "Available No. of Resources" <> "Required No. of Resources" then begin
    //                         Error('Available number of Resource Should be equal to the Required Number of Resources');
    //                     end else begin
    //                         Examination.AppointTaskForce(Rec);
    //                     end
    //                 end
    //             end;
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
    //                     Message('');
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
    //                     Message('');
    //                 end;
    //             }
    //             separator(Action18)
    //             {
    //             }
    //         }
    //     }
    // }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     "Document Type" := "document type"::Development;
    // end;

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
    //     Examination: Codeunit Examination;
}

