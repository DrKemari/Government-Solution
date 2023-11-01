#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69312 "Approved Training Needs Header"
{
    PageType = Card;
    SourceTable = "Training Courses Needs";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Code field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Course Description field.';
                }
                field("Training Need Code"; Rec."Training Need Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Training Need Code field.';
                }
                field("Training Need Description"; Rec."Training Need Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Training Need Description field.';
                }
                // field(Status; Status)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Status field.';
                // }
                // field(Blocked; Blocked)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Blocked field.';
                // }
                // field("Created By"; "Created By")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Created By field.';
                // }
                // field("Created On"; "Created On")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Created On field.';
                // }
                // field("No. of Needs"; "No. of Needs")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the No. of Needs field.';
                // }
            }
            part(Control13; "Training Needs Lines")
            {
                //  SubPageLink = "Training Header No." = field("Entry No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        Report.Run(69122, true, true, Rec);
                    end;
                }
                action("&Send Approval &Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval &Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Send Approval &Request action.';
                    trigger OnAction()
                    begin
                        Report.Run(69122, true, true, Rec);
                    end;
                }
                action("&Cancel Approval request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Cancel Approval request action.';
                    trigger OnAction()
                    begin
                        Report.Run(69122, true, true, Rec);
                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange("Entry No.", Rec."Entry No.");
                        Report.Run(69302, true, true, Rec);
                    end;
                }
                separator(Action14)
                {
                }
                group(ActionGroup21)
                {
                    action("Import Needs")
                    {
                        ApplicationArea = Basic;
                        Image = Import;
                        Promoted = true;
                        PromotedIsBig = true;
                        // RunObject = XMLport UnknownXMLport69300;
                        ToolTip = 'Executes the Import Needs action.';
                        trigger OnAction()
                        begin
                            /*ImportTrainingNeeds.GetRec(Rec);
                            ImportTrainingNeeds.RUN();*/

                        end;
                    }
                }
            }
        }
    }
}

#pragma implicitwith restore

