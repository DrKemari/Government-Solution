#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90431 "Idea Response Card"
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
                field("Idea Originator"; Rec."Idea Originator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idea Originator field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Invitation ID"; Rec."Invitation ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation ID field.';
                }
                field("Innovation Category"; Rec."Innovation Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Innovation Category field.';
                }
                field("Innovation Rating Template ID"; Rec."Innovation Rating Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Innovation Rating Template ID field.';
                }
                field("Innovation Lead"; Rec."Innovation Lead")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Innovation Lead field.';
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field("Idea Submission Start Date"; Rec."Idea Submission Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Idea Submission Start Date field.';
                }
                field("Idea Submission End Date"; Rec."Idea Submission End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Idea Submission End Date field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Portal Status"; Rec."Portal Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Portal Status field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control23; "Idea Response Lines")
            {
                Caption = 'Overview';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
            part(Control17; "Idea Response Objectives")
            {
                Caption = 'Goals & Objectives';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
            part(Control18; "Idea Response Additional Notes")
            {
                Caption = 'Summary Notes';
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
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Submit action.';
                trigger OnAction()
                begin
                    Rec."Portal Status" := Rec."portal status"::Submitted;
                    Rec.Modify;
                    Message('Idea Response %1 Successfully', Rec."Document No");
                end;
            }
            separator(Action25)
            {
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
            separator(Action20)
            {
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No", Rec."Document No");
                    Report.Run(80035, true, true, Rec)
                end;
            }
        }
        area(navigation)
        {
            group(Evaluation)
            {
                Caption = 'Evaluation';
                Image = Vendor;
            }
            action("Evaluation Entries")
            {
                ApplicationArea = Basic;
                Image = Entries;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Standard Perfomance Appraisal";
                ToolTip = 'Executes the Evaluation Entries action.';
            }
            action("Reward & Recognitions")
            {
                ApplicationArea = Basic;
                Image = AddWatch;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Standard Perfomance Appraisal";
                ToolTip = 'Executes the Reward & Recognitions action.';
            }
            action("Performance Appraisal")
            {
                ApplicationArea = Basic;
                Image = AddWatch;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Standard Perfomance Appraisal";
               // RunPageLink = "Personal Scorecard ID" = field("No. of Innov Comm Appointments");
                ToolTip = 'Executes the Performance Appraisal action.';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Idea Response";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Idea Response";
    end;
}

#pragma implicitwith restore

