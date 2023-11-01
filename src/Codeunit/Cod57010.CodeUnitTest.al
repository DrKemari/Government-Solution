#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 57010 "CodeUnitTest"
{

    trigger OnRun()
    begin
    end;

    var
        FILE: file;
        FILESPATH: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\';
        FILESPATH1: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\Payslip\';
        FILESPATH2: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\P9\';
        FILESPATH3: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\EmployeeStatement\';
        FILESPATH8: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\studentTimetable\';
        FILESPATH4: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\receipt\';
        FILESPATH5: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\resultslip\';
        FILESPATH14: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\StandardAppraisalReport\';
        FILESPATH15: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\PlogReport\';
        FILESPATH16: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\IndividualPCReport\';
        FILESPATH17: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\CSP\';
        FILESPATH18: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\AWP\';
        FILESPATH19: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\BoardPC\';
        FILESPATH24: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\IndividualSubIndicator\';
        FILESPATH25: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\InnovationReport\';
        FILESPATH99: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\RiskReport\';
        FILESPATH98: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\RiskManagementPlanDocuments\';
        FILESPATH97: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\StatusReport\';
        FILESPATH96: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\IncidentLogReport\';

    procedure GenerateRMReport() status: Text
    begin
        // if FILE.Exists(FILESPATH99 + 'risk_report' + '.pdf') then begin
        //     FILE.Erase(FILESPATH99 + 'risk_report' + '.pdf');
        //     //Report.SaveAsPdf(95000, FILESPATH99 + 'risk_report' + '.pdf');
        //     status := 'success*Generated*Downloads\RiskReport\' + 'risk_report' + '.pdf';
        // end else begin
        //     //Report.SaveAsPdf(95000, FILESPATH99 + 'risk_report' + '.pdf');
        //     status := 'success*Generated*Downloads\RiskReport\' + 'risk_report' + '.pdf';
        // end
    end;

    procedure GenerateManagementPlanSummery(docno: Code[50]) status: Text
    var
        riskManagement: Record "Risk Management Plan";
    begin
        // riskManagement.Reset;
        // riskManagement.SetRange("Document No", docno);
        // //riskManagement.SETRANGE("Document Type",riskManagement."Document Type"::Corporate);
        // if riskManagement.FindSet then begin
        //     if FILE.Exists(FILESPATH98 + docno + '.pdf') then begin
        //         FILE.Erase(FILESPATH98 + docno + '.pdf');
        //         //Report.SaveAsPdf(95002, FILESPATH98 + docno + '.pdf', riskManagement);
        //         status := 'success*Generated*Downloads\RiskManagementPlanDocuments\' + docno + '.pdf';
        //     end else begin
        //         //Report.SaveAsPdf(95002, FILESPATH98 + docno + '.pdf', riskManagement);
        //         status := 'success*Generated*Downloads\RiskManagementPlanDocuments\' + docno + '.pdf';
        //     end
        // end else begin
        //     status := 'danger*Document not found';
        // end
    end;

    procedure FnAddRiskOwnership(requisitionNo: Text; riskId: Integer; responsibilityCenter: Text; Officer: Text) status: Text
    var
        riskOwnershipLine: Record "RMP Line Risk Ownership";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        RiskManagementPlan.Reset;
        //FnAddRiskOwnership('CRMP0021',125,'EXAM','00073')
        RiskManagementPlan.SetRange("Document No", requisitionNo);
        if RiskManagementPlan.FindSet then begin
            RiskManagementPlanLine.Reset;
            RiskManagementPlanLine.SetRange("Document No", requisitionNo);
            RiskManagementPlanLine.SetRange("Risk ID", riskId);
            if RiskManagementPlanLine.FindSet then begin
                riskOwnershipLine.Init;
                riskOwnershipLine."Risk Title" := RiskManagementPlanLine."Risk Title";
                riskOwnershipLine."Document Type" := RiskManagementPlan."Document Type";
                riskOwnershipLine."Document No" := requisitionNo;
                riskOwnershipLine."Risk ID" := riskId;
                riskOwnershipLine."Responsibility Center ID" := responsibilityCenter;
                riskOwnershipLine.Validate("Responsibility Center ID");
                riskOwnershipLine."Responsible Officer No." := Officer;
                riskOwnershipLine.Validate("Responsible Officer No.");
                if riskOwnershipLine.Insert(true) then begin
                    status := 'success*Officer added successfully';
                end else begin
                    status := 'danger*The operation was unsuccessful';
                end
            end else begin
                status := 'danger*Risk Not Found';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnAddRiskMitigation(requisitionNo: Code[10]; riskId: Integer; mitigationStrat: Text; riskAction: Text; Officer: Text; actionStatus: Code[10]; docType: Integer; ttimeLine: Text) status: Text
    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        RiskManagementPlan.Reset;
        RiskManagementPlan.SetRange("Document No", requisitionNo);
        if RiskManagementPlan.FindSet then begin
            RMPLineResponseAction.Init;
            RMPLineResponseAction."Risk ID" := riskId;
            RMPLineResponseAction."Document No" := requisitionNo;
            if docType = 1 then
                RMPLineResponseAction."Document Type" := RMPLineResponseAction."document type"::Corporate;
            if docType = 2 then
                RMPLineResponseAction."Document Type" := RMPLineResponseAction."document type"::"Functional (Department)";
            RMPLineResponseAction."Risk Title" := RiskManagementPlanLine."Risk Title";
            RMPLineResponseAction."Responsible Officer No." := Officer;
            RMPLineResponseAction.Validate("Responsible Officer No.");
            RMPLineResponseAction."Risk Response Action Taken" := riskAction;
            RMPLineResponseAction."Activity Description" := mitigationStrat;
            RMPLineResponseAction."Risk Response Action Taken" := riskAction;
            if actionStatus = '1' then
                RMPLineResponseAction."Action Status" := RMPLineResponseAction."action status"::Planned;
            if actionStatus = '2' then
                RMPLineResponseAction."Action Status" := RMPLineResponseAction."action status"::Completed;
            if actionStatus = '3' then
                RMPLineResponseAction."Action Status" := RMPLineResponseAction."action status"::Ongoing;
            RMPLineResponseAction.Validate("Risk Response Action Taken");
            //  RMPLineResponseAction."Planned Due Date" := dueDate;
            //  RMPLineResponseAction.Timeline := ttimeLine;
            if RMPLineResponseAction.Insert(true) then begin
                status := 'success*The operation was successful';
            end else begin
                status := 'danger*The operation was unsuccessful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnAddRiskRegister(applicationNo: Code[10]; riskCat: Text; startPillars: Text; riskDesc: Text; risklikelihoodCode: Code[10]; riskActual: Decimal; timpactType: Text; timpactRating: Decimal; RiskImpactTyp: Integer; riskappetite: Text; GenRiskStrat: Text) status: Text
    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        RiskManagementPlan.Reset;
        RiskManagementPlan.SetRange("Document No", applicationNo);
        if RiskManagementPlan.FindSet then begin
            RiskManagementPlanLine.Init;
            RiskManagementPlanLine."Document No" := applicationNo;
            RiskManagementPlanLine."Document Type" := RiskManagementPlanLine."document type"::"Functional (Department)";
            RiskManagementPlanLine."Risk Category" := riskCat;
            RiskManagementPlanLine."Strategic Pillar Description" := startPillars;
            RiskManagementPlanLine."Risk Title" := riskDesc;
            RiskManagementPlanLine."Risk Likelihood Code" := risklikelihoodCode;
            RiskManagementPlanLine."Risk Likelihood Rating" := riskActual;
            RiskManagementPlanLine."Risk Likelihood Code" := timpactType;
            RiskManagementPlanLine."Risk Impact Actual Rating" := timpactRating;
            RiskManagementPlanLine."Risk Impact Type" := RiskImpactTyp;
            RiskManagementPlanLine."Risk Appetite" := riskappetite;
            //RiskManagementPlanLine."Risk Impact Codes" := impactCodes;
            RiskManagementPlanLine."Gen. Risk Response Strategy" := GenRiskStrat;

            if RiskManagementPlanLine.Insert(true) then begin
                status := 'success*The operation was successful';
            end else begin
                status := 'danger*The operation was not successful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure CreateRiskRegisterDivision(requisitionNo: Code[10]; DivisionCode: Code[10]; csp: Code[10]; consolidated: Code[10]; yearCode: Code[10]; Officer: Code[10]; detailedNarration: Text) status: Text
    var
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        // RiskManagementPlan.RESET;
        // RiskManagementPlan.SETRANGE("Document No",requisitionNo);
        // IF RiskManagementPlan.FINDSET THEN BEGIN
        //  RiskManagementPlan."Department ID" := DivisionCode;
        //  RiskManagementPlan."Corporate Strategic Plan ID" := csp;
        //  RiskManagementPlan."Consolidated Risk Mgt Plan No" := consolidated;
        //  RiskManagementPlan."Year Code" := yearCode;
        //  RiskManagementPlan."Responsible Officer No." := Officer;
        //  RiskManagementPlan.VALIDATE("Responsible Officer No.");
        //  IF RiskManagementPlan.MODIFY(true) THEN BEGIN
        //    status := 'success*Risk edited successfully';
        //  END
        //  END ELSE BEGIN
        RiskManagementPlan.Init;
        //RiskManagementPlan."Document No" := requisitionNo;
        RiskManagementPlan."Document Type" := RiskManagementPlan."document type"::"Functional (Department)";
        RiskManagementPlan."Department ID" := DivisionCode;
        RiskManagementPlan."Corporate Strategic Plan ID" := csp;
        RiskManagementPlan."Consolidated Risk Mgt Plan No" := consolidated;
        RiskManagementPlan."Year Code" := yearCode;
        RiskManagementPlan."Responsible Officer No." := Officer;
        RiskManagementPlan."Detailed Naration" := detailedNarration;
        RiskManagementPlan.Validate("Responsible Officer No.");

        if RiskManagementPlan.Insert(true) then begin
            status := 'success*The operation was successful*' + RiskManagementPlan."Document No";
        end else begin
            status := 'danger*The operation was not successful'
            //  END
        end;
    end;

    procedure CreateRiskStatusReport(requisitionNo: Text; empNo: Code[10]; riskRegisterType: Integer; RiskMngt: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
        RiskManagement: Codeunit "Risk Management";
        RiskStatusReportLine: Record "Risk Status Report Line";
        RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action";
    begin
        RiskMEHeader.Init;
        //RiskMEHeader."Document No" := requisitionNo;
        RiskMEHeader."Document Type" := RiskMEHeader."document type"::"Risk Status Report";
        RiskMEHeader.Status := RiskMEHeader.Status::Open;
        RiskMEHeader."Responsible Officer No." := empNo;
        if riskRegisterType = 1 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::Corporate;
        if riskRegisterType = 2 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::"Functional (Directorate)";
        if riskRegisterType = 3 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::"Functional (Department)";
        if riskRegisterType = 4 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::Project;
        RiskMEHeader."Risk Management Plan ID" := RiskMngt;
        if RiskMEHeader.Insert(true) then begin
            RiskManagement.FnSuggestOpenRisks(RiskStatusReportLine, RiskMEHeader);
            RiskManagement.FnSuggestOpenRSRRiskResponseActionStatus(RiskStatusReportLine, RiskMEHeader, RiskStatusRptRespAction);
            status := 'success*Risk added successfully*' + RiskMEHeader."Document No";
        end else begin
            status := 'danger* The operation was unsuccessful';
        end

    end;

    procedure CreateNewIncodentLog(empNo: Code[10]; requisitionNo: Code[10]; strategicplanno: Integer; funcionalworkplan: Code[10]; RiskId: Integer; RiskDescription: Code[10]; riskVategory: Text; severityLevel: Code[10]; dateIncident: Date; timeIncident: Time; OccurrenceType: Integer; incidentLocations: Text; rootCauseSumm: Code[10]; categoryOfPerson: Integer; reportedBy: Code[10]; responsibilityCenter: Code[10]; EscalationOfficer: Code[10]) status: Text
    var
        RiskIncidentLog: Record "Risk Incident Log";
        RiskManagementPlan: Record "Risk Management Plan";
        RiskManagement: Codeunit "Risk Management";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", requisitionNo);
        if RiskIncidentLog.FindSet then begin
            RiskIncidentLog.Reset;
            if strategicplanno = 1 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::Corporate;
            if strategicplanno = 2 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::"Functional (CEO)";
            if strategicplanno = 3 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::"Functional (Department)";
            if strategicplanno = 4 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::Project;
            RiskIncidentLog.Status := RiskIncidentLog.Status::Open;
            RiskIncidentLog."Risk Management Plan ID" := funcionalworkplan;
            RiskIncidentLog.DocumentCreator := empNo;
            RiskIncidentLog."Risk ID" := RiskId;
            RiskIncidentLog."Risk Description" := RiskDescription;
            RiskIncidentLog."Risk Incident Category" := riskVategory;
            RiskIncidentLog."Severity Level" := severityLevel;
            RiskIncidentLog."Incident Date" := dateIncident;
            RiskIncidentLog."Incident Time" := timeIncident;
            if OccurrenceType = 1 then
                RiskIncidentLog."Occurrence Type" := RiskIncidentLog."occurrence type"::Occurred;
            if OccurrenceType = 2 then
                RiskIncidentLog."Occurrence Type" := RiskIncidentLog."occurrence type"::"Near-Miss";
            RiskIncidentLog."Incident Location Details" := incidentLocations;
            //RiskIncidentLog."Primary Trigger ID" := primTrigger ;
            RiskIncidentLog."Root Cause Summary" := rootCauseSumm;
            if categoryOfPerson = 6 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Anonymous;
            if categoryOfPerson = 2 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Contractor Employee";
            if categoryOfPerson = 1 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Internal Employee";
            if categoryOfPerson = 7 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Other;
            if categoryOfPerson = 5 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Public;
            if categoryOfPerson = 3 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Subcontractor Employee";
            if categoryOfPerson = 4 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Visitor;
            RiskIncidentLog."Reported By (Name)" := reportedBy;
            RiskIncidentLog."Department ID" := responsibilityCenter;
            if (EscalationOfficer <> '') then begin
                RiskIncidentLog."Escalate to Officer No" := EscalationOfficer;
                RiskIncidentLog.Validate("Escalate to Officer No");
                //RiskIncidentLog."Escalated?":=TRUE;
                RiskManagement.FNnotifyEscalator(RiskIncidentLog);
            end;

            if RiskIncidentLog.Modify(true) then begin
                status := 'success*The incident was successfully edited*';
            end else begin
                status := 'danger*The operation was not successful'
            end

        end else begin

            RiskIncidentLog.Init;
            if strategicplanno = 1 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::Corporate;
            if strategicplanno = 2 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::"Functional (CEO)";
            if strategicplanno = 3 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::"Functional (Department)";
            if strategicplanno = 4 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::Project;
            RiskIncidentLog.Status := RiskIncidentLog.Status::Open;
            RiskIncidentLog."Risk Management Plan ID" := funcionalworkplan;
            RiskIncidentLog.DocumentCreator := empNo;
            RiskIncidentLog."Risk ID" := RiskId;
            RiskIncidentLog."Risk Description" := RiskDescription;
            RiskIncidentLog."Risk Incident Category" := riskVategory;
            RiskIncidentLog."Severity Level" := severityLevel;
            RiskIncidentLog."Incident Date" := dateIncident;
            RiskIncidentLog."Incident Time" := timeIncident;
            if OccurrenceType = 1 then
                RiskIncidentLog."Occurrence Type" := RiskIncidentLog."occurrence type"::Occurred;
            if OccurrenceType = 2 then
                RiskIncidentLog."Occurrence Type" := RiskIncidentLog."occurrence type"::"Near-Miss";
            RiskIncidentLog."Incident Location Details" := incidentLocations;
            //RiskIncidentLog."Primary Trigger ID" := primTrigger ;
            RiskIncidentLog."Root Cause Summary" := rootCauseSumm;
            if categoryOfPerson = 6 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Anonymous;
            if categoryOfPerson = 2 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Contractor Employee";
            if categoryOfPerson = 1 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Internal Employee";
            if categoryOfPerson = 7 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Other;
            if categoryOfPerson = 5 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Public;
            if categoryOfPerson = 3 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Subcontractor Employee";
            if categoryOfPerson = 4 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Visitor;
            RiskIncidentLog."Reported By (Name)" := reportedBy;
            RiskIncidentLog."Department ID" := responsibilityCenter;
            if (EscalationOfficer <> '') then begin
                RiskIncidentLog."Escalate to Officer No" := EscalationOfficer;
                RiskIncidentLog.Validate("Escalate to Officer No");
                RiskIncidentLog."Escalated?" := true;
                RiskManagement.FNnotifyEscalator(RiskIncidentLog);
            end;

            if RiskIncidentLog.Insert(true) then begin
                status := 'success*The operation was successful*' + RiskIncidentLog."Incident ID";
            end else begin
                status := 'danger*The operation was not successful'
            end
        end
    end;

    procedure PostDivisionRegister(applicationNo: Code[10]) status: Text
    var
        RMPLine: Record "Risk Management Plan Line";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RMPLineResponse: Record "RMP Line Response Action";
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAct: Record "RMP Line Response Action";
        RMPLineRisk: Record "RMP Line Risk Ownership";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        RiskManagementPlan.Reset;
        RiskManagementPlan.SetRange("Document No", applicationNo);
        RMPLine.Reset;
        RMPLine.SetRange(RMPLine."Document No", applicationNo);
        if RMPLine.FindSet then begin
            repeat
                RiskManagementPlanLine.Init;
                RiskManagementPlanLine.TransferFields(RMPLine);
                RiskManagementPlanLine."Document Type" := RiskManagementPlanLine."document type"::Corporate;
                RiskManagementPlanLine."Document No" := RiskManagementPlan."Consolidated Risk Mgt Plan No";
                if not RiskManagementPlanLine.Insert(true) then
                    RiskManagementPlanLine.Modify(true);
            until RMPLine.Next = 0;
        end;

        RMPLineResponse.Reset;
        RMPLineResponse.SetRange(RMPLineResponse."Document No", applicationNo);
        if RMPLineResponse.FindSet then begin
            repeat
                RMPLineResponseAct.Init;
                RMPLineResponseAct.TransferFields(RMPLineResponse);
                RMPLineResponseAct."Document Type" := RMPLineResponseAct."document type"::Corporate;
                RMPLineResponseAct."Document No" := RiskManagementPlan."Consolidated Risk Mgt Plan No";
                if not RMPLineResponseAct.Insert(true) then
                    RMPLineResponseAct.Modify(true);
            until RMPLineResponse.Next = 0;
        end;

        RMPLineRisk.Reset;
        RMPLineRisk.SetRange(RMPLineRisk."Document No", applicationNo);
        if RMPLineRisk.FindSet then begin
            repeat
                RMPLineRiskOwnership.Init;
                RMPLineRiskOwnership.TransferFields(RMPLineRisk);
                RMPLineRiskOwnership."Document Type" := RMPLineRiskOwnership."document type"::Corporate;
                RMPLineRiskOwnership."Document No" := RiskManagementPlan."Consolidated Risk Mgt Plan No";
                if not RMPLineRiskOwnership.Insert(true) then
                    RMPLineRiskOwnership.Modify(true);
            until RMPLineRisk.Next = 0;
        end;
        status := 'success*Register consolidated successfully';
    end;

    procedure DeleteRisk(requisitionNo: Code[10]; LineNo: Code[10]) status: Text
    begin
    end;

    procedure AddEscalatedRiskResponse(riskID: Code[10]; response: Text) status: Text
    var
        RiskIncidentLog: Record "Risk Incident Log";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", riskID);
        if RiskIncidentLog.FindSet then begin
            RiskIncidentLog.Response := response;
            RiskIncidentLog.Posted := true;
            if RiskIncidentLog.Modify(true) then begin
                status := 'success*Response has been added successfully';
            end else begin
                status := 'danger*Response addition was unsuccessful';
            end
        end else begin
            status := 'danger*Risk could not be found';
        end
    end;

    procedure CreateNewRiskVoucher(requisitionNo: Text; empNo: Code[10]; riskRegisterType: Integer; RiskMngt: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
    begin
        RiskMEHeader.Init;
        RiskMEHeader.DocumentCreator := empNo;
        RiskMEHeader."Document Type" := RiskMEHeader."document type"::"New Risk Voucher";
        if riskRegisterType = 1 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::Corporate;
        if riskRegisterType = 2 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::"Functional (Directorate)";
        if riskRegisterType = 3 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::"Functional (Department)";
        if riskRegisterType = 4 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::Project;
        //RiskMEHeader."Responsible Officer No." := empNo;
        RiskMEHeader."Risk Management Plan ID" := RiskMngt;


        if RiskMEHeader.Insert(true) then begin
            status := 'success*The operation was successful*' + RiskMEHeader."Document No";
        end else begin
            status := 'danger*The operation was unsuccessful';
        end
    end;

    procedure GeneratenewVoucher(docNo: Integer) status: Text
    begin
    end;

    procedure FnAddemergingRisk(applicationNo: Text; riskCat: Text; startPillars: Text; riskDesc: Text; risklikelihoodCode: Code[10]; riskActual: Decimal; impactType: Text; impactRating: Decimal; RiskImpactTyp: Integer; riskappetite: Text; GenRiskStrat: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
    begin
        RiskMEHeader.Reset;
        RiskMEHeader.SetRange("Document No", applicationNo);
        if NewRiskVoucherLine.FindSet then begin
            NewRiskVoucherLine.Init;
            NewRiskVoucherLine."Document No" := applicationNo;
            NewRiskVoucherLine."Document Type" := RiskMEHeader."Document Type";
            NewRiskVoucherLine."Risk Category" := riskCat;
            NewRiskVoucherLine."Risk Source ID" := startPillars;
            NewRiskVoucherLine."Risk Title" := riskDesc;
            NewRiskVoucherLine."Risk Likelihood Code" := risklikelihoodCode;
            NewRiskVoucherLine."Risk Likelihood Rating" := riskActual;
            NewRiskVoucherLine."Risk Likelihood Code" := impactType;
            NewRiskVoucherLine."Risk Impact Actual Rating" := impactRating;
            if impactRating = 1 then
                NewRiskVoucherLine."Risk Impact Type" := NewRiskVoucherLine."risk impact type"::Negative;
            if impactRating = 2 then
                NewRiskVoucherLine."Risk Impact Type" := NewRiskVoucherLine."risk impact type"::Positive;
            NewRiskVoucherLine."Risk Appetite Rating Scale ID" := riskappetite;
            //NewRiskVoucherLine."Risk Impact Code" := impactCodes;
            NewRiskVoucherLine."Gen. Risk Response Strategy" := GenRiskStrat;

            if NewRiskVoucherLine.Insert(true) then begin
                status := 'success*The operation was successful';
            end else begin
                status := 'danger*The operation was not successful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnAddRiskOwnershipVoucher(requisitionNo: Text; riskId: Integer; tresponsibilityCenter: Text; tOfficer: Text) status: Text
    var
        NewRiskLineOwnership: Record "New Risk Line Ownership";
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
    begin
        RiskMEHeader.Reset;
        //FnAddRiskOwnership('CRMP0021',125,'EXAM','00073')
        RiskMEHeader.SetRange("Document No", requisitionNo);
        if RiskMEHeader.FindSet then begin
            NewRiskVoucherLine.Reset;
            NewRiskVoucherLine.SetRange("Document No", requisitionNo);
            NewRiskVoucherLine.SetRange("Risk ID", riskId);
            if NewRiskVoucherLine.FindSet then begin
                NewRiskLineOwnership.Init;
                //NewRiskLineOwnership.Desciption:= RiskManagementPlanLine."Risk Title";
                NewRiskLineOwnership."Document Type" := NewRiskLineOwnership."document type"::"New Risk Voucher";
                NewRiskLineOwnership."Document No" := requisitionNo;
                NewRiskLineOwnership."Risk ID" := riskId;
                NewRiskLineOwnership."Responsibility Center ID" := tresponsibilityCenter;
                NewRiskLineOwnership.Validate("Responsibility Center ID");
                NewRiskLineOwnership."Responsible Officer No." := tOfficer;
                NewRiskLineOwnership.Validate("Responsible Officer No.");
                if NewRiskLineOwnership.Insert(true) then begin
                    status := 'success*Officer added successfully';
                end else begin
                    status := 'danger*The operation was unsuccessful';
                end
            end else begin
                status := 'danger*Risk Not Found';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnAddRiskResponseVoucher(requisitionNo: Text; riskId: Integer; mitigationStrat: Text; riskAction: Text; Officer: Text; actionStatus: Code[10]; ttimelines: Text) status: Text
    var
        NewRiskLineRespAction: Record "New Risk Line Resp. Action";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskMEHeader: Record "Risk M&E Header";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange("Document No", requisitionNo);
        if NewRiskVoucherLine.FindSet then begin
            NewRiskLineRespAction.Init;
            NewRiskLineRespAction."Risk ID" := riskId;
            NewRiskLineRespAction."Document No" := requisitionNo;
            NewRiskLineRespAction."Document Type" := NewRiskLineRespAction."document type"::"Functional (Department)";
            //NewRiskLineRespAction.Risk := NewRiskVoucherLine."Risk Title";
            NewRiskLineRespAction."Responsible Officer No." := Officer;
            NewRiskLineRespAction.Validate("Responsible Officer No.");
            NewRiskLineRespAction."Risk Response Action Taken" := riskAction;
            NewRiskLineRespAction."Activity Description" := mitigationStrat;
            NewRiskLineRespAction."Risk Response Action Taken" := riskAction;
            if actionStatus = '1' then
                NewRiskLineRespAction."Action Status" := NewRiskLineRespAction."action status"::Planned;
            if actionStatus = '2' then
                NewRiskLineRespAction."Action Status" := NewRiskLineRespAction."action status"::Completed;
            if actionStatus = '3' then
                NewRiskLineRespAction."Action Status" := NewRiskLineRespAction."action status"::Ongoing;
            NewRiskLineRespAction.Validate("Risk Response Action Taken");
            // NewRiskLineRespAction."Planned Due Date" := dueDate;
            //  NewRiskLineRespAction.Timeline := ttimelines;
            if NewRiskLineRespAction.Insert(true) then begin
                status := 'success*The operation was successful';
            end else begin
                status := 'danger*The operation was unsuccessful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure CreateIncidentSummery(empNo: Code[10]; requisitionNo: Code[10]; timpactType: Integer; tdescription: Text; tpersonAffected: Integer; tOfficer: Text; tcontactDetails: Text; tadditionalComments: Text; tpoliceReport: Text; treportDate: Date; tpoliceStation: Text; tReportingOfficer: Text) status: Text
    var
        RiskIncidentLogImpactR: Record "Risk Incident Log Impact R";
        RiskIncidentLog: Record "Risk Incident Log";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", requisitionNo);
        if RiskIncidentLog.FindSet then begin
            RiskIncidentLogImpactR.Init;
            RiskIncidentLogImpactR."Incident No" := requisitionNo;
            RiskIncidentLogImpactR."Impact Type" := timpactType;
            RiskIncidentLogImpactR.Description := tdescription;
            RiskIncidentLogImpactR."Reporting Officer" := tOfficer;
            RiskIncidentLogImpactR."Contact Details" := tcontactDetails;
            RiskIncidentLogImpactR."Additional Comments" := tadditionalComments;
            RiskIncidentLogImpactR."Police Report Reference No." := tpoliceReport;
            RiskIncidentLogImpactR."Police Station" := tpoliceStation;
            RiskIncidentLogImpactR."Police Report Date" := treportDate;
            if tpersonAffected = 1 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::"Internal Employee";
            if tpersonAffected = 2 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::"Contractor Employee";
            if tpersonAffected = 3 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::"Subcontractor Employee";
            if tpersonAffected = 4 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::Visitor;
            if tpersonAffected = 5 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::Public;
            if tpersonAffected = 6 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::Anonymous;
            if tpersonAffected = 7 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::Other;
            RiskIncidentLogImpactR."Internal Employee No." := empNo;

            if RiskIncidentLogImpactR.Insert(true) then begin
                status := 'success*Incident Summary added successfully';
            end else begin
                status := 'danger*Incident was not added successfully';
            end

        end else begin
            status := 'danger*Incident was not found';
        end
    end;

    procedure GenerateStatusPeriod(docno: Text) status: Text
    var
        RiskIncidentLog: Record "Risk Incident Log";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", docno);
        if RiskIncidentLog.FindSet then begin
            // if FILE.Exists(FILESPATH96 + docno + '.pdf') then begin
            //     FILE.Erase(FILESPATH96 + docno + '.pdf');
            //     //Report.SaveAsPdf(95025, FILESPATH96 + docno + '.pdf', RiskIncidentLog);
            //     status := 'success*Generated*Downloads\IncidentLogReport\' + docno + '.pdf';
            // end else begin
            //     //Report.SaveAsPdf(95025, FILESPATH96 + docno + '.pdf', RiskIncidentLog);
            //     status := 'success*Generated*Downloads\IncidentLogReport\' + docno + '.pdf';
            // end
        end else begin
            status := 'danger*Document not found';
        end;
    end;

    procedure GeneratePeriodicPrintout(docno: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
    begin
        RiskMEHeader.Reset;
        RiskMEHeader.SetRange("Document No", docno);
        if RiskMEHeader.FindSet then begin
            // if FILE.Exists(FILESPATH97 + docno + '.pdf') then begin
            //     FILE.Erase(FILESPATH97 + docno + '.pdf');
            //     //Report.SaveAsPdf(95007, FILESPATH97 + docno + '.pdf', RiskMEHeader);
            //     status := 'success*Generated*Downloads\StatusReport\' + docno + '.pdf';
            // end else begin
            //     //Report.SaveAsPdf(95007, FILESPATH97 + docno + '.pdf', RiskMEHeader);
            //     status := 'success*Generated*Downloads\StatusReport\' + docno + '.pdf';
            // end
        end else begin
            status := 'danger*Document not found';
        end;
    end;

    procedure FnPostRiskStatusReport(docno: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
        RiskManagement: Codeunit "Risk Management";
    begin
        RiskMEHeader.Reset;
        RiskMEHeader.SetRange("Document No", docno);
        if RiskMEHeader.FindSet then begin
            RiskManagement.FnUpdateRMPFromRSR(RiskMEHeader);
            RiskManagement.FnUpdateRiskOwnership(RiskMEHeader);
            RiskManagement.FnUpdateRiskResponseActionsRSR(RiskMEHeader);
            RiskMEHeader.Posted := true;
            RiskMEHeader."Posting Date" := Today;

            if RiskMEHeader.Modify(true) then begin
                status := 'success*Submitted Successfully'
            end else begin
                status := 'danger*An error occured while submitting';
            end
        end else begin
            status := 'danger*Document Not found';
        end
    end;

    procedure FnAddNewRiskAction(docno: Text; "action": Text; requisitionNo: Text; tactionID: Integer; triskID: Integer; ttimeLine: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RMPLineResponseAction2: Record "RMP Line Response Action";
    begin
        RMPLineResponseAction.Reset;
        RMPLineResponseAction.SetRange("Document No", requisitionNo);
        RMPLineResponseAction.SetRange("Action ID", tactionID);
        RMPLineResponseAction.SetRange("Risk ID", triskID);
        if RMPLineResponseAction.FindSet then begin
            //    RMPLineResponseAction2.INIT;
            //    RMPLineResponseAction2."Document Type" := RMPLineResponseAction."Document Type";
            //    RMPLineResponseAction2."Document No" := RMPLineResponseAction."Document No";
            //    RMPLineResponseAction2."Risk Response Action Taken" := action ;
            //    RMPLineResponseAction2.VALIDATE("Risk Response Action Taken");
            //    RMPLineResponseAction2."Risk ID" := RMPLineResponseAction."Risk ID" ;
            //    RMPLineResponseAction2."Risk Title" := RMPLineResponseAction."Risk Title";
            //    RMPLineResponseAction2."Activity Description" := RMPLineResponseAction."Activity Description";
            //    RMPLineResponseAction2."Responsible Officer No." := RMPLineResponseAction."Responsible Officer No." ;
            //    RMPLineResponseAction2.VALIDATE("Responsible Officer No.");
            //    RMPLineResponseAction2."Planned Due Date" := RMPLineResponseAction."Planned Due Date";
            //    RMPLineResponseAction2."Action Status":=  RMPLineResponseAction."Action Status"::Ongoing;
            RMPLineResponseAction."Risk Response Action Taken" := action;
            RMPLineResponseAction.Validate("Risk Response Action Taken");
            // RMPLineResponseAction.Timeline := ttimeLine;
            if RMPLineResponseAction.Modify(true) then begin
                status := 'success*Action response edited succcessfully';

                //    IF RMPLineResponseAction2.INSERT(TRUE) THEN BEGIN
                //      status := 'success*Action response added succcessfully';
            end else begin
                status := 'danger*An error occured when adding response';
            end
        end else begin
            status := 'danger*Response could not be found';
        end;
    end;

    procedure CloseRisk(employeeName: Text; requisitionNo: Text; tLineNo: Integer; tplanID: Text) status: Text
    var
        RiskStatusReportLine: Record "Risk Status Report Line";
    begin
        RiskStatusReportLine.Reset;
        RiskStatusReportLine.SetRange("Document No", requisitionNo);
        RiskStatusReportLine.SetRange("Risk ID", tLineNo);
        RiskStatusReportLine.SetRange("Risk Management Plan ID", tplanID);
        if RiskStatusReportLine.FindSet then begin
            RiskStatusReportLine."Risk Status" := RiskStatusReportLine."risk status"::Closed;
            RiskStatusReportLine."Date Closed" := Today;
            if RiskStatusReportLine.Modify(true) then begin
                status := 'success*The risk was closed successfully';
            end else begin
                status := 'danger*An error occured while closing the risk';
            end
        end else begin
            status := 'danger*Document not found';
        end
    end;

    procedure DeleteIncidentLine(requisitionNo: Text; tLineNo: Integer) status: Text
    var
        RiskIncidentLogImpactR: Record "Risk Incident Log Impact R";
    begin
        RiskIncidentLogImpactR.Reset;
        RiskIncidentLogImpactR.SetRange("Incident No", requisitionNo);
        RiskIncidentLogImpactR.SetRange("Line No", tLineNo);
        if RiskIncidentLogImpactR.FindSet then begin
            if RiskIncidentLogImpactR.Delete(true) then begin
                status := 'success*The incident was deleted successfully';
            end else begin
                status := 'danger*AN error occured while deleting the incident';
            end
        end else begin
            status := 'danger*The incident was no found';
        end
    end;

    procedure FnAddPeriodicStatusOwnership(requisitionNo: Text; riskId: Integer; responsibilityCenter: Text; Officer: Text) status: Text
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RiskMEHeader: Record "Risk M&E Header";
        RiskStatusReportLine: Record "Risk Status Report Line";
    begin
        RiskMEHeader.Reset;
        RiskMEHeader.SetRange("Document No", requisitionNo);
        if RiskMEHeader.FindSet then begin
            RiskStatusReportLine.Reset;
            RiskStatusReportLine.SetRange("Document No", requisitionNo);
            RiskStatusReportLine.SetRange("Risk ID", riskId);
            if RiskStatusReportLine.FindSet then begin
                RMPLineRiskOwnership.Init;
                RMPLineRiskOwnership."Risk Title" := RiskStatusReportLine."Risk Title";
                RMPLineRiskOwnership."Document Type" := RiskStatusReportLine."Document Type";
                RMPLineRiskOwnership."Document No" := requisitionNo;
                RMPLineRiskOwnership."Risk ID" := riskId;
                RMPLineRiskOwnership."Responsibility Center ID" := responsibilityCenter;
                RMPLineRiskOwnership.Validate("Responsibility Center ID");
                RMPLineRiskOwnership."Responsible Officer No." := Officer;
                RMPLineRiskOwnership.Validate("Responsible Officer No.");
                if RMPLineRiskOwnership.Insert(true) then begin
                    status := 'success*Officer added successfully';
                end else begin
                    status := 'danger*The operation was unsuccessful';
                end
            end else begin
                status := 'danger*Risk Not Found';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure DeleteRiskVoucher(requisitionNo: Code[50]; tLineNo: Integer) status: Text
    var
        NewRiskVoucherLine: Record "New Risk Voucher Line";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange("Document No", requisitionNo);
        NewRiskVoucherLine.SetRange("Risk ID", tLineNo);
        if NewRiskVoucherLine.FindSet then begin
            if NewRiskVoucherLine.Delete(true) then begin
                status := 'success*The risk was deleted successfully';
            end else begin
                status := 'danger*the risk could not be deleted';
            end

        end else begin
            status := 'danger*The risk could not be found';
        end
    end;

    procedure PostRiskVoucher(appNo: Code[50]) status: Text
    begin
    end;
}

