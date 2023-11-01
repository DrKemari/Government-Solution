#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69111 "Welfare Contribution Header"
{
    PageType = Card;
    SourceTable = "Hr Welfare Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Contribution No"; Rec."Welfare No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                }
                field("Raisee Name"; Rec."Raisee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control16; "Welfare Lines")
            {
                SubPageLink = "Welfare Header No." = field("Welfare No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Import Contributions")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                // trigger OnAction()
                // begin
                //     SetRange("Welfare No.", "Welfare No.");
                //     WelfareImport.GetVariables(Rec);
                //     WelfareImport.Run();
                // end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+D';
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Rec."Welfare No.");
                    ApprovalEntries.Run;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    /*//if //ApprovalsMgmt.CheckWelfareBenefitApprovalPossible(Rec) THEN
                      //ApprovalsMgmt.OnCancelDebitNoteApprovalRequest(Rec);*/

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

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ////ApprovalsMgmt.OnCancelBenefitForApproval(Rec);
                end;
            }
            action("Co&mments")
            {
                ApplicationArea = Basic;
                Caption = 'Co&mments';
                Image = ViewComments;
                RunObject = Page "Purch. Comment Sheet";
            }
        }
        //Codeunit "Release Purchase Document"Codeunit "Release Purchase Document"                    ReportXmlPort ""Welfare ;""

    }
}
#pragma implicitwith restore
