#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69342 "Completed Staff  Requisitions"
{
    CardPageID = "Completed Staff Requisition";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Job,Functions,Employee';
    ShowFilter = true;
    SourceTable = "Vacancy  Requisitions Table";
    SourceTableView = where(Status = filter(Completed));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Manpower Plan ID"; Rec."Manpower Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manpower Plan ID field.';
                }
                field("Manpower Plan Name"; Rec."Manpower Plan Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manpower Plan Name field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 field.';
                }
                field("Global Dimension 1 Name"; Rec."Global Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Name field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 field.';
                }
                field("Global Dimension 2 Name"; Rec."Global Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Name field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
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
        }
        area(factboxes)
        {
            systempart(Control1102755008; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    var
        HREmp: Record Employee;
        HREmailParameters: Record "Hr E-Mail Parameters";
        SMTP: Codeunit "Email Message";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition";
        ApprovalEntries: Page "Approval Entries";
        HREmpReq: Record "Employee Requisitions";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;


    procedure TESTFIELDS()
    begin
    end;
}

#pragma implicitwith restore

