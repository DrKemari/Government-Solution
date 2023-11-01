#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 57008 "Workflow Email Notification"
{

    trigger OnRun()
    begin
    end;

    var
        UserSetup: Record "User Setup";
        EmployeesHR: Record Employee;
        SMTPMailSetup: Record "Email Account";
        ActiveSession: Record "Active Session";
        Body1: Text[250];
        MemberApplication: Record "Quarterly Reporting Periods";
        Body3: Text[250];
        BankAccount: Record "Bank Account";
        Vendor: Record Vendor;
        KasnebFunctions: Codeunit KasnebFunctions;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]

    procedure IanSendEmailToSubSequentApprover(var ApprovalEntry: Record "Approval Entry")
    var
        ApprovalEntryVar: array[3] of Record "Approval Entry";
        SequenceNo: Integer;
        SenderName: Text;
        SenderAddress: Text;
        Recipients: Text;
        Subject: Text;
        Body: Text;
        ReceiverName: Text;
    begin
        ApprovalEntryVar[1].Reset;
        ApprovalEntryVar[1].SetCurrentkey("Sequence No.");
        ApprovalEntryVar[1].SetRange("Document No.", ApprovalEntry."Document No.");
        ApprovalEntryVar[1].SetRange("Sequence No.", ApprovalEntry."Sequence No.");
        if ApprovalEntryVar[1].FindLast then
            SequenceNo := ApprovalEntryVar[1]."Sequence No." + 1;

        ApprovalEntryVar[2].Reset;
        ApprovalEntryVar[2].SetRange("Document No.", ApprovalEntry."Document No.");
        ApprovalEntryVar[2].SetRange("Record ID to Approve", ApprovalEntry."Record ID to Approve");
        ApprovalEntryVar[2].SetRange("Sequence No.", SequenceNo);
        if ApprovalEntryVar[2].FindSet then begin
            Recipients := '';
            SenderName := '';
            SenderAddress := '';
            Subject := '';
            Body := '';
            repeat
                if UserSetup.Get(ApprovalEntryVar[2]."Approver ID") then begin
                    Recipients := UserSetup."E-Mail";
                    ReceiverName := ApprovalEntryVar[2]."Approver ID";
                end;
                SenderName := UserId;
                Subject := 'Approval Request';
                Body := 'Dear ' + Format(ReceiverName) + ', <br><br> ' + SenderName + ' Has approved a document of type ' + Format(ApprovalEntry."Document Type")
                       + ' and has been fowarded to you for further approval <br><br>';
                /*IF MemberApplication.GET(ApprovalEntry."Document No.") THEN BEGIN
                  Body1:='<BR> Payee name: '+MemberApplication."Payee Name"+'<BR>Payment Amount '+MemberApplication."Currency Code"+' '+FORMAT(MemberApplication."Payment Amount")
                  +' Pay from account: '+MemberApplication."Payment  Account Name";
               END ELSE IF BankAccount.GET(ApprovalEntry."Document No.") THEN
                 Body1:='<BR> Bank name: '+BankAccount.Name
               ELSE IF Vendor.GET(ApprovalEntry."Document No.") THEN
                 Body1:='<BR>Vendor name: '+Vendor.Name;*/
                Body3 := '<br> This is a system generated message please do not reply to it.' +
                   '<br>Regards';
            //Function is deleted
            //KasnebFunctions.IanSendEmailWithoutAttachement(SenderName,SenderAddress,Recipients,Subject,Body+Body1+Body3);
            until ApprovalEntryVar[2].Next = 0;
        end;

    end;

    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'IanOnAfterGetApproverMemberGroups', '', false, false)]

    procedure IanSendEmailToFirstApprover(SequenceNo: Integer; ApproverId: Code[70]; ApprovalEntry: Record "Approval Entry")
    var
        ApprovalEntryVar: array[3] of Record "Approval Entry";
        SenderName: Text;
        SenderAddress: Text;
        Recipients: Text;
        Subject: Text;
        Body: Text;
        ReceiverName: Text;
        HumanResourcesSetup: Record "Human Resources Setup";
    begin
        if SequenceNo = 1 then begin
            if ApproverId = UserId then
                exit;
            if UserSetup.Get(ApproverId) then begin
                Recipients := UserSetup."E-Mail";
                ReceiverName := ApproverId;
            end;
            SenderName := UserId;
            HumanResourcesSetup.Get;
            ActiveSession.Reset;
            ActiveSession.SetRange("User ID", UserId);
            ActiveSession.SetRange("Client Type", ActiveSession."client type"::"Web Client");
            if ActiveSession.FindFirst then
                Body := 'Dear ' + Format(ReceiverName) + ', <br><br> ' + SenderName + ' has sent an approval request. ' +
                     '</b> Please log in to Dynamics Business Central to verify the document before approval. '
            else begin
                Body := 'Dear ' + Format(ReceiverName) + ', <br><br> ' + SenderName + ' has sent an approval request. ' +
                      '</b> Please log in to Dynamics Business Central to verify the document before approval.'
            end;
            Subject := 'Approval Request';
            SMTPMailSetup.Get;
          //  SenderAddress := SMTPMailSetup."User ID";
            SenderName := 'Document Approvals';
            /*IF MemberApplication.GET(ApprovalEntry."Document No.") THEN BEGIN
              Body1:='<BR> Payee name: '+MemberApplication."Payee Name"+'<BR>Payment Amount '+MemberApplication."Currency Code"+' '+FORMAT(MemberApplication."Payment Amount")
              +' Pay from account: '+MemberApplication."Payment  Account Name";
           END ELSE IF BankAccount.GET(ApprovalEntry."Document No.") THEN
             Body1:='<BR> Bank name: '+BankAccount.Name
           ELSE IF Vendor.GET(ApprovalEntry."Document No.") THEN
             Body1:='<BR>Vendor name: '+Vendor.Name;*/
            Body3 := '<br> This is a system generated message please do not reply to it.' +
               '<br>Regards';
            //function was deleted KasnebFunctions.IanSendEmailWithoutAttachement(SenderName,SenderAddress,Recipients,Subject,Body+Body1+Body3);
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]

    procedure IanSendEmailOnRejectionOfApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        ApprovalEntryVar: array[3] of Record "Approval Entry";
        SequenceNo: Integer;
        SenderName: Text;
        SenderAddress: Text;
        Recipients: Text;
        Subject: Text;
        Body: Text;
        ReceiverName: Text;
        ApprovalCommentLine: Record "Approval Comment Line";
    begin
        with ApprovalEntry do begin
            Recipients := '';
            SenderName := '';
            SenderAddress := '';
            Subject := '';
            Body := '';
            if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                Recipients := UserSetup."E-Mail";
                ReceiverName := UserSetup."User ID";
            end;
            ApprovalCommentLine.Reset;
            ApprovalCommentLine.SetRange("Record ID to Approve", ApprovalEntry."Record ID to Approve");
            ApprovalCommentLine.SetRange("User ID", UserId);
            Subject := 'Approval Rejection';
            Body := 'Dear ' + Format(ReceiverName) + ', <br><br> ' + SenderName + ' Has Rejected Approval request of type' + Format(ApprovalEntry."Document Type")
                   + ' .<br><br><b>Reason<br>' + Format(ApprovalCommentLine.Comment) + ' <br<br>This is a system generated message please do not reply to it.';
            //function was deleted  KasnebFunctions.IanSendEmailWithoutAttachement(SenderName,SenderAddress,Recipients,Subject,Body);
        end;
    end;
}

