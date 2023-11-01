#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85216 "Prize award Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Prize award Report.rdlc';

    dataset
    {
        dataitem(HD;"Marksheet Header")
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
            column(ExaminationSittingID_HD;HD."Examination Sitting ID")
            {
            }
            column(DocumentDate_HD;HD."Document Date")
            {
            }
            column(FinancialYearCode_HD;HD."Financial Year Code")
            {
            }
            column(Description_HD;HD.Description)
            {
            }
            column(CorporateStrategicPlanID_HD;HD."Corporate Strategic Plan ID")
            {
            }
            column(FinancialBudgetID_HD;HD."Financial Budget ID")
            {
            }
            column(ExaminationStartDate_HD;HD."Examination Start Date")
            {
            }
            column(ExaminationEndDate_HD;HD."Examination End Date")
            {
            }
            column(TotalCandidature_HD;HD."Total Candidature")
            {
            }
            dataitem(PZ;"Marksheet Detailed Lines")
            {
                DataItemLink = "Document No."=field("Document No.");
                column(ReportForNavId_11; 11)
                {
                }
                column(DocumentNo_PZ;PZ."Document No.")
                {
                }
                column(LineNo_PZ;PZ."Line No.")
                {
                }
                column(StudentRegNo_PZ;PZ."Student Reg No.")
                {
                }
                column(StudentName_PZ;PZ."Student Name")
                {
                }
                column(Examination_PZ;PZ.Examination)
                {
                }
                column(Part_PZ;PZ.Part)
                {
                }
                column(Section_PZ;PZ.Section)
                {
                }
                column(Paper_PZ;PZ.Paper)
                {
                }
                column(Mark_PZ;PZ.Mark)
                {
                }
                column(Grade_PZ;PZ.Grade)
                {
                }
                column(Passed_PZ;PZ.Passed)
                {
                }
                column(ExaminationCenter_PZ;PZ."Examination Center")
                {
                }
                column(PaperName_PZ;PZ."Paper Name")
                {
                }
                column(ExaminationSittingID_PZ;PZ."Examination Sitting ID")
                {
                }
                column(EnvelopeSerialNo_PZ;PZ."Envelope Serial No.")
                {
                }
                column(Submitted_PZ;PZ.Submitted)
                {
                }
                column(MarkerNo_PZ;PZ."Marker No")
                {
                }
                column(MarkerName_PZ;PZ."Marker Name")
                {
                }
                column(Question1_PZ;PZ."Question 1")
                {
                }
                column(Question2_PZ;PZ."Question 2")
                {
                }
                column(Question3_PZ;PZ."Question 3")
                {
                }
                column(Question4_PZ;PZ."Question 4")
                {
                }
                column(Question5_PZ;PZ."Question 5")
                {
                }
                column(Question6_PZ;PZ."Question 6")
                {
                }
                column(Question7_PZ;PZ."Question 7")
                {
                }
                column(Question8_PZ;PZ."Question 8")
                {
                }
                column(Question9_PZ;PZ."Question 9")
                {
                }
                column(Question10_PZ;PZ."Question 10")
                {
                }
                column(TotalMarks_PZ;PZ."Total Marks")
                {
                }
                column(ActualMarks_PZ;PZ."Actual Marks")
                {
                }
                column(Variance_PZ;PZ.Variance)
                {
                }
                column(CheckerNo_PZ;PZ."Checker No")
                {
                }
                column(CheckerName_PZ;PZ."Checker Name")
                {
                }
                column(CheckerSubmitted_PZ;PZ."Checker Submitted")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                // IF Courses.GET(HD.Examination) THEN BEGIN
                //  eXAM:=Courses.Description;
                //  END;
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
