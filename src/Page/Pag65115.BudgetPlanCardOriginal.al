#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65115 "Budget Plan Card-Original"
{
    Caption = 'Project Budget Plan Card';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Prices';
    RefreshOnActivate = true;
    SourceTable = "Project Budget Header";
    SourceTableView = where("Procurement Plan" = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Project Budget ID"; Rec."Project Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project Budget ID field.';
                }
                field("Budget Type"; Rec."Budget Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Original Budget Cost"; Rec."Original Budget Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Original Budget Cost field.';
                }
                field("Original Budget Cost (LCY)"; Rec."Original Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Original Budget Cost (LCY) field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            part(Control11; "Budget Planning Lines")
            {
                SubPageLink = "Project Budget ID" = field("Project Budget ID"),
                              "Job No." = field("Project ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Job")
            {
                Caption = '&Job';
                Image = Job;
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::Open);//status must be open.
                        /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                         //if //ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                          //ApprovalsMgmt.OnSendGFAForApproval(Rec);*/

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                        /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        //ApprovalsMgmt.OnCancelGFAApprovalRequest(Rec);*/

                    end;
                }
                separator(Action15)
                {
                }
                action("Post Budget")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Post Budget action.';
                    trigger OnAction()
                    begin
                        LineN := 0;
                        BudgetLines.Reset;
                        BudgetLines.SetRange("Project Budget ID", Rec."Project Budget ID");
                        BudgetLines.SetRange("Job No.", Rec."Project ID");
                        BudgetLines.SetRange(Transferred, false);
                        if BudgetLines.Find('-') then begin
                            repeat
                                BudgetLines.TestField("No.");
                                LineN := FnGetLastLineNo();
                                JobPlanningLines.Init;
                                JobPlanningLines."Line No." := LineN + 1000;
                                JobPlanningLines."Job No." := BudgetLines."Job No.";
                                JobPlanningLines."Job Task No." := BudgetLines."Job Task No.";
                                JobPlanningLines.Type := BudgetLines.Type;
                                JobPlanningLines."No." := BudgetLines."No.";
                                JobPlanningLines.Validate(JobPlanningLines."No.");
                                JobPlanningLines."Document No." := Rec."Project Budget ID";
                                JobPlanningLines."Planning Date" := BudgetLines."Planning Date";
                                JobPlanningLines.Quantity := BudgetLines.Quantity;
                                JobPlanningLines.Validate(JobPlanningLines.Quantity);
                                JobPlanningLines."Unit Cost" := BudgetLines."Unit Cost (LCY)";
                                JobPlanningLines.Validate("Unit Cost");
                                JobPlanningLines."Job Budget Templates" := BudgetLines."Job Budget Templates";
                                JobPlanningLines."Budget Type" := BudgetLines."Budget Type";
                                JobPlanningLines."Directorate Code" := BudgetLines."Directorate Code";
                                JobPlanningLines."Department Code" := BudgetLines."Department Code";
                                JobPlanningLines.Division := BudgetLines.Division;
                                JobPlanningLines.Insert(true);
                            //BudgetLines.Transferred:=TRUE;
                            until BudgetLines.Next = 0;
                        end;

                        ProcurementHeader.Reset;
                        ProcurementHeader.SetRange("Financial Year Code", Rec."Financial Year Code");
                        if ProcurementHeader.Find('-') then begin
                            BudgetLines.Reset;
                            BudgetLines.SetRange("Project Budget ID", Rec."Project Budget ID");
                            BudgetLines.SetRange("Job No.", Rec."Project ID");
                            BudgetLines.SetRange(Transferred, false);
                            if BudgetLines.Find('-') then begin
                                repeat
                                    // LineN:='Project_'+FORMAT(FnGetLastLineNo());
                                    ProcurementLine.Init;
                                    ProcurementLine."Plan Year" := ProcurementHeader.No;
                                    ProcurementLine."Plan Item No" := Rec."Project ID" + IncStr(BudgetLines."Job Task No.");
                                    ProcurementLine.Type := BudgetLines.Type;
                                    ProcurementLine."Procurement Type" := ProcurementLine."procurement type"::Works;
                                    ProcurementLine."Unit of Measure" := 'UNIT';
                                    ProcurementLine."No." := BudgetLines."No.";
                                    ProcurementLine."Item Description" := BudgetLines."Job Budget Templates";
                                    ProcurementLine.Quantity := BudgetLines.Quantity;
                                    ProcurementLine."Unit Cost" := BudgetLines."Unit Cost";
                                    ProcurementLine."Estimated Cost" := BudgetLines."Total Cost (LCY)";
                                    ProcurementLine."Directorate Code" := BudgetLines."Directorate Code";
                                    ProcurementLine."Department Code" := BudgetLines."Department Code";
                                    ProcurementLine."Job ID" := BudgetLines."Job No.";
                                    ProcurementLine."Job Task No." := BudgetLines."Job Task No.";
                                    ProcurementLine."Source of Funds" := 'LIDA';
                                    ProcurementLine.Insert(true);

                                    LineN := FnGetLastPLineNo();
                                    ProcurementEntry.Init;
                                    ProcurementEntry."Budget Name" := ProcurementHeader.No;
                                    ProcurementEntry."Procurement Item" := Rec."Project ID" + IncStr(BudgetLines."Job Task No.");
                                    ProcurementEntry."Entry No." := LineN + 1;
                                    ProcurementEntry.Date := Today;
                                    ProcurementEntry."Budget Type" := ProcurementEntry."budget type"::Approved;
                                    ProcurementEntry.Description := BudgetLines."Job Budget Templates";
                                    //ProcurementEntry."Directorate Code":=BudgetLines."Directorate Code";
                                    //ProcurementEntry."Department Code":=BudgetLines."Department Code";
                                    ProcurementEntry.Quantity := BudgetLines.Quantity;
                                    ProcurementEntry."Unit Price" := BudgetLines."Unit Cost";
                                    ProcurementEntry.Amount := BudgetLines."Total Cost (LCY)";
                                    ProcurementEntry."Job ID" := BudgetLines."Job No.";
                                    ProcurementEntry."Job Task No." := BudgetLines."Job Task No.";
                                    ProcurementEntry.Insert(true);



                                until BudgetLines.Next = 0;
                            end;
                        end;

                        Message('Bugdet Posted Successfully');
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Budget Type" := Rec."budget type"::Original;
        Rec."Procurement Plan" := false;
    end;

    var
        FormatAddress: Codeunit "Format Address";
        JobSimplificationAvailable: Boolean;
        TotalBudgetCommitments: Decimal;
        AvailableFunds: Decimal;
        NoFieldVisible: Boolean;
        IsCountyVisible: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        JobPlanningLines: Record "Job Planning Line";
        BudgetHeader: Record "Project Budget Header";
        BudgetLines: Record "Project Budget Planning Line";
        ProcurementHeader: Record "Procurement Header";
        ProcurementLine: Record "Procurement Plan1";
        ProcurementEntry: Record "Procurement Plan Entry1";
        LineNumber: Integer;
        LineN: Integer;

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
    end;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
    end;


    procedure FnGetLastLineNo() LineNumber: Integer
    begin
        JobPlanningLines.Reset;
        if JobPlanningLines.FindLast then begin
            LineNumber := JobPlanningLines."Line No.";
        end;
        exit(LineNumber);
    end;


    procedure FnGetLastPLineNo() EntryNumber: Integer
    begin
        ProcurementEntry.Reset;
        if ProcurementEntry.FindLast then begin
            EntryNumber := ProcurementEntry."Entry No.";
        end;
        exit(EntryNumber);
    end;
}

#pragma implicitwith restore

