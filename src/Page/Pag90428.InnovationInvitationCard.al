#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90428 "Innovation Invitation Card"
{
    PageType = Card;
    SourceTable = "Innovation Solicitation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Innovation Category"; Rec."Innovation Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Innovation Category field.';
                }
                field("Innovation Rating Template ID"; Rec."Innovation Rating Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Innovation Rating Template ID field.';
                }
                field("Innovation Lead"; Rec."Innovation Lead")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Innovation Lead field.';
                }
                field("Lead Name"; Rec."Lead Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Innovation Lead Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Innovation Lead Name field.';
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field("Idea Submission Start Date"; Rec."Idea Submission Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idea Submission Start Date field.';
                }
                field("Idea Submission End Date"; Rec."Idea Submission End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idea Submission End Date field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
            }
            group(Statistics)
            {
                field("No. of Innovation Ideas"; Rec."No. of Innovation Ideas")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innovation Ideas field.';
                }
                field("No. of Innov Comm Appointments"; Rec."No. of Innov Comm Appointments")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innov Comm Appointments field.';
                }
                field("No. of Innovation Rewards"; Rec."No. of Innovation Rewards")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innovation Rewards field.';
                }
                field("No. of Innov Evaluations"; Rec."No. of Innov Evaluations")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innov Evaluations field.';
                }
                field("No. of Innovation Projects"; Rec."No. of Innovation Projects")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innovation Projects field.';
                }
            }
            part(Control23; "Innovation Solicitation Lines")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Publish1)
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Publish1 action.';
            }
            separator(Action33)
            {
            }
            action(Publish)
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Publish action.';
                trigger OnAction()
                begin
                    Rec.Published := true;
                    Rec.Modify;
                    Message('Invitation Response %1 Successfully', Rec."Document No");
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
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
                    Rec.TestField(Status, Rec.Status::Open);

                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                    Message('Document has been approved Automatically');
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
                    Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                                                                          /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                          //ApprovalsMgmt.""(Rec);*/
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                    Message('Document has been Re-Opened');

                end;
            }
            separator(Action29)
            {
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
               // RunObject = Report "Innovation Invitation  Report";
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");
                    //REPORT.RUN(80024,TRUE,TRUE,Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Innovation Invitation";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Innovation Invitation";
    end;
}

#pragma implicitwith restore

