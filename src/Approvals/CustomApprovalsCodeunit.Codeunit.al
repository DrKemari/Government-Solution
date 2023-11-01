Codeunit 59500 "Custom Approvals Codeunit"
{

    trigger OnRun()
    begin
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        SkipCheckReleaseRestrictions: Boolean;
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        NoWorkflowEnabledErr: label 'No related approval workflow is enabled.';

        //pavement
        OnSendPavementApprovalRequestTxt: label 'Approval of a Pavement Lab Test is requested';
        RunWorkflowOnSendPavementForApprovalCode: label 'RUNWORKFLOWONSENDPAVEMENTFORAPPROVAL';
        OnCancelPavementApprovalRequestTxt: label 'An Approval of a Pavement Lab Test is canceled';
        RunWorkflowOnCancelPavementForApprovalCode: label 'RUNWORKFLOWONCANCELPAVEMENTFORAPPROVAL';

        //Project Schedule
        OnSendScheduleApprovalRequestTxt: label 'Approval of a Project Schedule is requested';
        RunWorkflowOnSendScheduleForApprovalCode: label 'RUNWORKFLOWONSENDSCHEDULEFORAPPROVAL';
        OnCancelScheduleApprovalRequestTxt: label 'An Approval of a Project Schedule is canceled';
        RunWorkflowOnCancelScheduleForApprovalCode: label 'RUNWORKFLOWONCANCELSCHEDULEFORAPPROVAL';

        //purchase requisition
        // OnSendPurchaseApprovalRequestTxt: label 'Approval of a Purchase Requisition is requested';
        // RunWorkflowOnSendPurchaseForApprovalCode: label 'RUNWORKFLOWONSENDPURCHASEFORAPPROVAL';
        // OnCancelPurchaseApprovalRequestTxt: label 'An Approval of a Purchase Requisition  is canceled';
        // RunWorkflowOnCancelPurchaseForApprovalCode: label 'RUNWORKFLOWONCANCELPURCHASEFORAPPROVAL';

        //Purchase Requisition
        OnSendPurchaseRequisitionApprovalRequestTxt: label 'An Approval Request for Purchase/Store Requisition has been Requested.';
        RunWorkflowOnSendPurchaseRequisitionForApprovalCode: label 'RUNWORKFLOWONSENDPURCHASEREQUISITIONFORAPPROVAL';
        RunWorkflowOnCancelPurchaseRequisitionApprovalCode: label 'RUNWORKFLOWONCANCELPURCHASEREQUIAITIONFORAPPROVAL';
        OnCancelPurchaseRequisitionApprovalRequestTxt: label 'An Approval Request for Purchase/Store Requisition has been Cancelled';


        //ifRcard
        OnSendIFRApprovalRequestTxt: label 'Approval of an IFR is requested';
        RunWorkflowOnSendIFRForApprovalCode: label 'RUNWORKFLOWONSENDIFRFORAPPROVAL';
        OnCancelIFRApprovalRequestTxt: label 'An Approval of An IFR is canceled';
        RunWorkflowOnCancelIFRForApprovalCode: label 'RUNWORKFLOWONCANCELIFRFORAPPROVAL';

        //DraftIFS
        OnSendDraftIFSApprovalRequestTxt: label 'Approval of DraftIFS is requested';
        RunWorkflowOnSendDraftIFSForApprovalCode: label 'RUNWORKFLOWONSENDDRAFTIFSFORAPPROVAL';
        OnCancelDraftIFSApprovalRequestTxt: label 'An Approval of DraftIFS is canceled';
        RunWorkflowOnCancelDraftIFSForApprovalCode: label 'RUNWORKFLOWONCANCELDRAFTIFSFORAPPROVAL';

        //RFQ
        OnSendRFQApprovalRequestTxt: label 'Approval of RFQ is requested';
        RunWorkflowOnSendRFQForApprovalCode: label 'RUNWORKFLOWONRFQFORAPPROVAL';
        OnCancelRFQApprovalRequestTxt: label 'An Approval of RFQ  is canceled';
        RunWorkflowOnCancelRFQForApprovalCode: label 'RUNWORKFLOWONCANCELRFQFORAPPROVAL';

        //Procurement Plan
        OnSendProcPlanApprovalRequestTxt: label 'Approval of Procurement Plan is requested';
        RunWorkflowOnSendProcPlanForApprovalCode: label 'RUNWORKFLOWONPROCPLANFORAPPROVAL';
        OnCancelProcPlanApprovalRequestTxt: label 'An Approval of Procurement Plan is canceled';
        RunWorkflowOnCancelProcPlanForApprovalCode: label 'RUNWORKFLOWONCANCELProcPlanFORAPPROVAL';
        //PV
        OnSendPVApprovalRequestTxt: label 'Approval of a payments document  is requested';
        RunWorkflowOnSendPVForApprovalCode: label 'RUNWORKFLOWONSENDPVFORAPPROVAL';
        OnCancelPVApprovalRequestTxt: label 'An Approval of a Payments Document is canceled';
        RunWorkflowOnCancelPVForApprovalCode: label 'RUNWORKFLOWONCANCELPVFORAPPROVAL';

        //Imprest Memo
        OnSendIMApprovalRequestTxt: label 'Approval of an ImprestMemo Request is requested';
        RunWorkflowOnSendIMForApprovalCode: label 'RUNWORKFLOWONSENDIMFORAPPROVAL';
        OnCancelIMApprovalRequestTxt: label 'An Approval of ImprestMemo Request is canceled';
        RunWorkflowOnCancelIMForApprovalCode: label 'RUNWORKFLOWONCANCELIMFORAPPROVAL';
        //RecruitReq
        OnSendRecruitReqApprovalRequestTxt: label 'Approval of an Recruitment Requisition is requested';
        RunWorkflowOnSendRecruitReqForApprovalCode: label 'RUNWORKFLOWONSENDRecruitReqFORAPPROVAL';
        OnCancelRecruitReqApprovalRequestTxt: label 'An Approval of Recruitment Requisition is canceled';
        RunWorkflowOnCancelRecruitReqForApprovalCode: label 'RUNWORKFLOWONCANCELRecruitReqFORAPPROVAL';
        //Recruiplan
        OnSendRecruiplanApprovalRequestTxt: label 'Approval of an Recruitment plan Request is requested';
        RunWorkflowOnSendRecruiplanForApprovalCode: label 'RUNWORKFLOWONSENDRecruitplanFORAPPROVAL';
        OnCancelRecruiplanApprovalRequestTxt: label 'An Approval of Recruitment plan Request is canceled';
        RunWorkflowOnCancelRecruiplanForApprovalCode: label 'RUNWORKFLOWONCANCELRecruitplanFORAPPROVAL';
        //MaintenanceReq
        OnSendMaintenanceReqApprovalRequestTxt: label 'Approval of an MaintenanceReq Request is requested';
        RunWorkflowOnSendMaintenanceReqForApprovalCode: label 'RUNWORKFLOWONSENDMaintenanceReqFORAPPROVAL';
        OnCancelMaintenanceReqApprovalRequestTxt: label 'An Approval of MaintenanceReq Request is canceled';
        RunWorkflowOnCancelMaintenanceReqForApprovalCode: label 'RUNWORKFLOWONCANCELMaintenanceReqFORAPPROVAL';
        //FuelReq
        OnSendFuelReqApprovalRequestTxt: label 'Approval of an Fuel Request is requested';
        RunWorkflowOnSendFuelReqForApprovalCode: label 'RUNWORKFLOWONSENDFuelFORAPPROVAL';
        OnCancelFuelReqApprovalRequestTxt: label 'An Approval of Fuel Request is canceled';
        RunWorkflowOnCancelFuelReqForApprovalCode: label 'RUNWORKFLOWONCANCELFuelFORAPPROVAL';

        //FleetReq
        OnSendFleetReqApprovalRequestTxt: label 'Approval of an Fleet Request is requested';
        RunWorkflowOnSendFleetReqForApprovalCode: label 'RUNWORKFLOWONSENDFleetReqFORAPPROVAL';
        OnCancelFleetReqApprovalRequestTxt: label 'An Approval of Fleet Request is canceled';
        RunWorkflowOnCancelFleetReqForApprovalCode: label 'RUNWORKFLOWONCANCELFleetReqFORAPPROVAL';

        //Interbank Transfers
        OnSendITApprovalRequestTxt: label 'Approval of an Interbank Transfer is requested';
        RunWorkflowOnSendITForApprovalCode: label 'RUNWORKFLOWONSENDITFORAPPROVAL';
        OnCancelITApprovalRequestTxt: label 'An Approval of an Interbank Transfer is canceled';
        RunWorkflowOnCancelITForApprovalCode: label 'RUNWORKFLOWONCANCELITFORAPPROVAL';

        //Asset Transfer
        OnSendAssetTransferApprovalRequestTxt: label 'An Approval of an Asset Transfer is requested';
        RunWorkflowOnSendAssetTransferForApprovalCode: label 'RUNWORKFLOWONSENDASSETTRANSFERFORAPPROVAL';
        OnCancelAssetTransferApprovalRequestTxt: label 'An Approval of an Asset Transfer is canceled';
        RunWorkflowOnCancelAssetTransferForApprovalCode: label 'RUNWORKFLOWONCANCELASSETTRANSFERFORAPPROVAL';
        // Jobs 
        OnSendHrJobsApprovalRequestTxt: label 'An Approval Request for a Job Position has been requested.';
        RunWorkflowOnSendHrJobsForApprovalCode: label 'RUNWORKFLOWONSENDHRJOBSFORAPPROVAL';
        OnCancelHrJobsApprovalRequestTxt: label 'An Approval Request for a Job Position has been cancelled.';
        RunWorkflowOnCancelHrJobsForApprovalCode: label 'RUNWORKFLOWONCANCELHRJOBSFORAPPROVAL';
        //Employee Requisition
        OnSendHrEmployeeReqApprovalRequestTxt: label 'An Approval request for Employee Requsition is Requested.';
        RunWorkflowOnSendHrEmployeeReqForApprovalCode: label 'RUNWORKFLOWONSENDHREMPLOYEEREQFORAPPROVAL';
        OnCancelHrEmployeeReqApprovalRequestTxt: label 'An Approval request for Employee Requsition is Cancelled';
        RunWorkflowOnCancelHrEmployeeReqForApprovalCode: label 'RUNWORKFLOWONCANCELHREMPLOYEEREQFORAPPROVAL';
        //Leave
        OnSendHrLeaveApprovalRequestTxt: label 'An Approval Request for Leave application has been Requested.';
        RunWorkflowOnSendHrLeaveForApprovalCode: label 'RUNWORKFLOWONSENDHRLEAVEFORAPPROVAL';
        OnCancelHrLeaveApprovalRequestTxt: label 'An Approval Request for Leave Application has been Cancelled';
        RunWorkflowOnCancelHrLeaveForApprovalCode: label 'RUNWORKFLOWONCANCELHRLEAVEFORAPPROVAL';

        //Training Requisition
        OnSendHrTrainingApprovalRequestTxt: label 'An Approval Request for Training application has been Requested.';
        RunWorkflowOnSendHrTrainingForApprovalCode: label 'RUNWORKFLOWONSENDHRTRAININGFORAPPROVAL';
        OnCancelHrTrainingApprovalRequestTxt: label 'An Approval Request for Training Application has been Cancelled';
        RunWorkflowOnCancelHrTrainingForApprovalCode: label 'RUNWORKFLOWONCANCELHRTRAININGFORAPPROVAL';

    procedure CheckApprovalsWorkflowEnabled(var Variant: Variant): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of

            //pavement
            Database::"Pavement Test Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPavementForApprovalCode));
            //pROJECT SCHEDULE
            Database::"Road Work Program":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendScheduleForApprovalCode));

            //pURCHASE
            // Database::"Purchase Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPurchaseForApprovalCode));

            //purchase Requisition
            // Database::"Purchase Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPurchaseRequisitionForApprovalCode));
            //IFRCARD
            Database::"Request For Information":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIFRForApprovalCode));
            //DraftIFS

            //procurement Plan
            Database::"Procurement Plan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProcPlanForApprovalCode));
            //RFQ
            Database::"Standard Purchase Code":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRFQForApprovalCode));
            //PV
            Database::Payments:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPVForApprovalCode));
            //Imprest Memo
            Database::"Imprest Memo":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIMForApprovalCode));
            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRecruitReqForApprovalCode));
            //"Recruitment Plan"
            Database::"Recruitment Plan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRecruiplanForApprovalCode));
            //MaintenanceReq
            Database::"Maintenance Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMaintenanceReqForApprovalCode));

            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendFuelReqForApprovalCode));
            //FleetReq
            Database::"Transport Requisition":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendFleetReqForApprovalCode));

            //Interbank Transfer
            Database::"Inter Bank Transfer":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendITForApprovalCode));
            //Asset Transfer
            DATABASE::"HR Asset Transfer Header":
                EXIT(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAssetTransferForApprovalCode));
            //Leave
            DATABASE::"HR Leave Application":
                EXIT(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHrLeaveForApprovalCode));




            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    procedure CheckApprovalsWorkflowEnabledCode(var Variant: Variant; CheckApprovalsWorkflowTxt: Text): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        if not WorkflowManagement.CanExecuteWorkflow(Variant, CheckApprovalsWorkflowTxt) then
            Error(NoWorkflowEnabledErr);
        exit(true);
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelDocApprovalRequest(var Variant: Variant)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddWorkflowEventsToLibrary()
    var
        WorkFlowEventHandling: Codeunit "Workflow Event Handling";
    begin

        //Pavement
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPavementForApprovalCode, Database::"Pavement Test Header", OnSendPavementApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPavementForApprovalCode, Database::"Pavement Test Header", OnCancelPavementApprovalRequestTxt, 0, false);

        //project schedule
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendScheduleForApprovalCode, Database::"Road Work Program", OnSendScheduleApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelScheduleForApprovalCode, Database::"Road Work Program", OnCancelScheduleApprovalRequestTxt, 0, false);
        //Purchase
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendPurchaseForApprovalCode, Database::"Purchase Header", OnSendPurchaseApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelPurchaseForApprovalCode, Database::"Purchase Header", OnCancelPurchaseApprovalRequestTxt, 0, false);

        //purchase requsition
        //     WorkFlowEventHandling.AddEventToLibrary(
        //    RunWorkflowOnSendPurchaseRequisitionForApprovalCode, Database::"Purchase Header", OnSendPurchaseRequisitionApprovalRequestTxt, 0, false);
        //     WorkFlowEventHandling.AddEventToLibrary(
        //     RunWorkflowOnCancelPurchaseRequisitionApprovalCode, Database::"Purchase Header", OnCancelPurchaseRequisitionApprovalRequestTxt, 0, false);


        //IFPCARD
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendIFRForApprovalCode, Database::"Request For Information", OnSendIFRApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelIFRForApprovalCode, Database::"Request For Information", OnCancelIFRApprovalRequestTxt, 0, false);

        //RFQ
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRFQForApprovalCode, Database::"Standard Purchase Code", OnSendRFQApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRFQForApprovalCode, Database::"Standard Purchase Code", OnCancelRFQApprovalRequestTxt, 0, false);

        //PV
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPVForApprovalCode, Database::"Payments", OnSendPVApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPVForApprovalCode, Database::"Payments", OnCancelPVApprovalRequestTxt, 0, false);

        //Imprest Memo
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendIMForApprovalCode, Database::"Imprest Memo", OnSendIMApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelIMForApprovalCode, Database::"Imprest Memo", OnCancelIMApprovalRequestTxt, 0, false);
        //"Recruitment Requisition Header"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRecruitReqForApprovalCode, Database::"Recruitment Requisition Header", OnSendRecruitReqApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRecruitReqForApprovalCode, Database::"Recruitment Requisition Header", OnCancelRecruitReqApprovalRequestTxt, 0, false);
        //"Recruitment Plan"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRecruiplanForApprovalCode, Database::"Recruitment Plan", OnSendRecruiplanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRecruiplanForApprovalCode, Database::"Recruitment Plan", OnCancelRecruiplanApprovalRequestTxt, 0, false);
        //"Maintenance Header"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendMaintenanceReqForApprovalCode, Database::"Maintenance Header", OnSendMaintenanceReqApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelMaintenanceReqForApprovalCode, Database::"Maintenance Header", OnCancelMaintenanceReqApprovalRequestTxt, 0, false);
        //"Fuel & Maintenance Requisition"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendFuelReqForApprovalCode, Database::"Fuel & Maintenance Requisition", OnSendFuelReqApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelFuelReqForApprovalCode, Database::"Fuel & Maintenance Requisition", OnCancelFuelReqApprovalRequestTxt, 0, false);

        //"Transport Requisition"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendFleetReqForApprovalCode, Database::"Transport Requisition", OnSendFleetReqApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelFleetReqForApprovalCode, Database::"Transport Requisition", OnCancelFleetReqApprovalRequestTxt, 0, false);

        //Interbank Transfer
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendITForApprovalCode, Database::"Inter Bank Transfer", OnSendITApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelITForApprovalCode, Database::"Inter Bank Transfer", OnCancelITApprovalRequestTxt, 0, false);

        //Asset 
        WorkFlowEventHandling.AddEventToLibrary(
               RunWorkflowOnSendAssetTransferForApprovalCode, DATABASE::"HR Asset Transfer Header", OnSendAssetTransferApprovalRequestTxt, 0, FALSE);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAssetTransferForApprovalCode, DATABASE::"HR Asset Transfer Header", OnCancelAssetTransferApprovalRequestTxt, 0, FALSE);

        //Procurement Plan
        WorkFlowEventHandling.AddEventToLibrary(
      RunWorkflowOnSendProcPlanForApprovalCode, DATABASE::"Procurement Plan", OnSendProcPlanApprovalRequestTxt, 0, FALSE);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelProcPlanForApprovalCode, DATABASE::"Procurement Plan", OnCancelProcPlanApprovalRequestTxt, 0, FALSE);

        //Leave
        WorkFlowEventHandling.AddEventToLibrary(
      RunWorkflowOnSendHrLeaveForApprovalCode, DATABASE::"HR Leave Application", OnSendHrLeaveApprovalRequestTxt, 0, FALSE);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelHrLeaveForApprovalCode, DATABASE::"HR Leave Application", OnCancelHrLeaveApprovalRequestTxt, 0, FALSE);




    end;

    local procedure RunWorkflowOnSendApprovalRequestCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendApprovalRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnSendDocForApproval', '', false, false)]
    procedure RunWorkflowOnSendApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin


        RecRef.GetTable(Variant);
        case RecRef.Number of

            //Pavement
            Database::"Pavement Test Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPavementForApprovalCode, Variant);
            //Project schedule
            Database::"Road Work Program":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendScheduleForApprovalCode, Variant);

            //IFRCARD
            Database::"Request For Information":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendIFRForApprovalCode, Variant);
            //Procurement Plan
            Database::"Procurement Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProcPlanForApprovalCode, Variant);
            //RFQ
            Database::"Standard Purchase Code":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRFQForApprovalCode, Variant);
            //PV
            Database::"Payments":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPVForApprovalCode, Variant);

            //Imprest Memo
            Database::"Imprest Memo":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendIMForApprovalCode, Variant);

            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRecruitReqForApprovalCode, Variant);

            //"Recruitment Plan"
            Database::"Recruitment Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRecruiplanForApprovalCode, Variant);
            //"Maintenance Header"
            Database::"Maintenance Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendMaintenanceReqForApprovalCode, Variant);
            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendFuelReqForApprovalCode, Variant);

            //"Transport Requisition"
            Database::"Transport Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendFleetReqForApprovalCode, Variant);

            //Interbank Transfer
            Database::"Inter Bank Transfer":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendITForApprovalCode, Variant);
            //Asset Transfer
            DATABASE::"HR Asset Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAssetTransferForApprovalCode, Variant);
            //Leave
            DATABASE::"HR Leave Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHrLeaveForApprovalCode, Variant);


            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnCancelDocApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of

            //pavement
            Database::"Pavement Test Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPavementForApprovalCode, Variant);
            //project Schedule
            Database::"Road Work Program":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelScheduleForApprovalCode, Variant);
            //purchase
            // Database::"Purchase Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelPurchaseForApprovalCode, Variant);
            //Purchase Requisition
            // Database::"Purchase Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelPurchaseRequisitionApprovalCode, Variant);

            //IFRCARD
            Database::"Request For Information":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFRForApprovalCode, Variant);
            //procurement plan
            Database::"procurement plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProcPlanForApprovalCode, Variant);

            //RFQ
            Database::"Standard Purchase Code":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRFQForApprovalCode, Variant);
            //pv
            Database::"Payments":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPVForApprovalCode, Variant);

            //Imprest Memo
            Database::"Imprest Memo":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelIMForApprovalCode, Variant);
            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRecruitReqForApprovalCode, Variant);

            //"Recruitment Plan"
            Database::"Recruitment Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRecruiplanForApprovalCode, Variant);
            //"Maintenance Header"
            Database::"Maintenance Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelMaintenanceReqForApprovalCode, Variant);
            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelFuelReqForApprovalCode, Variant);

            //"Transport Requisition"
            Database::"Transport Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelFleetReqForApprovalCode, Variant);
            //Interbank Transfer
            Database::"Inter Bank Transfer":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelITForApprovalCode, Variant);
            //Asset Transfer
            Database::"HR Asset Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAssetTransferForApprovalCode, Variant);
            //Leave
            Database::"HR Leave Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHrLeaveForApprovalCode, Variant);


            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;

    end;

    procedure ReOpen(var RecRef: RecordRef; Handled: Boolean)
    var
        Variant: Variant;

        //pavement
        PavementTestHeader: Record "Pavement Test Header";

        //project Schedule
        RoadWorkPlan: Record "Road Work Program";
        //purchase
        PurchaseHeader: Record "Purchase Header";

        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";

        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";
        //PV
        Payments: Record payments;

        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";

        //"Transport Requisition"
        FleetReq: Record "Transport Requisition";
        //"Fuel & Maintenance Requisition"
        FuelReq: Record "Fuel & Maintenance Requisition";
        //"Maintenance Header"
        MaintenanceReq: Record "Maintenance Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";
        //Inter Bank Transfer
        InterBankTransfer: Record "Inter Bank Transfer";
        HrAssetTrans: Record "HR Asset Transfer Header";
        Leave: Record "HR Leave Application";

    begin
        case RecRef.Number of

            //pavement
            Database::"Pavement Test Header":
                begin
                    RecRef.SetTable(PavementTestHeader);
                    PavementTestHeader.Validate(Status, PavementTestHeader.Status::Open);
                    PavementTestHeader.Modify;
                    Variant := PavementTestHeader;
                    Handled := true;
                end;

            //project Schedule
            Database::"Road Work Program":
                begin
                    RecRef.SetTable(RoadWorkPlan);
                    // RoadWorkPlan.Validate("Approval Status", RoadWorkPlan."Approval Status"::Open);
                    RoadWorkPlan.Modify;
                    // Variant := RoadWorkPlan;
                    Handled := true;
                end;


            //IFRCARD
            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::Open);
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                    Handled := true;
                end;

            //procurement plan
            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::Open);
                    procurementplan.Modify;
                    Variant := procurementplan;
                    Handled := true;
                end;
            //RFQ
            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::Open);
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                    Handled := true;
                end;
            //pv
            Database::"payments":
                begin
                    RecRef.SetTable(payments);
                    payments.Validate(Status, payments.Status::Open);
                    payments.Modify;
                    Variant := payments;
                    Handled := true;
                end;

            //Imprest Memo
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Validate(Status, ImprestMemo.Status::Open);
                    ImprestMemo.Modify;
                    Variant := ImprestMemo;
                    Handled := true;
                end;
            //FleetReq
            Database::"Transport Requisition":
                begin
                    RecRef.SetTable(FleetReq);
                    FleetReq.Validate(Status, FleetReq.Status::Open);
                    FleetReq.Modify;
                    Variant := FleetReq;
                    Handled := true;
                end;

            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecRef.SetTable(FuelReq);
                    FuelReq.Validate(Status, FuelReq.Status::Open);
                    FuelReq.Modify;
                    Variant := FuelReq;
                    Handled := true;
                end;


            //"Maintenance Header"
            Database::"Maintenance Header":
                begin
                    RecRef.SetTable(MaintenanceReq);
                    MaintenanceReq.Validate(Status, MaintenanceReq.Status::Open);
                    MaintenanceReq.Modify;
                    Variant := MaintenanceReq;
                    Handled := true;
                end;


            //"Recruitment Plan"
            Database::"Recruitment Plan":
                begin
                    RecRef.SetTable(Recruiplan);
                    Recruiplan.Validate("Approval Status", Recruiplan."Approval Status"::Open);
                    Recruiplan.Modify;
                    Variant := Recruiplan;
                    Handled := true;
                end;
            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitReq);
                    RecruitReq.Validate("Approval Status", RecruitReq."Approval Status"::Open);
                    RecruitReq.Modify;
                    Variant := RecruitReq;
                    Handled := true;
                end;


            //Interbank Transfer
            Database::"Inter Bank Transfer":
                begin
                    RecRef.SetTable(InterBankTransfer);
                    InterBankTransfer.Validate("Approval Status", "Approval Status"::Open);
                    InterBankTransfer.Modify;
                    Variant := InterBankTransfer;
                    Handled := true;
                end;

            DATABASE::"HR Asset Transfer Header":
                BEGIN
                    RecRef.SETTABLE(HrAssetTrans);
                    HrAssetTrans.VALIDATE(Status, HrAssetTrans.Status::Open);
                    HrAssetTrans.MODIFY;
                    Variant := HrAssetTrans;
                END;
            DATABASE::"HR Leave Application":
                BEGIN
                    RecRef.SETTABLE(Leave);
                    Leave.VALIDATE(Status, Leave.Status::Open);
                    Leave.MODIFY;
                    Variant := Leave;
                END;

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end

    end;

    procedure Release(RecRef: RecordRef; var Handled: Boolean)
    var

        Variant: Variant;

        //pavement
        PavementTestHeader: Record "Pavement Test Header";
        //purchase
        purchaseheader: Record "Purchase Header";

        //IFRCARD
        RequestForInformation: Record "Request For Information";

        //procurement plan
        procurementplan: Record "procurement plan";
        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";
        //pv
        Payments: record payments;
        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";
        //"Transport Requisition"
        FleetReq: Record "Transport Requisition";
        //"Fuel & Maintenance Requisition"
        FuelReq: Record "Fuel & Maintenance Requisition";
        //"Maintenance Header"
        MaintenanceReq: Record "Maintenance Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";

        //Interbank Transfer
        InterBankTransfer: Record "Inter Bank Transfer";
        HrAssetTrans: Record "HR Asset Transfer Header";
        Leave: Record "HR Leave Application";

    begin
        Handled := true;
        case RecRef.Number of

            //pavement
            Database::"Pavement Test Header":
                begin
                    RecRef.SetTable(PavementTestHeader);
                    PavementTestHeader.Validate(Status, PavementTestHeader.Status::Released);
                    PavementTestHeader.Modify;
                    Variant := PavementTestHeader;
                end;
            //purchase
            // Database::"Purchase Header":
            //     begin
            //         RecRef.SetTable(purchaseheader);
            //         PurchaseHeader.Validate(Status, purchaseheader.Status::Released);
            //         PurchaseHeader.Modify;
            //         Variant := PurchaseHeader;
            //     end;
            //IFRCARD
            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::Released);
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                end;
            //procurement plan
            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::Released);
                    procurementplan.Modify;
                    Variant := procurementplan;
                end;

            //rfq
            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::Released);
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                end;


            //pv
            Database::"Payments":
                begin
                    RecRef.SetTable(Payments);
                    payments.Validate(Status, payments.Status::Released);
                    payments.Modify;
                    Variant := payments;
                end;

            //Imprest Memo
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Validate(Status, ImprestMemo.Status::Released);
                    ImprestMemo.Modify;
                    Variant := ImprestMemo;
                end;
            //"Transport Requisition"
            Database::"Transport Requisition":
                begin
                    RecRef.SetTable(FleetReq);
                    FleetReq.Validate(Status, FleetReq.Status::Approved);
                    FleetReq.Modify;
                    Variant := FleetReq;
                end;
            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecRef.SetTable(FuelReq);
                    FuelReq.Validate(Status, FuelReq.Status::Approved);
                    FuelReq.Modify;
                    Variant := FuelReq;
                end;
            //"Maintenance Header"
            Database::"Maintenance Header":
                begin
                    RecRef.SetTable(MaintenanceReq);
                    MaintenanceReq.Validate(Status, MaintenanceReq.Status::Approved);
                    MaintenanceReq.Modify;
                    Variant := MaintenanceReq;
                end;
            //"Recruitment Plan"
            Database::"Recruitment Plan":
                begin
                    RecRef.SetTable(Recruiplan);
                    Recruiplan.Validate("Approval Status", Recruiplan."Approval Status"::Released);
                    Recruiplan.Modify;
                    Variant := Recruiplan;
                end;

            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitReq);
                    RecruitReq.Validate("Approval Status", RecruitReq."Approval Status"::Released);
                    RecruitReq.Modify;
                    Variant := RecruitReq;
                end;
            //Interbank Transfer
            Database::"Inter Bank Transfer":
                begin
                    RecRef.SetTable(InterBankTransfer);
                    InterBankTransfer.Validate("Approval Status", InterBankTransfer."Approval Status"::Released);
                    InterBankTransfer.Modify;
                    Variant := InterBankTransfer;
                end;
            DATABASE::"HR Asset Transfer Header":
                BEGIN
                    RecRef.SETTABLE(HrAssetTrans);
                    HrAssetTrans.VALIDATE(Status, HrAssetTrans.Status::Approved);
                    HrAssetTrans.MODIFY;
                    Variant := HrAssetTrans;
                END;
            DATABASE::"HR Leave Application":
                BEGIN
                    RecRef.SETTABLE(Leave);
                    Leave.VALIDATE(Status, Leave.Status::Released);
                    Leave.MODIFY;
                    Variant := Leave;
                END;


            else
                Handled := false;
                Error(UnsupportedRecordTypeErr, RecRef.Caption);

        end

    end;

    procedure SetStatusToPending(RecRef: RecordRef; var Variant: Variant; IsHandled: Boolean)
    var
        //pavement
        PavementTestHeader: Record "Pavement Test Header";
        //purchase
        PurchaseHeader: Record "Purchase Header";
        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";
        //pv
        payments: Record payments;
        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";
        //"Transport Requisition"
        FleetReq: Record "Transport Requisition";
        //"Fuel & Maintenance Requisition"
        FuelReq: Record "Fuel & Maintenance Requisition";
        //"Maintenance Header"
        MaintenanceReq: Record "Maintenance Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";
        //Interbank Transfer
        InterBankTransfer: Record "Inter Bank Transfer";
        HrAssetTrans: Record "HR Asset Transfer Header";
        Leave: Record "HR Leave Application";

    begin
        RecRef.GetTable(Variant);

        case RecRef.Number of

            //pavement

            Database::"Pavement Test Header":
                begin
                    RecRef.SetTable(PavementTestHeader);
                    PavementTestHeader.Validate(Status, PavementTestHeader.Status::"Pending Approval");
                    PavementTestHeader.Modify;
                    Variant := PavementTestHeader;
                    IsHandled := true;
                end;
            //purchase

            // Database::"Purchase Header":
            //     begin
            //         RecRef.SetTable(PurchaseHeader);
            //         // PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::"Purchase Requisition");
            //         PurchaseHeader.Validate(Status, PurchaseHeader.Status::"Pending Approval");
            //         PurchaseHeader.Modify;
            //         Variant := PurchaseHeader;
            //         IsHandled := true;
            //     end;
            //IFRCARD

            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::"Pending Approval");
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                    IsHandled := true;
                end;

            //procurement plan

            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::"Pending Approval");
                    procurementplan.Modify;
                    Variant := procurementplan;
                    IsHandled := true;
                end;
            //rfq

            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::"Pending Approval");
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                    IsHandled := true;
                end;
            //pv
            Database::"Payments":
                begin
                    RecRef.SetTable(Payments);
                    payments.Validate(Status, payments.Status::"Pending Approval");
                    payments.Modify;
                    Variant := payments;
                    IsHandled := true;
                end;

            //Imprest Memo
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Validate(Status, ImprestMemo.Status::"Pending Approval");
                    ImprestMemo.Modify;
                    Variant := ImprestMemo;
                    IsHandled := true;
                end;
            //"Transport Requisition"
            Database::"Transport Requisition":
                begin
                    RecRef.SetTable(FleetReq);
                    FleetReq.Validate(Status, FleetReq.Status::"Pending Approval");
                    FleetReq.Modify;
                    Variant := FleetReq;
                    IsHandled := true;
                end;
            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecRef.SetTable(FuelReq);
                    FuelReq.Validate(Status, FuelReq.Status::"Pending Approval");
                    FuelReq.Modify;
                    Variant := FuelReq;
                    IsHandled := true;
                end;
            //"Maintenance Header"
            Database::"Maintenance Header":
                begin
                    RecRef.SetTable(MaintenanceReq);
                    MaintenanceReq.Validate(Status, MaintenanceReq.Status::"Pending Approval");
                    MaintenanceReq.Modify;
                    Variant := MaintenanceReq;
                    IsHandled := true;
                end;
            //"Recruitment Plan"
            Database::"Recruitment Plan":
                begin
                    RecRef.SetTable(Recruiplan);
                    Recruiplan.Validate("Approval Status", Recruiplan."Approval Status"::"Pending Approval");
                    Recruiplan.Modify;
                    Variant := Recruiplan;
                    IsHandled := true;
                end;
            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitReq);
                    RecruitReq.Validate("Approval Status", RecruitReq."Approval Status"::"Pending Approval");
                    RecruitReq.Modify;
                    Variant := RecruitReq;
                    IsHandled := true;
                end;
            //Interbank Transfer
            Database::"Inter Bank Transfer":
                begin
                    RecRef.SetTable(InterBankTransfer);
                    InterBankTransfer.Validate("Approval Status", InterBankTransfer."Approval Status"::"Pending Approval");
                    InterBankTransfer.Modify;
                    Variant := InterBankTransfer;
                    IsHandled := true;
                end;
            DATABASE::"HR Asset Transfer Header":
                BEGIN
                    RecRef.SETTABLE(HrAssetTrans);
                    HrAssetTrans.VALIDATE(Status, HrAssetTrans.Status::"Pending Approval");
                    HrAssetTrans.MODIFY;
                    Variant := HrAssetTrans;
                END;
            DATABASE::"HR Leave Application":
                BEGIN
                    RecRef.SETTABLE(Leave);
                    Leave.VALIDATE(Status, Leave.Status::"Pending Approval");
                    Leave.MODIFY;
                    Variant := Leave;
                END;


            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);

        end;

    end;

    [IntegrationEvent(false, false)]
    procedure OnSendDocForApproval(var Variant: Variant)
    begin
    end;


    //--------------------------------------------------------OtherEvent Subscribers-



    // [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateNo', '', false, false)]
    // local procedure Table39_No_OnBeforeValidateNo(CurrentFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    // begin

    //     with PurchaseLine do begin
    //         if "Document Type" = "Document Type"::"Purchase Requisition" then begin
    //             IsHandled := true;
    //         end;

    //     end;
    // end;

    // [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateNo', '', false, false)]
    // local procedure Table39_No_OnBeforeValidateNo2(CurrentFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    // begin

    //     with PurchaseLine do begin
    //         if "Document Type" = "Document Type"::"Store Requisition" then begin
    //             IsHandled := true;
    //         end;

    //     end;
    // end;

    // [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateQuantityBase', '', false, false)]
    // local procedure Table39_No_OnBeforeValidateQuantityBase(CallingFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    // begin

    //     with PurchaseLine do begin
    //         if "Document Type" = "Document Type"::"Purchase Requisition" then begin
    //             IsHandled := true;
    //         end;

    //     end;
    // end;

    [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateQuantityBase', '', false, false)]
    local procedure Table39_No_OnBeforeValidateQuantityBase2(CallingFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    begin

        with PurchaseLine do begin
            if "Document Type" = "Document Type"::"Store Requisition" then begin
                IsHandled := true;
            end;

        end;
    end;

    [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateQuantityBase', '', false, false)]
    local procedure Table39_No_OnBeforeValidateQuantityBase21(CallingFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    begin

        with PurchaseLine do begin
            if "Document Type" = "Document Type"::"Purchase Requisition" then begin
                IsHandled := true;
            end;

        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Enum Assignment Management", 'OnGetPurchApprovalDocumentType', '', true, true)]

    local procedure OnGetPurchApprovalDocumentType(PurchDocumentType: Enum "Purchase Document Type"; var ApprovalDocumentType: Enum "Approval Document Type"; var IsHandled: Boolean)
    begin
        case PurchDocumentType of
            PurchDocumentType::"Store Requisition":
                IsHandled := true;
            PurchDocumentType::"Purchase Requisition":
                IsHandled := true;
        end;
    end;


    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]
    //     local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean);
    //     begin
    //         if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition" then begin

    //             PurchaseHeader.CheckPurchaseReleaseRestrictions();
    //             IsHandled := true;
    //         end;
    //     end;

    // // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', true, true)]
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', true, true)]

    // //local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean)
    // local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean);
    // var
    //     IsHandled: boolean;
    // begin
    //     PreviewMode := true;
    //     IF ((PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Store Requisition") OR (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition")) THEN BEGIN
    //         PurchaseHeader.TESTFIELD(PurchaseHeader."Requester ID");
    //         EXIT;
    //     END
    // end;


}




