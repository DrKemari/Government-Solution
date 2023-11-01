#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57093 "Imprest Memo Surrender-P"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = const(Released),
                            Posted = const(true),
                            "Document Type" = const("Imprest Surr Memo"),
                            Surrendered = const(true));

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Imprest Memo Doc. No."; Rec."Imprest Memo Doc. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Memo Doc. No. field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the ObjText field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Objective);
                        Rec.Objective.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec.Objective);
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec.Objective.CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("Terms of Reference"; TORText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the TORText field.';
                    trigger OnValidate()
                    begin

                        Rec.CalcFields("Terms of Reference");
                        Rec."Terms of Reference".CreateInstream(Instr);
                        TOR.Read(Instr);

                        if TORText <> Format(TOR) then begin
                            Clear(Rec."Terms of Reference");
                            Clear(TOR);
                            TOR.AddText(TORText);
                            Rec."Terms of Reference".CreateOutstream(OutStr);
                            TOR.Write(OutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor field.';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor Name field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Code:';
                    ToolTip = 'Specifies the value of the Destination Code: field.';
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Destination Name field.';
                }
                field("Total Subsistence Allowance"; Rec."Total Subsistence Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Subsistence Allowance field.';
                }
                field("Total Fuel Costs"; Rec."Total Fuel Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Fuel Costs field.';
                }
                field("Total Maintenance Costs"; Rec."Total Maintenance Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Maintenance Costs field.';
                }
                field("Total Casuals Cost"; Rec."Total Casuals Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Casuals Cost field.';
                }
                field("Total Other Costs"; Rec."Total Other Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Other Costs field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit  Name field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division Name field.';
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Project Budget field.';
                }
                field("Actual Project Costs"; Rec."Actual Project Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Project Costs field.';
                }
                field("PO Commitments"; Rec."PO Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Order Commitments field.';
                }
                field("Store Requisition Commitments"; Rec."Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Store Requisition(S11) Commitments field.';
                }
                field("Imprest Application Commitment"; Rec."Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Applications Commitments field.';
                }
                field("Total Budget Commitments"; Rec."Total Budget Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget Commitments field.';
                }
            }
            part(Control1000000020; "Project Surrender Team")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Person);
                ApplicationArea = Basic;
            }
            part("Fuel/Maintenance"; "Div Schedule  Per Amount List")
            {
                Editable = not OpenApprovalEntriesExist;
               // SubPageLink = "Entry No." = field("No."),
                //              tets = const('1');
                ApplicationArea = Basic;
            }
            part(Control1000000021; "Execution Surrender Plan")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                ApplicationArea = Basic;
            }
            part(Control1000000022; "Dividend List")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                ApplicationArea = Basic;
            }
            part(Control1000000023; "Dividend Schedule header")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000017; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000018; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000019; Links)
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
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                begin
                    //Daudi
                    //check if the requester is part of the team
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."No.", Rec.Requestor);
                    if ProjectTeam.FindFirst = false then
                        Error(Text001);

                    //if //ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnSendImpMemoForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelImpMemoApprovalRequest(Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Enabled = Show;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    PaymentPost.PostImprestMemoSurr(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    //Ushindi changes

                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57010, true, true, Rec);
                    Rec.Reset;
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
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    ApprovalEntries.Setfilters(Database::"Imprest Memo", 6, Rec."No.");
                    ApprovalEntries.Run;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
        Rec.CalcFields("Terms of Reference", Objective);
        Rec."Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);


        Rec.Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Imprest Surr Memo";
    end;

    trigger OnOpenPage()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        Show: Boolean;
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        ProjectTeam: Record "Project Members";
        Text001: label 'The Requestor Must Be Part Of the Project  Team on The Memo';

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

