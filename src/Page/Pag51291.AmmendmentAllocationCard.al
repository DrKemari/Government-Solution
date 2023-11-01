#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51291 "Ammendment Allocation Card"
{
    PageType = Card;
    SourceTable = "Proposal Document Sub-Topic";

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
                // field("Accreditation No."; "Accreditation No.")
                // {
                //     ApplicationArea = Basic;
                //     Enabled = false;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Accreditation No. field.';
                // }
                field("Topic Code"; Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Topic Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }

                //             field("Appointment Date"; "Appointment Date")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Commissioning Date';
                //                 ToolTip = 'Specifies the value of the Commissioning Date field.';
                //             }
                //             field("No. of Days"; "No. of Days")
                //             {
                //                 ApplicationArea = Basic;
                //                 ToolTip = 'Specifies the value of the No. of Days field.';
                //             }
                //             field("Required No. of Resources"; "Required No. of Resources")
                //             {
                //                 ApplicationArea = Basic;
                //                 ToolTip = 'Specifies the value of the Required No. of Resources field.';
                //             }
                //             field("Available No. of Resources"; "Available No. of Resources")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //                 ToolTip = 'Specifies the value of the Available No. of Resources field.';
                //             }
                //             field("Start Date"; "Start Date")
                //             {
                //                 ApplicationArea = Basic;
                //                 ToolTip = 'Specifies the value of the Start Date field.';
                //             }
                //             field("Tentative End Date"; "Tentative End Date")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Expected Submission Date';
                //                 Editable = false;
                //                 ToolTip = 'Specifies the value of the Expected Submission Date field.';
                //             }
                //             field(Chapter; Chapter)
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //                 ToolTip = 'Specifies the value of the Chapter field.';
                //             }
                //             field("Created On"; "Created On")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //                 ToolTip = 'Specifies the value of the Created On field.';
                //             }
                //             field(test; test)
                //             {
                //                 ApplicationArea = Basic;
                //                 ToolTip = 'Specifies the value of the test field.';
                //             }
                //         }
                //         part(Control8; "Replacement  Lines")
                //         {
                //             SubPageLink = Published = field(Code),
                //                           "Inst Application No." = field("Topic Code");
                //             ApplicationArea = Basic;
                //         }
                //     }
                // }

                // actions
                // {
                //     area(creation)
                //     {
                //         action("Invite Reviewers")
                //         {
                //             ApplicationArea = Basic;
                //             Image = Email;
                //             Promoted = true;
                //             PromotedCategory = Process;
                //             PromotedIsBig = true;
                //             ToolTip = 'Executes the Invite Reviewers action.';
                //             trigger OnAction()
                //             begin
                //                 SendResourcesDocuments.InvitationEmail(Rec);
                //             end;
                //         }
                //         action("Assign Reviewers")
                //         {
                //             ApplicationArea = Basic;
                //             Caption = 'Assign Peer Reviewers';
                //             Image = AdjustEntries;
                //             Promoted = true;
                //             PromotedCategory = Process;
                //             PromotedIsBig = true;
                //             ToolTip = 'Executes the Assign Peer Reviewers action.';
                //             trigger OnAction()
                //             begin
                //                 TestField(test, Test::"2");
                //                 TestField(Posted, false);
                //                 TestField("Start Date");
                //                 TestField("Tentative End Date");
                //                 ResourceLines.Reset;
                //                 ResourceLines.SetRange(Published, Rec.Code);
                //                 if ResourceLines.FindSet then begin
                //                     repeat
                //                         ResourceAllocationLines.Reset;
                //                         ResourceAllocationLines.SetRange("User Category", ResourceLines."User Category");
                //                         ResourceAllocationLines.SetRange(Published, ResourceLines.Published);
                //                         ResourceAllocationLines.SetRange(Confirmed, true);
                //                         if ResourceAllocationLines.FindFirst then begin
                //                             //find the entry and replace
                //                             JobPlanningLines.Reset;
                //                             JobPlanningLines.SetRange("Job No.", ResourceAllocationLines."Inst Application No.");
                //                             JobPlanningLines.SetRange("Job Task No.", ResourceAllocationLines."User ID");
                //                             JobPlanningLines.SetRange("No.", ResourceAllocationLines."User Category");
                //                             if JobPlanningLines.FindFirst then begin
                //                                 JobPlanningLines."No." := ResourceAllocationLines."Replacement Account No";
                //                                 JobPlanningLines.Validate("No.");
                //                                 JobPlanningLines."Planning Date" := "Start Date";
                //                                 JobPlanningLines."Planned Delivery Date" := "Tentative End Date";
                //                                 JobPlanningLines."Document No." := Code;
                //                                 JobPlanningLines.Quantity := 1;
                //                                 JobPlanningLines.Validate("Work Type Code", ResourceLines."No Series");
                //                                 JobPlanningLines.Modify(true);
                //                             end;

                //                             ResourceLines.Comments := ResourceLines.Comments::"3";
                //                             test := Test::"3";
                //                         end;
                //                     until ResourceAllocationLines.Next = 0;
                //                     Posted := true;
                //                     test := Test::"3";
                //                     "Posted By" := UserId;
                //                     "Posted Date" := Today;
                //                     Message('Resources to the project %1, has been replaced by -%2', ResourceLines."User Category", ResourceLines."Replacement Account No");
                //                 end
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
                //             ToolTip = 'Executes the Send Documents action.';
                //             trigger OnAction()
                //             var
                //                 Customer: Text;
                //             begin
                //                 SendResourcesDocuments.CommisioningEmail(Rec);
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
                //                 ToolTip = 'Executes the Send A&pproval Request action.';
                //                 trigger OnAction()
                //                 begin

                //                     //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
                //                         //ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
                //                 end;
                //             }
                //             action(CancelApprovalRequest)
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Cancel Approval Re&quest';
                //                 Image = Cancel;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;
                //                 ToolTip = 'Executes the Cancel Approval Re&quest action.';
                //                 trigger OnAction()
                //                 begin
                //                     TestField(test, Test::"1");//status must be open.
                //                     //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);
                //                 end;
                //             }
                //             separator(Action19)
                //             {
                //             }
                //         }
                //     }
                // }

                // trigger OnNewRecord(BelowxRec: Boolean)
                // begin
                //     Type := Type::"1";
                // end;

                // var
                //     ResourceLines: Record "Site Inspection Comment";
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
                //     ResourceAllocationLines: Record "Site Inspection Comment";
                //     SendResourcesDocuments: Report NotifyResources;
            }
        }
    }
}
#pragma implicitwith restore
