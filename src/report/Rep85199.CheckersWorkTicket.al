#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85199 "Checkers Work Ticket"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Checkers Work Ticket.rdlc';

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
            column(name;CI.Name)
            {
            }
            column(city;CI.City)
            {
            }
            column(Add2;CI."Address 2")
            {
            }
            column(DocumentNo_HD;HD."Document No.")
            {
            }
            column(CheckerNo_HD;HD."Checker No")
            {
            }
            column(CheckerName_HD;HD."Checker Name")
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
            column(DocumentDate_HD;HD."Document Date")
            {
            }
            column(ExaminationName_HD;HD."Examination Name")
            {
            }
            column(BankName_HD;HD."Bank Name")
            {
            }
            column(BranchName_HD;HD."Branch Name")
            {
            }
            column(BankBranchNo_HD;HD."Bank Branch No.")
            {
            }
            column(BankAccountNo_HD;HD."Bank Account No.")
            {
            }
            column(BankCode_HD;HD."Bank Code")
            {
            }
            column(MPesaNumber_HD;HD."M-Pesa Number")
            {
            }
            column(Email_HD;HD.Email)
            {
            }
            column(IDPassportNo_HD;HD."ID/Passport No")
            {
            }
            column(KRAPINNO_HD;HD."KRA PIN NO")
            {
            }
            column(Address_HD;HD.Address)
            {
            }
            column(Address2_HD;HD."Address 2")
            {
            }
            column(PhoneNo_HD;HD."Phone No")
            {
            }
            dataitem(LN;"Checkers Ticket Lines")
            {
                DataItemLink = "Document No"=field("Document No.");
                column(ReportForNavId_27; 27)
                {
                }
                column(LineNo_LN;LN."Line No")
                {
                }
                column(DocumentNo_LN;LN."Document No")
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
                column(PaperID_LN;LN."Paper ID")
                {
                }
                column(PaperName_LN;LN."Paper Name")
                {
                }
                column(Name_LN;LN.Name)
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
                column(NoofScriptsBefore_LN;LN."No. of Scripts Before")
                {
                }
                column(NoofScriptsAfter_LN;LN."No. of Scripts After")
                {
                }
                column(CumulativeTotal_LN;LN."Cumulative Total")
                {
                }
                column(Date_LN;LN.Date)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                if Courses.Get(HD.Examination) then begin
                  eXAM:=Courses.Description;
                  end;
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
}
