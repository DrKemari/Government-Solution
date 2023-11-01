#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85504 "Script Re-Allocation Voucher"
{
    PageType = Card;
    SourceTable = "Re-Allocation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(DocumentNo;Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(ProjectNo;Rec."Project No.")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectName;Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(SittingCycle;Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                }
                field(MarkerNo;Rec."Marker No")
                {
                    ApplicationArea = Basic;
                }
                field(MarkerName;Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                }
                field(EnvelopeSerialNo;Rec."Envelope Serial No")
                {
                    ApplicationArea = Basic;
                }
                field(NoofScripts;Rec."No. of Scripts")
                {
                    ApplicationArea = Basic;
                }
                field(CenterCode;Rec."Center Code")
                {
                    ApplicationArea = Basic;
                }
                field(CenterName;Rec."Center Name")
                {
                    ApplicationArea = Basic;
                }
                field(Examination;Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field(PaperCode;Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field(PaperName;Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(ReAllocatetoMarkerNo;Rec."Re-Allocate to Marker No")
                {
                    ApplicationArea = Basic;
                }
                field(ReAllocatetoMarkerName;Rec."Re-Allocate to Marker Name")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn;Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control21;Outlook)
            {
            }
            systempart(Control22;Notes)
            {
            }
            systempart(Control23;MyNotes)
            {
            }
            systempart(Control24;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TXT002: label 'Do you want to Submit the Details ?';
                begin
                    if Confirm(TXT002)=true then begin
                      Rec.TestField(Rec.Posted,false);
                      DispScriptEnvelopeSerials.Reset;
                      DispScriptEnvelopeSerials.SetRange("Entry No",Rec."Task Entry No");
                      DispScriptEnvelopeSerials.SetRange("Marker Code",Rec."Marker No");
                      if DispScriptEnvelopeSerials.FindSet then begin
                        DispScriptEnvelopeSerials."Marker Code":=Rec."Re-Allocate to Marker No";
                        DispScriptEnvelopeSerials."Marker Name":=Rec."Re-Allocate to Marker Name";
                        DispScriptEnvelopeSerials."Reallocated From Marker Code":=Rec."Marker No";
                        DispScriptEnvelopeSerials."Reallocated From Marker Name":=Rec."Marker Name";
                        DispScriptEnvelopeSerials."Reallocated On":=Today;
                        DispScriptEnvelopeSerials."Re-Allocated":=true;
                        DispScriptEnvelopeSerials.Modify(true);

                    end;
                    Rec.Posted:=true;
                    Rec."Posted By":=UserId;
                    Rec."Posted On":=CreateDatetime(Today,Time);
                    Rec.Modify(true);
                    Message('Submitted Successfully');
                    end
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                   // ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField(Rec."Approval Status",Rec."approval status"::Open);

                      Rec."Approval Status":=Rec."approval status"::Released;
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

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Approval Status",Rec."approval status"::"Pending Approval");//status must be open.
                    /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    ApprovalsMgmt.""(Rec);*/
                     Rec."Approval Status":=Rec."approval status"::Open;
                     Rec.Modify;
                       Message('Document has been Re-Opened');

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type":=Rec."document type"::"Script Re-allocation";
    end;

    var
        DispScriptEnvelopeSerials: Record "Disp Script Envelope Serials";
}
