#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Planning Card (ID 69160).
/// </summary>
#pragma implicitwith disable
Page 69160 "Planning Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Job Advert Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                }
                // field("Category Code"; "Category Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Category Description"; "Category Description")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Cadre Code"; "Cadre Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Cadre Description"; "Cadre Description")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("No to be Trained"; "No to be Trained")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                // field("Total Cost"; "Total Cost")
                // {
                //     ApplicationArea = Basic;
                // }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Applications End Time"; Rec."Applications End Time")
                {
                    ApplicationArea = Basic;
                }
                // field("Qualification Description"; "Qualification Description")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Applications End Date"; Rec."Applications End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Applications Start Date"; Rec."Applications Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Company Profile"; Rec."Company Profile")
                {
                    ApplicationArea = Basic;
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                }
                // field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Responsibility Center"; "Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Test; Rec.Test)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Committee Resolution")
            {
                Editable = false;
                // field(Committee; Committee)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Committee Name"; "Committee Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Prioritized Training"; "Prioritized Training")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                }
                field("test 2"; Rec."test 2")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Planning)
            {
                // field("Type of Training"; "Type of Training")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Training Dates"; "Training Dates")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000020; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000021; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000022; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("&Plan")
                {
                    ApplicationArea = Basic;
                    Caption = '&Plan';
                    Image = StepInto;
                    Promoted = true;
                    PromotedCategory = Category4;

                    // trigger OnAction()
                    // begin
                    //     if Confirm('Are you sure you want to plan for the Training Need No. ' + Code + ' ?') = true then begin
                    //         "Planned By" := UserId;
                    //         Planned := true;
                    //         "Date Planned" := Today;
                    //         "Time Planned" := Time;
                    //         Message('Training need :: %1 :: has been Planned', "Requisition No.");
                    //         Modify;
                    //     end;
                    // end;
                }
            }
        }
        area(processing)
        {
            group(ActionGroup22)
            {
                Caption = '&Functions';
                action("Training Costs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Costs';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Training Cost";
                    RunPageLink = "Training ID" = field(Code);
                    Visible = false;
                }
                action("Page HR Training Participants List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Participants';
                    RunObject = Page "Training Participants List";
                    RunPageLink = "Training Code" = field(Code);
                }
                action("Training Bonding Conditions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Bonding Conditions';
                    Image = BOM;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Training App Participants List";
                    RunPageLink = "Global Dimension 1 Code" = field(Code);
                    Visible = false;
                }
            }
            group(Functions)
            {
                Caption = 'Functions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation","Overdraft ",BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit;
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := Documenttype::HRNeed;
                        ApprovalEntries.Setfilters(Database::"Job Advert Header", DocumentType, Rec.Code);
                        ApprovalEntries.Run;
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if Confirm('Send Approval Request?', true) = false then exit;
                        //AppMgmt.;
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then exit;
                        //AppMgmt.CancelNeedRequest(Rec,TRUE,TRUE);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
    end;

    var
        EnableField: Boolean;
        HRTrainingBondingCond: Record "Training Participants";
        AppMgmt: Codeunit "Approvals Mgmt.";
        FieldEditable: Boolean;


    procedure UpdateControls()
    begin
       // if "Budget Controlled" then begin
            EnableField := true;
        //end else begin
            EnableField := false;
        //    "G/L Account" := '';
          //  "Expense Code" := '';
        end;
  //  end;
}

#pragma implicitwith restore

