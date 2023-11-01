report 56050 "Escalate HelpDesk"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Escalate HelpDesk.rdlc';

    dataset
    {
        dataitem("ICT Helpdesk";"ICT Helpdesk")
        {
            DataItemTableView = WHERE(Status=FILTER(Pending));
            column(JobNo_ICTHelpdesk;"ICT Helpdesk"."Job No.")
            {
            }
            column(AssignedTo_ICTHelpdesk;"ICT Helpdesk"."Assigned To")
            {
            }
            column(AssignedDate_ICTHelpdesk;"ICT Helpdesk"."Assigned Date")
            {
            }
            column(AssignedTime_ICTHelpdesk;"ICT Helpdesk"."Assigned Time")
            {
            }
            column(Department_ICTHelpdesk;"ICT Helpdesk".Department)
            {
            }
            column(DepartmentName_ICTHelpdesk;"ICT Helpdesk"."Department Name")
            {
            }
            column(PhysicalStation_ICTHelpdesk;"ICT Helpdesk"."Physical Station")
            {
            }
            column(NatureofService_ICTHelpdesk;"ICT Helpdesk"."Nature of Service")
            {
            }
            column(EXT_ICTHelpdesk;"ICT Helpdesk".EXT)
            {
            }
            column(RequestingOfficer_ICTHelpdesk;"ICT Helpdesk"."Requesting Officer")
            {
            }
            column(RequestingOfficerName_ICTHelpdesk;"ICT Helpdesk"."Requesting Officer Name")
            {
            }
            column(Phone_ICTHelpdesk;"ICT Helpdesk".Phone)
            {
            }
            column(Email_ICTHelpdesk;"ICT Helpdesk".Email)
            {
            }
            column(RequestDate_ICTHelpdesk;"ICT Helpdesk"."Request Date")
            {
            }
            column(RequestTime_ICTHelpdesk;"ICT Helpdesk"."Request Time")
            {
            }
            column(ComputernotStartingup_ICTHelpdesk;"ICT Helpdesk"."Computer not Starting up")
            {
            }
            column(KeyboardMouseFailure_ICTHelpdesk;"ICT Helpdesk"."Keyboard, Mouse Failure")
            {
            }
            column(PrinterFailure_ICTHelpdesk;"ICT Helpdesk"."Printer Failure")
            {
            }
            column(UPSFailure_ICTHelpdesk;"ICT Helpdesk"."UPS Failure")
            {
            }
            column(LCDMonitorFailure_ICTHelpdesk;"ICT Helpdesk"."LCD /Monitor Failure")
            {
            }
            column(StorageDeviceFailure_ICTHelpdesk;"ICT Helpdesk"."Storage Device Failure")
            {
            }
            column(HardwareInstallation_ICTHelpdesk;"ICT Helpdesk"."Hardware Installation")
            {
            }
            column(OthersspecifyHW_ICTHelpdesk;"ICT Helpdesk"."Others, specify HW")
            {
            }
            column(ComputerRunningLoadingSlow_ICTHelpdesk;"ICT Helpdesk"."Computer Running /Loading Slow")
            {
            }
            column(NetworkAccessProblems_ICTHelpdesk;"ICT Helpdesk"."Network Access Problems")
            {
            }
            column(AntivirusInefficiency_ICTHelpdesk;"ICT Helpdesk"."Antivirus Inefficiency")
            {
            }
            column(Applications_ICTHelpdesk;"ICT Helpdesk".Applications)
            {
            }
            column(SoftwareInstallation_ICTHelpdesk;"ICT Helpdesk"."Software Installation")
            {
            }
            column(OthersspecifySW_ICTHelpdesk;"ICT Helpdesk"."Others, specify SW")
            {
            }
            column(Diagnosis_ICTHelpdesk;"ICT Helpdesk".Diagnosis)
            {
            }
            column(ActionTaken_ICTHelpdesk;"ICT Helpdesk"."Action Taken")
            {
            }
            column(AttendedBy_ICTHelpdesk;"ICT Helpdesk"."Attended By")
            {
            }
            column(AttendedDate_ICTHelpdesk;"ICT Helpdesk"."Attended Date")
            {
            }
            column(AttendedTime_ICTHelpdesk;"ICT Helpdesk"."Attended Time")
            {
            }
            column(TechnicalStaffRemarks_ICTHelpdesk;"ICT Helpdesk"."Technical Staff Remarks")
            {
            }
            column(RequestingOfficerRemarks_ICTHelpdesk;"ICT Helpdesk"."Requesting Officer Remarks")
            {
            }
            column(AttendedbyName_ICTHelpdesk;"ICT Helpdesk"."Attended by Name")
            {
            }
            column(Status_ICTHelpdesk;"ICT Helpdesk".Status)
            {
            }
            column(NoSeries_ICTHelpdesk;"ICT Helpdesk"."No. Series")
            {
            }
            column(ICTIssueCategory_ICTHelpdesk;"ICT Helpdesk"."ICT Issue Category")
            {
            }
            column(EscalatedTo_ICTHelpdesk;"ICT Helpdesk"."Escalated To")
            {
            }
            column(EscalatedBy_ICTHelpdesk;"ICT Helpdesk"."Escalated By")
            {
            }
            column(EscalatedDate_ICTHelpdesk;"ICT Helpdesk"."Escalated Date")
            {
            }
            column(EscalatedTime_ICTHelpdesk;"ICT Helpdesk"."Escalated Time")
            {
            }
            column(RequesterFeedback_ICTHelpdesk;"ICT Helpdesk"."Requester Feedback")
            {
            }
            column(Reopened_ICTHelpdesk;"ICT Helpdesk".Reopened)
            {
            }
            column(ReopenedBy_ICTHelpdesk;"ICT Helpdesk"."Reopened By")
            {
            }
            column(FeedBackGiven_ICTHelpdesk;"ICT Helpdesk"."Feed Back Given")
            {
            }
            column(GlobalDimension1Code_ICTHelpdesk;"ICT Helpdesk"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_ICTHelpdesk;"ICT Helpdesk"."Global Dimension 2 Code")
            {
            }
            column(ShortcutDimension1Code_ICTHelpdesk;"ICT Helpdesk"."Shortcut Dimension 1 Code")
            {
            }
            column(RegionName_ICTHelpdesk;"ICT Helpdesk"."Region Name")
            {
            }
            column(ConstituencyName_ICTHelpdesk;"ICT Helpdesk"."Constituency Name")
            {
            }
            column(Descriptionoftheissue_ICTHelpdesk;"ICT Helpdesk"."Description of the issue")
            {
            }
            column(EmployeeNo_ICTHelpdesk;"ICT Helpdesk"."Employee No")
            {
            }
            column(AscalationDetails_ICTHelpdesk;"ICT Helpdesk"."Ascalation Details")
            {
            }
            column(AssignedToEmpNo_ICTHelpdesk;"ICT Helpdesk"."Assigned To EmpNo")
            {
            }
            column(EscalatedToEmpNo_ICTHelpdesk;"ICT Helpdesk"."Escalated To EmpNo")
            {
            }
            column(SolvedTime_ICTHelpdesk;"ICT Helpdesk"."Solved Time")
            {
            }
            column(IctHeadEscalation_ICTHelpdesk;"ICT Helpdesk"."Ict Head Escalation")
            {
            }
            column(ITEscalationDetails_ICTHelpdesk;"ICT Helpdesk"."IT Escalation Details")
            {
            }
            column(ITEscalationTime_ICTHelpdesk;"ICT Helpdesk"."IT Escalation Time")
            {
            }
            column(HelpDeskCategory_ICTHelpdesk;"ICT Helpdesk"."HelpDesk Category")
            {
            }

            trigger OnAfterGetRecord()
            begin
                if "ICT Helpdesk"."Expected Resolution">CurrentDateTime then begin

                //Notify the requester that the issue has been escalated
                 ObjComInfo.Get;
                 SenderEmailAddress:=ObjComInfo."Administrator Email";
                 SenderName:=CompanyName;
                 if UserSetup.Get("Requesting Officer") then
                 Recipient:=UserSetup."E-Mail";
                 Subject:='ICT ISSUE ESCALATION'+ ' '+"ICT Helpdesk"."Job No.";
                 Body:='Please note that the issue on the subject above has been escalated to '+ '  '+"Escalated To";
                 ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);

                //Notify the Escalted To that the issue has been escalated
                 ObjComInfo.Get;
                 SenderEmailAddress:=ObjComInfo."Administrator Email";
                 SenderName:=CompanyName;
                 UserSetup.Reset;
                 UserSetup.SetRange("ICT Administrator",true);
                 if UserSetup.FindFirst then begin

                 Recipient:=UserSetup."E-Mail";
                 Subject:='ICT ISSUE ESCALATION'+ ' '+"ICT Helpdesk"."Job No.";
                 Body:='Please note that the issue on the subject above has been escalated to you. ';
                 ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);
                 end;
                 "ICT Helpdesk"."Escalated To":=UserSetup."User ID";
                 "ICT Helpdesk"."Escalated Date":=Today;
                 "ICT Helpdesk"."Escalated Time":=Time;
                 "ICT Helpdesk"."Escalated To EmpNo":=UserSetup."Employee No.";
                 "ICT Helpdesk".Status:="ICT Helpdesk".Status::Escalated;
                 "ICT Helpdesk".Modify(true);
                  end
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        ICTHelpdeskCategory: Record "ICT Helpdesk Category";
        ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
}

