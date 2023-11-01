#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50065 "pageextension50065" extends "Requests to Approve"
{
    actions
    {

        //Unsupported feature: Code Modification on "Approve(Action 19).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        //ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        IF ApprovalEntry."Sequence No."=1 THEN BEGIN
        ImprestMemo.RESET;
        ImprestMemo.SETRANGE("No.",ApprovalEntry."Document No.");
        IF ImprestMemo.FINDFIRST THEN BEGIN
        IF ImprestMemo."Job  Task"='' THEN
          ERROR(TXT001,ApprovalEntry."Document No.");
        END;
        END;

        //ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);
        */
        //end;


        //Unsupported feature: Code Modification on "Reject(Action 2).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        //ApprovalsMgmt.RejectApprovalRequests(ApprovalEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        //ApprovalsMgmt.RejectApprovalRequests(ApprovalEntry);

        CompanyInformation.GET;
        ApprovalEntry1.RESET;
        ApprovalEntry1.SETRANGE("Document No.",ApprovalEntry."Document No.");
        ApprovalEntry1.SETRANGE("Date-Time Sent for Approval",ApprovalEntry."Date-Time Sent for Approval");
        ApprovalEntry1.SETFILTER(Status,'=%1|%2',ApprovalEntry1.Status::Approved,ApprovalEntry1.Status::Open);
        IF ApprovalEntry1.FINDSET THEN BEGIN
          REPEAT
          IF UserSetup.GET(ApprovalEntry1."Approver ID") THEN BEGIN
            IF UserSetup."E-Mail" <> '' THEN BEGIN
               EmailNotifications.FnSendEmail(CompanyInformation."E-Mail",COMPANYNAME,UserSetup."E-Mail",'REJECTED APROVALS','This approval request '+ FORMAT(ApprovalEntry1."Document Type")+' '+' '+ApprovalEntry1."Document No."+'sent by'+
              ' '+ApprovalEntry1."Sender ID"+' '+'has been rejected');
              END;
            END;
            UNTIL ApprovalEntry1.NEXT=0;
          END;
        */
        //end;


        //Unsupported feature: Code Modification on "Delegate(Action 35).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        //ApprovalsMgmt.DelegateApprovalRequests(ApprovalEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF CONFIRM(TXT001)=TRUE THEN BEGIN
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        //ApprovalsMgmt.DelegateApprovalRequests(ApprovalEntry);
        END
        */
        //end;
    }

    var
      //  TXT001: label 'Kindly select the job task for the memo no. %1';

    //var
      //  TXT001: label 'Are you sure you want to delegate this request';

    var
        ApprovalEntry: Record "Approval Entry";
        UserSetup: Record "User Setup";
        EmailNotifications: Codeunit "Email Notifications";
        CompanyInformation: Record "Company Information";
        ApprovalEntry1: Record "Approval Entry";
        ImprestMemo: Record "Imprest Memo";
}

