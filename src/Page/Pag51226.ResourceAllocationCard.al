#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51226 "Resource Allocation Card"
{
    PageType = Card;
    SourceTable = "Proposal Document Sub-Topic";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Editable;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("Accreditation No."; "Accreditation No.")
                // {
                //     ApplicationArea = Basic;
                //     Enabled = false;
                //     Visible = false;
                // }
                field("Topic Code"; Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("Actual Spent"; "Actual Spent")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                // field("Required No. of Resources"; "Required No. of Resources")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Available No. of Resources"; "Available No. of Resources")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                // field("No. of Days"; "No. of Days")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Start Date"; "Start Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Tentative End Date"; "Tentative End Date")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Expected Submission Date';
                //     Editable = false;
                // }
                // field("Appointment Date"; "Appointment Date")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Commissioning Date';
                // }
                field(Chapter; Rec.Chapter)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("Created On"; "Created On")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                field(test; Rec.test)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control8; "Resource allocation Lines")
            {
                Editable = Editable;
                // SubPageLink = Published = field(Code),
                //               "Inst Application No." = field("Topic Code");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Invite Reviewers")
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //  TestField(test, Test::"2");

                    // SendResourcesDocuments.InvitationEmail(Rec);
                end;
            }
            action("Suggest Peer Reviewers")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // //get initial peer reviewers
                    // ResourceAllocationLines.Reset;
                    // if ResourceAllocationLines.FindLast then begin
                    //     LineNo := ResourceAllocationLines.Code;
                    // end;
                    // ResourceLines.Reset;
                    // ResourceLines.SetRange("Inst Application No.", "Topic Code");
                    // ResourceLines.SetRange("Assinged officer", true);//assumes the task was already completed and resources paid
                    // ResourceLines.SetRange(Confirmed, true);
                    // if ResourceLines.FindSet then begin
                    //     repeat
                    //         ResourceAllocationLines.Init;
                    //         ResourceAllocationLines.Code := LineNo + 1;
                    //         ResourceAllocationLines.Published := Code;
                    //         ResourceAllocationLines."Date Created" := ResourceLines."Date Created";
                    //         ResourceAllocationLines."User Category" := ResourceLines."User Category";
                    //         ResourceAllocationLines.Validate("User Category");
                    //         LineNo += 1;
                    //         ResourceAllocationLines.Insert(true);

                    //     until ResourceLines.Next = 0;
                    // end;
                end;
            }
            action("Appoint Reviewers")
            {
                ApplicationArea = Basic;
                Caption = 'Appoint Reviewers';
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // CalcFields("Available No. of Resources");
                    // if "Available No. of Resources" <> "Required No. of Resources" then begin
                    //     Message('Available number of Resource Should be equal to the Required Number of Resources');
                    // end;
                    // if "Available No. of Resources" = "Required No. of Resources" then begin
                    //     TestField(test, Test::"2");
                    //     TestField(Posted, false);
                    //     TestField("Start Date");
                    //     TestField("Tentative End Date");

                    //     JobPlanningLines.Reset;
                    //     if JobPlanningLines.FindLast then begin
                    //         LineNo := JobPlanningLines."Line No.";
                    //     end;
                    //     ResourceLines.Reset;
                    //     ResourceLines.SetRange(Published, Code);
                    //     ResourceLines.SetRange("Inst Application No.", "Topic Code");
                    //     ResourceLines.SetRange(Confirmed, true);
                    //     ResourceLines.SetRange(Appoint, false);
                    //     if ResourceLines.FindSet then begin

                    //         repeat
                    //             JobPlanningLines.Init;
                    //             JobPlanningLines."Line No." := LineNo + 1;
                    //             JobPlanningLines."Job No." := ResourceLines."Inst Application No.";
                    //             JobPlanningLines."Job Task No." := ResourceLines."User ID";
                    //     JobPlanningLines.Validate(Type, ResourceLines."Date Created");
                    //     JobPlanningLines.Validate("No.", ResourceLines."User Category");
                    //     JobPlanningLines."Planning Date" := "Start Date";
                    //     JobPlanningLines."Planned Delivery Date" := "Tentative End Date";
                    //     JobPlanningLines."Document No." := Code;
                    //     JobPlanningLines.Quantity := ResourceLines."Report Status";
                    //     JobPlanningLines."Unit Cost" := ResourceLines.Amount;
                    //     JobPlanningLines."Work Type Code" := ResourceLines."No Series";
                    //     JobPlanningLines.Validate("Work Type Code");
                    //     JobPlanningLines.Validate(Quantity);
                    //     JobPlanningLines.Validate("Unit Cost");
                    //     JobPlanningLines.Insert(true);
                    //     ResourceLines.Comments := ResourceLines.Comments::"3";
                    //     test := Test::"3";
                    //     LineNo := LineNo + 1;
                    //     ResourceLines.Appoint := true;
                    //     ResourceLines."Appointed On" := CurrentDatetime;
                    //     ResourceLines.Modify(true);
                    // until ResourceLines.Next = 0;
                    // Posted := true;
                    // test := Test::"3";
                    // "Posted By" := UserId;
                    //         "Posted Date" := Today;
                    //         Message('Resources to the project %1, have been assigned succesfully and email notifications sent', ResourceLines."Inst Application No.");
                    //     end else
                    //         Message('There are no resources to appoint');
                    // end;
                    // SendResourcesDocuments.CommisioningEmail(Rec);
                end;
            }
            action("Send Email ")
            {
                ApplicationArea = Basic;
                Caption = 'Send Documents';
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    Customer: Text;
                begin
                end;
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        // //if //ApprovalsMgmt.IsVendDebarmentApprovalsWorkflowEnabled(Rec) then
                        //     //ApprovalsMgmt.OnSendVendDebarmentForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        // TestField(test, Test::"1");//status must be open.
                        // //ApprovalsMgmt.OnCancelVendDebarmentApprovalRequest(Rec);
                    end;
                }
                separator(Action19)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Type := Type::"0";
    end;

    trigger OnOpenPage()
    begin
        Editable := false;
        //  if test = Test::"0" then
        Editable := true;
    end;

    var
        ResourceLines: Record "Site Inspection Comment";
        JobPlanningLines: Record "Job Planning Line";
        JobTaskLines: Record "Job Task";
        FileDirectory: Text;
        FileName: Text;
        //  SMTPMailSet: Record "Email Account";
        ServiceItem: Record "Service Item";
        Service: Text;
        // Notification1: Codeunit "Email Message";
        objCustomer: Record Resource;
        CompInfo: Record "Company Information";
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        LineNo: Integer;
        Accreditation: Record Customer;
        FileDirectory1: Text;
        FileName1: Text;
        Resource: Record Resource;
        FileName2: Text;
        // //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        Payments: Record Payments;
        SalesHeader: Record "Sales Header";
        ResourceTable: Record Resource;
        ResourceAllocationLines: Record "Site Inspection Comment";
        //SendResourcesDocuments: Report NotifyResources;
        Editable: Boolean;
}

#pragma implicitwith restore

