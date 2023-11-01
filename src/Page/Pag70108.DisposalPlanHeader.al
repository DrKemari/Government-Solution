#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70108 "Disposal Plan Header"
{
    PageType = Card;
    SourceTable = "Annual Disposal plan Header";

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
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
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
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Department Filter"; Rec."Department Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Filter field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control21; "Disposal Plan Lines")
            {
                SubPageLink = "Disposal header" = field(No);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control15; "Purchase Order Subform")
            {
                ApplicationArea = Basic;
            }
            part(Control16; "Purch. Invoice Subform")
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
        area(navigation)
        {
            group("Procurement Plan")
            {
                Caption = 'Procurement Plan';
                action("Request for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Approval';
                    Visible = true;
                    ToolTip = 'Executes the Request for Approval action.';
                    trigger OnAction()
                    begin
                        //SendForApproval() ;
                    end;
                }
                action("<Action1000000041>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        // IF ApprovalMgt.SendPrcmntPlanApprovalRequest(Rec) THEN;
                    end;
                }
                action("<Action1000000042>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalMgt.CancelPrcmntPlaApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action("Copy Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Procurement Plan';
                 //   RunObject = Report "Rejected Purchase Invoices";
                    ToolTip = 'Executes the Copy Procurement Plan action.';
                }
                action("Import Disposal Plan")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = XMLport "Import Procurement Plan";
                    ToolTip = 'Executes the Import Disposal Plan action.';
                }
                action("Update Budget Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Update Budget Entries';
                    Image = UpdateUnitCost;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Update Budget Entries action.';
                    trigger OnAction()
                    begin
                        ProcPlanItem.Reset;
                        ProcPlanItem.SetRange(ProcPlanItem."Plan Year", Rec.No);
                        //ProcPlanItem.SETRANGE(Type,ProcPlanItem.Type::"G/L Account");
                        ProcPlanItem.SetFilter(ProcPlanItem."Estimated Cost", '<>%1', 0);
                        if ProcPlanItem.Find('-') then begin

                            repeat
                                BudgetEntries.Reset;
                                BudgetEntries.SetRange("Budget Name", ProcPlanItem."Plan Year");
                                BudgetEntries.SetRange("Procurement Item", ProcPlanItem."Plan Item No");
                                //BudgetEntries.SETRANGE("G/L Account No.",ProcPlanItem."No.");
                                if BudgetEntries.FindSet then begin
                                    BudgetEntries.Date := Rec."Start Date";
                                    BudgetEntries."Budget Name" := ProcPlanItem."Plan Year";

                                    //Update G/L if Item
                                    if ProcPlanItem.Type = ProcPlanItem.Type::Item then begin

                                        if ItemRec.Get(ProcPlanItem."No.") then begin
                                            GenPostingSetup.Reset;
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Bus. Posting Group", '');
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Prod. Posting Group", ItemRec."Gen. Prod. Posting Group");
                                            if GenPostingSetup.Find('+') then
                                                BudgetEntries."G/L Account No." := GenPostingSetup."Inventory Adjmt. Account";
                                        end;
                                    end;

                                    //Update GL if FA
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"Fixed Asset" then begin
                                        FADepreciation.Reset;
                                        FADepreciation.SetRange(FADepreciation."FA No.", ProcPlanItem."No.");
                                        if FADepreciation.Find('-') then
                                            if FAPostingGp.Get(FADepreciation."FA Posting Group") then
                                                if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                                    BudgetEntries."G/L Account No." := FAPostingGp."Acquisition Cost Account";
                                    end;

                                    //Update GL if GL
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                        BudgetEntries."G/L Account No." := ProcPlanItem."No.";

                                    BudgetEntries.Description := ProcPlanItem."Item Description";
                                    BudgetEntries."Global Dimension 1 Code" := ProcPlanItem."Department Code";
                                    //BudgetEntries."Global Dimension 2 Code":=ProcPlanItem."Global Dimension 2 Code";
                                    BudgetEntries.Amount := ProcPlanItem."Estimated Cost";
                                    BudgetEntries."Procurement Item" := ProcPlanItem."Plan Item No";
                                    if BudgetEntries.Amount <> 0 then
                                        BudgetEntries.Modify(true);
                                end else begin

                                    BudgetEntries.Init;
                                    BudgetEntries."Entry No." := 0;
                                    BudgetEntries.Date := Rec."Start Date";
                                    BudgetEntries."Budget Name" := ProcPlanItem."Plan Year";
                                    BudgetEntries."G/L Account No." := ProcPlanItem."No.";
                                    BudgetEntries.Description := ProcPlanItem."Item Description";
                                    BudgetEntries."Global Dimension 1 Code" := ProcPlanItem."Department Code";
                                    // BudgetEntries."Global Dimension 2 Code":=ProcPlanItem."Global Dimension 2 Code";
                                    BudgetEntries.Amount := ProcPlanItem."Estimated Cost";
                                    BudgetEntries."Procurement Item" := ProcPlanItem."Plan Item No";

                                    //Update G/L if Item
                                    if ProcPlanItem.Type = ProcPlanItem.Type::Item then begin

                                        if ItemRec.Get(ProcPlanItem."No.") then begin
                                            GenPostingSetup.Reset;
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Bus. Posting Group", '');
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Prod. Posting Group", ItemRec."Gen. Prod. Posting Group");
                                            if GenPostingSetup.Find('+') then
                                                BudgetEntries."G/L Account No." := GenPostingSetup."Inventory Adjmt. Account";
                                        end;
                                    end;

                                    //Update GL if FA
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"Fixed Asset" then begin
                                        FADepreciation.Reset;
                                        FADepreciation.SetRange(FADepreciation."FA No.", ProcPlanItem."No.");
                                        if FADepreciation.Find('-') then
                                            if FAPostingGp.Get(FADepreciation."FA Posting Group") then
                                                if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                                    BudgetEntries."G/L Account No." := FAPostingGp."Acquisition Cost Account";
                                    end;

                                    //Update GL if GL
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                        BudgetEntries."G/L Account No." := ProcPlanItem."No.";


                                    BudgetEntries.Insert(true);
                                end;


                            until ProcPlanItem.Next = 0;

                            Message('Update Complete!');

                        end;
                    end;
                }
            }
        }
    }

    var
        ProcPlanItem: Record "Procurement Plan1";
        BudgetEntries: Record "Procurement Plan Entry1";
        GenPostingSetup: Record "General Posting Setup";
        FAPostingGp: Record "FA Posting Group";
        FADepreciation: Record "FA Depreciation Book";
        ItemRec: Record Item;
        Window: Dialog;
}

#pragma implicitwith restore

