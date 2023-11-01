#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85196 "Script Dispatch Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Script Dispatch Form.rdlc';

    dataset
    {
        dataitem(HD;"Scripts Dispatch Header")
        {
            column(ReportForNavId_35; 35)
            {
            }
            column(eXAM;eXAM)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_HD;HD."Document No.")
            {
            }
            column(Description_HD;HD.Description)
            {
            }
            column(ProjectNo_HD;HD."Project No.")
            {
            }
            column(ProjectName_HD;HD."Project Name")
            {
            }
            column(SittingCycle_HD;HD."Sitting Cycle")
            {
            }
            column(CenterCode_HD;HD."Center Code")
            {
            }
            column(CenterName_HD;HD."Center Name")
            {
            }
            column(ApprovalStatus_HD;HD."Approval Status")
            {
            }
            column(DocumentStatus_HD;HD."Document Status")
            {
            }
            column(CreatedBy_HD;HD."Created By")
            {
            }
            column(CreatedOn_HD;HD."Created On")
            {
            }
            column(Signature;UserSetup.Picture)
            {
            }
            column(Signature_Name;UserSetup."Employee Name")
            {
            }
            column(Posted_HD;HD.Posted)
            {
            }
            column(PostedOn_HD;HD."Posted On")
            {
            }
            column(PostedBy_HD;HD."Posted By")
            {
            }
            column(NoSeries_HD;HD."No. Series")
            {
            }
            column(ExaminationStartDate_HD;HD."Examination Start Date")
            {
            }
            column(ExaminationEndDate_HD;HD."Examination End Date")
            {
            }
            column(TotalCandidature_HD;HD."Total Candidature.00")
            {
            }
            column(DocumentType_HD;HD."Document Type")
            {
            }
            column(MarkingStartDate_HD;HD."Marking Start Date")
            {
            }
            column(MarkingEndDate_HD;HD."Marking End Date")
            {
            }
            column(Examination_HD;HD.Examination)
            {
            }
            column(PaperCode_HD;HD."Paper Code")
            {
            }
            column(PaperName_HD;HD."Paper Name")
            {
            }
            column(MarkerNo_HD;HD."Marker No")
            {
            }
            column(MarkerName_HD;HD."Marker Name")
            {
            }
            dataitem(LN;"Scripts Dispatch Lines")
            {
                DataItemLink = "Document No."=field("Document No.");
                column(ReportForNavId_27; 27)
                {
                }
                column(DocumentNo_LN;LN."Document No.")
                {
                }
                column(Examination_LN;LN.Examination)
                {
                }
                column(PaperCode_LN;LN."Paper Code")
                {
                }
                column(PaperName_LN;LN."Paper Name")
                {
                }
                column(NoofScriptsExpected_LN;LN."No. of Scripts Expected")
                {
                }
                column(EnvelopeSerialNo_LN;LN."Envelope Serial No.")
                {
                }
                column(QuantityReceived_LN;LN."No. of Envelope Scripts")
                {
                }
                column(NoofEnvelopes_LN;LN."No. of Envelopes")
                {
                }
                column(NoofScriptsReturned_LN;LN."No. of Scripts Returned")
                {
                }
                column(ExaminationSitting_LN;LN."Examination Sitting")
                {
                }
                column(CenterCode_LN;LN."Center Code")
                {
                }
                column(CenterName_LN;LN."Center Name")
                {
                }
                column(MarkingComplete_LN;LN."Marking Complete")
                {
                }
                column(MarksheetIssued_LN;LN."Marksheet Issued")
                {
                }
                column(MarksheetReturned_LN;LN."Marksheet Returned")
                {
                }
                column(MarksDistribution_LN;LN."Marks Distribution")
                {
                }
                column(MarkingScheme_LN;LN."Marking Scheme")
                {
                }
                column(ExaminerReport_LN;LN."Examiner Report")
                {
                }
                column(Variance_LN;LN.Variance)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                if Courses.Get(HD.Examination) then begin
                  eXAM:=Courses.Description;
                  end;
                  UserSetup.Reset;
                  UserSetup.SetRange("User ID",HD."Created By");
                  if UserSetup.FindFirst then begin
                    UserSetup.CalcFields(Picture);
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        CenterCourseCapacity: Record "Center Course Capacity";
        LevelName: Text;
        Level: Record Level;
        LevelId: Integer;
        Courses: Record Courses;
        CourseName: Text;
        ScriptEnvelopeSerials: Record "Script Envelope Serials";
        EnvelopeValues: array [10,1] of Code[30];
        i: Integer;
        Papers: Record Papers;
        eXAM: Text[250];
        UserSetup: Record "User Setup";
}
