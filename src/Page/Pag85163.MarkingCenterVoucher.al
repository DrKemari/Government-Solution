#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85163 "Marking Center Voucher"
{
    PageType = Card;
    SourceTable = "Center  Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No. field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Sitting Cycle"; Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sitting Cycle field.';
                }
                field("Marking Start Date"; Rec."Marking Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marking Start Date field.';
                }
                field("Marking End Date"; Rec."Marking End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marking End Date field.';
                }
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Marking Center Code';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Marking Center Code field.';
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Marking Center Name';
                    ToolTip = 'Specifies the value of the Marking Center Name field.';
                }
                field("Total Candidature"; Rec."Total Candidature")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Candidature field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
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
            }
            part(Control26; "Marking Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control22; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Marking Center")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Marking Center action.';
                trigger OnAction()
                begin

                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(85019, true, false, Rec);
                end;
            }
            action("Suggest Papers")
            {
                ApplicationArea = Basic;
                Image = SuggestField;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Papers action.';
                trigger OnAction()
                begin
                    Examination.SuggestMarkingPapers(Rec);
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////if //ApprovalsMgmt.CheckMarkingCenterApprovalsWorkflowEnabled(Rec)
                        //THEN   //ApprovalsMgmt.CheckReceiptApprovalsWorkflowEnabled(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.IsReceiptApprovalsWorkflowEnabled(Rec);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Marking Center";
        Rec.Description := 'Marking Center Voucher';
        ExaminationSetup.Get;
        Rec."Center Code" := ExaminationSetup."Default Marking Center";
        Rec.Validate("Center Code");
    end;

    var
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
        ExaminationSetup: Record "Examination Setup";
}

#pragma implicitwith restore

