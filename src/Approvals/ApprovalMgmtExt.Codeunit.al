codeunit 90100 "Approval Mgmt. Ext"

{

    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
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
        //"HR Asset Transfer Header"
        HRAssettrans: Record "HR Asset Transfer Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";


        //Inter Bank Transfer
        InterBankTransfer: Record "Inter Bank Transfer";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';

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
            //"HR Asset Transfer Header"
            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(HRAssettrans);
                    HRAssettrans.Validate(Status, HRAssettrans.Status::Open);
                    HRAssettrans.Modify;
                    Variant := HRAssettrans;
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

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
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
        //"HR Asset Transfer Header"
        HRAssettrans: Record "HR Asset Transfer Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";
        //Interbank Transfer
        InterBankTransfer: Record "Inter Bank Transfer";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';

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
            //"HR Asset Transfer Header"
            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(HRAssettrans);
                    HRAssettrans.Validate(Status, HRAssettrans.Status::Approved);
                    HRAssettrans.Modify;
                    Variant := HRAssettrans;
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

            else
                Handled := false;
                Error(UnsupportedRecordTypeErr, RecRef.Caption);

        end

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
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
        //"HR Asset Transfer Header"
        HRAssettrans: Record "HR Asset Transfer Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";
        //Interbank Transfer
        InterBankTransfer: Record "Inter Bank Transfer";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';

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
            //"HR Asset Transfer Header"
            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(HRAssettrans);
                    HRAssettrans.Validate(Status, HRAssettrans.Status::"Pending Approval");
                    HRAssettrans.Modify;
                    Variant := HRAssettrans;
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

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);

        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]

    procedure PopulateApprovalEntryArgument(RecRef: RecordRef; WorkflowStepInstance: Record "Workflow Step Instance"; VAR ApprovalEntryArgument: Record "Approval Entry")
    var

        //pavement
        PavementTestHeader: Record "Pavement Test Header";

        //purchase
        PurchaseHeader: Record "Purchase Header";
        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //rfq
        StandardPurchaseCode: Record "Standard Purchase Code";
        //Payments
        payments: Record payments;
        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";
        //InterbankTransfer
        Interbank: Record "Inter Bank Transfer";
        //Standing Imprest
        StandingImprest: Record "Imprest Memo";
        //"Transport Requisition"
        FleetReq: Record "Transport Requisition";
        //"Fuel & Maintenance Requisition"
        FuelReq: Record "Fuel & Maintenance Requisition";
        //"Maintenance Header"
        MaintenanceReq: Record "Maintenance Header";
        //"HR Asset Transfer Header"
        HRAssettrans: Record "HR Asset Transfer Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";


    begin
        ApprovalEntryArgument.INIT;
        ApprovalEntryArgument."Table ID" := RecRef.NUMBER;
        ApprovalEntryArgument."Record ID to Approve" := RecRef.RECORDID;
        ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::" ";
        ApprovalEntryArgument."Approval Code" := WorkflowStepInstance."Workflow Code";
        ApprovalEntryArgument."Workflow Step Instance ID" := WorkflowStepInstance.ID;

        CASE RecRef.NUMBER OF
            //pavement
            DATABASE::"Pavement Test Header":
                BEGIN
                    RecRef.SETTABLE(PavementTestHeader);
                    ApprovalEntryArgument."Document No." := PavementTestHeader."Document No.";
                END;
            //IFRCARD
            DATABASE::"Request For Information":
                BEGIN
                    RecRef.SETTABLE(RequestForInformation);
                    ApprovalEntryArgument."Document No." := RequestForInformation.Code;
                END;

            //procurement plan
            DATABASE::"procurement plan":
                BEGIN
                    RecRef.SETTABLE(procurementplan);
                    ApprovalEntryArgument."Document No." := procurementplan.Code;
                END;

            //rfq
            DATABASE::"Standard Purchase Code":
                BEGIN
                    RecRef.SETTABLE(StandardPurchaseCode);
                    ApprovalEntryArgument."Document Type" := StandardPurchaseCode."Document Status"::Draft;
                    ApprovalEntryArgument."Document No." := StandardPurchaseCode.Code;
                END;

            //pv
            DATABASE::"Payments":
                BEGIN
                    RecRef.SETTABLE(payments);
                    ApprovalEntryArgument."Document No." := payments."No.";
                END;

            //Imprest memo
            DATABASE::"Imprest Memo":
                BEGIN
                    RecRef.SETTABLE(ImprestMemo);
                    ApprovalEntryArgument."Document No." := ImprestMemo."No.";
                END;
            //"Transport Requisition"
            DATABASE::"Transport Requisition":
                BEGIN
                    RecRef.SETTABLE(FleetReq);
                    ApprovalEntryArgument."Document No." := FleetReq."Transport Requisition No";
                END;
            //"Fuel & Maintenance Requisition"
            DATABASE::"Fuel & Maintenance Requisition":
                BEGIN
                    RecRef.SETTABLE(FuelReq);
                    ApprovalEntryArgument."Document No." := FuelReq."Requisition No";
                END;
            //"Maintenance Header"
            DATABASE::"Maintenance Header":
                BEGIN
                    RecRef.SETTABLE(MaintenanceReq);
                    ApprovalEntryArgument."Document No." := MaintenanceReq."No";
                END;
            //"HR Asset Transfer Header"
            DATABASE::"HR Asset Transfer Header":
                BEGIN
                    RecRef.SETTABLE(HRAssettrans);
                    ApprovalEntryArgument."Document No." := HRAssettrans."No.";
                END;
            //"Recruitment Plan"
            DATABASE::"Recruitment Plan":
                BEGIN
                    RecRef.SETTABLE(Recruiplan);
                    ApprovalEntryArgument."Document No." := Recruiplan."Document No.";
                END;
            //"Recruitment Requisition Header"
            DATABASE::"Recruitment Requisition Header":
                BEGIN
                    RecRef.SETTABLE(RecruitReq);
                    ApprovalEntryArgument."Document No." := RecruitReq."Document No.";
                END;

        END;

    end;


}