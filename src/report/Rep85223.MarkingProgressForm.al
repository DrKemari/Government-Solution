#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85223 "Marking Progress Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Marking Progress Form.rdlc';

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
            dataitem(LN;"Marking Progress Lines")
            {
                DataItemLink = "Document No"=field("Document No.");
                column(ReportForNavId_27; 27)
                {
                }
                column(Code_LN;LN.Code)
                {
                }
                column(Course_LN;LN.Course)
                {
                }
                column(Section_LN;LN.Section)
                {
                }
                column(Level_LN;LN.Level)
                {
                }
                column(Description_LN;LN.Description)
                {
                }
                column(NoofPassedStudents_LN;LN."No. of Passed Students")
                {
                }
                column(NoofFailedStudents_LN;LN."No. of  Failed Students")
                {
                }
                column(Blocked_LN;LN.Blocked)
                {
                }
                column(Status_LN;LN.Status)
                {
                }
                column(Practical_LN;LN.Practical)
                {
                }
                column(DocumentNo_LN;LN."Document No")
                {
                }
                column(MarkingStartDate_LN;LN."Marking Start Date")
                {
                }
                column(MarkingEndDate_LN;LN."Marking End Date")
                {
                }
                column(CheckingStartDate_LN;LN."Checking Start Date")
                {
                }
                column(CheckingEndDate_LN;LN."Checking End Date")
                {
                }
                column(EnteringStartDate_LN;LN."Entering Start Date")
                {
                }
                column(EnteringEndDate_LN;LN."Entering End Date")
                {
                }
                column(ClearingMarkersStartDate_LN;LN."Clearing(Markers) Start Date")
                {
                }
                column(ClearingMarkersEndDate_LN;LN."Clearing(Markers) End Date")
                {
                }
                column(ComparingStartDate_LN;LN."Comparing Start Date")
                {
                }
                column(ComparingEndDate_LN;LN."Comparing End Date")
                {
                }
                column(ClearingPapersStartDate_LN;LN."Clearing(Papers) Start Date")
                {
                }
                column(ClearingPapersEndDate_LN;LN."Clearing(Papers) End Date")
                {
                }
                column(PackingStartDate_LN;LN."Packing Start Date")
                {
                }
                column(PackingEndDate_LN;LN."Packing End Date")
                {
                }
                column(KeyinginStartDate_LN;LN."Keying in Start Date")
                {
                }
                column(KeyinginEndDate_LN;LN."Keying in End Date")
                {
                }
                column(ProofReadingStartDate_LN;LN."Proof Reading Start Date")
                {
                }
                column(ProofReadingEndDate_LN;LN."Proof Reading End  Date")
                {
                }
                column(LineNo_LN;LN."Line No")
                {
                }
                column(V2ndProofReadingStartDate_LN;LN."2nd Proof Reading Start Date")
                {
                }
                column(V2ndProofReadingEndDate_LN;LN."2nd Proof Reading End  Date")
                {
                }
                column(ConfimofCorrStartDate_LN;LN."Confim of Corr Start Date")
                {
                }
                column(ConfimofCorrEndDate_LN;LN."Confim of Corr  End  Date")
                {
                }
                column(ClearingTeamLeadersDate_LN;LN."Clearing Team Leaders  Date")
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
