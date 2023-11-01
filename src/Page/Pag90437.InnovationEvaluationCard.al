#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90437 "Innovation Evaluation Card"
{
    PageType = Card;
    SourceTable = "Innovation Evaluation";

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
                field("Invitation ID"; Rec."Invitation ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation ID field.';
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
                field("Innovation Lead"; Rec."Innovation Lead")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Innovation Lead field.';
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
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Evaluation Status"; Rec."Evaluation Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Status field.';
                }
            }
            part(Control15; "Innovation Evaluation Line")
            {
                SubPageLink = "Document No." = field("Document No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
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
            separator(Action17)
            {
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");
                    //REPORT.RUN(80024,TRUE,TRUE,Rec);
                end;
            }
            separator(Action22)
            {
            }
            action("Suggest Responses")
            {
                ApplicationArea = Basic;
                Image = suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Responses action.';
                trigger OnAction()
                begin
                    InnovationSolicitation.Reset;
                    InnovationSolicitation.SetRange("Invitation ID", Rec."Invitation ID");
                    InnovationSolicitation.SetRange("Document Type", InnovationSolicitation."document type"::"Idea Response");
                    if InnovationSolicitation.FindFirst then begin
                        repeat
                            InnovationEvaluationLine.Init;
                            InnovationEvaluationLine."Document No." := Rec."Document No";
                            InnovationEvaluationLine."Invitation ID" := Rec."Invitation ID";
                            InnovationEvaluationLine."Idea ID" := InnovationSolicitation."Document No";
                            InnovationEvaluationLine."Idea Originator" := InnovationSolicitation."Idea Originator";
                            InnovationEvaluationLine.Name := InnovationSolicitation.Name;
                            InnovationEvaluationLine.Description := InnovationSolicitation.Description;
                            InnovationEvaluationLine."Innovation Category" := InnovationSolicitation."Innovation Category";
                            InnovationEvaluationLine."Innovation Rating Template ID" := InnovationSolicitation."Innovation Rating Template ID";
                            InnovationEvaluationLine."Directorate ID" := InnovationSolicitation."Directorate ID";
                            InnovationEvaluationLine."Department ID" := InnovationSolicitation."Department ID";
                            InnovationEvaluationLine."Region ID" := InnovationSolicitation."Region ID";
                            InnovationEvaluationLine.Insert;

                            InnovationSolicitationLine.Reset;
                            InnovationSolicitationLine.SetRange("Document No", InnovationSolicitation."Document No");
                            if InnovationSolicitationLine.FindFirst then begin
                                repeat
                                    InnovationEvaluationGoals.Init;
                                    InnovationEvaluationGoals."Document No" := Rec."Document No";
                                    InnovationEvaluationGoals."Invitation ID" := Rec."Invitation ID";
                                    InnovationEvaluationGoals."Idea ID" := InnovationSolicitationLine."Document No";
                                    InnovationEvaluationGoals."Record Type" := InnovationSolicitationLine."Record Type";
                                    InnovationEvaluationGoals."Line No." := InnovationSolicitationLine."Line No.";
                                    InnovationEvaluationGoals.Description := InnovationSolicitationLine.Description;
                                    InnovationEvaluationGoals.Insert;
                                until InnovationSolicitationLine.Next = 0;
                            end;

                        until InnovationSolicitation.Next = 0;
                    end;
                    Message('Idea Responses populated successfully');
                end;
            }
            action("Mark As Completed")
            {
                ApplicationArea = Basic;
                Image = Check;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Mark As Completed action.';
                trigger OnAction()
                begin
                    InnovationEvaluationLine.Reset;
                    InnovationEvaluationLine.SetRange("Document No.", Rec."Document No");
                    if InnovationEvaluationLine.Find('-') then begin
                        repeat
                            InnovationEvaluationLine.TestField("Final Committee Decision");
                        until InnovationEvaluationLine.Next = 0;
                    end;

                    Rec."Evaluation Status" := Rec."evaluation status"::Completed;
                    Rec.Modify;
                    Message('Evaluation Document %1 has been marked as Completed Successfully', Rec."Document No");
                end;
            }
        }
    }

    var
        InnovationEvaluationLine: Record "Innovation Evaluation Line";
        InnovationSolicitation: Record "Innovation Solicitation";
        InnovationScoresheet: Record "Innovation Scoresheet";
        InnovationSolicitationLine: Record "Innovation Solicitation Line";
        InnovationEvaluationGoals: Record "Innovation Evaluation Goals";
}

#pragma implicitwith restore

