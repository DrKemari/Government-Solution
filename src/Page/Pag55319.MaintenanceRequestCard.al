#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55319 "Maintenance Request Card"
{
    PageType = Card;
    SourceTable = "Maintenance Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created field.';
                }
                field("Fixed Asset No"; Rec."Fixed Asset No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fixed Asset No field.';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Type field.';
                }
                field("Maintained On"; Rec."Maintained On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintained On field.';
                }
                field("Maintained By"; Rec."Maintained By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintained By field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Next Maintenance Date"; Rec."Next Maintenance Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Maintenance Date field.';
                }
            }
            group("Assignment Details")
            {
                Caption = 'Assignment Details';
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Assigned To Employee No"; Rec."Assigned To Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To Employee No field.';
                }
                field("Assigned To Employee Name"; Rec."Assigned To Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To Employee Name field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";

                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin

                    VarVariant := Rec;
                    IF ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                end;
            }

            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalsMgt: Codeunit "Approvals Mgmt.";
                begin

                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Enabled = Rec."Document Status" = Rec."Document Status"::Open;
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Submit action.';
                trigger OnAction()
                begin
                    Rec.TestField("Document Status", Rec."document status"::Open);
                    if Confirm('Are You sure you want to submit the request?', true) then begin
                        Rec."Document Status" := Rec."document status"::Submitted;
                        Message('Submitted Successfully');
                    end;
                end;
            }
            action(Assign)
            {
                ApplicationArea = Basic;
                Enabled = Rec."Document Status" = Rec."Document Status"::Submitted;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Assign action.';
                trigger OnAction()
                begin
                    Rec.TestField("Document Status", Rec."document status"::Submitted);
                    if Confirm('Are You sure you want to Assign the request?', true) then begin
                        Rec."Document Status" := Rec."document status"::Assigned;
                        Message('Assigned Successfully');
                    end;
                end;
            }
            action(Close)
            {
                ApplicationArea = Basic;
                Enabled = Rec."Document Status" = Rec."Document Status"::Assigned;
                Image = Campaign;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Close action.';
                trigger OnAction()
                begin
                    Rec.TestField("Document Status", Rec."document status"::Assigned);
                    if Confirm('Are You sure you want to Close the request?', true) then begin
                        Rec."Document Status" := Rec."document status"::Closed;
                        Message('Closed Successfully');
                    end;
                end;
            }
        }
    }
}

#pragma implicitwith restore

