#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85224 "Certificate Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Certificate Report.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(HD;"Certificate Entry")
        {
            column(ReportForNavId_35; 35)
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
            column(EntryNo_HD;HD."Entry No.")
            {
            }
            column(StudentRegNo_HD;HD."Student Reg No.")
            {
            }
            column(StudentName_HD;HD."Student Name")
            {
            }
            column(Examination_HD;HD.Examination)
            {
            }
            column(Part_HD;HD.Part)
            {
            }
            column(ExamSittingID_HD;HD."Exam Sitting ID")
            {
            }
            column(ExamCenter_HD;HD."Exam Center")
            {
            }
            column(DatePrinted_HD;HD."Date Printed")
            {
            }
            column(PrintedBy_HD;HD."Printed By")
            {
            }
            column(CollectionDate_HD;HD."Collection Date")
            {
            }
            column(CollectedByIDNumber_HD;HD."Collected By ID Number")
            {
            }
            column(CollectedByName_HD;HD."Collected By Name")
            {
            }
            column(CollectedByEmail_HD;HD."Collected By Email")
            {
            }
            column(IssuedBy_HD;HD."Issued  By")
            {
            }
            column(IssuedDate_HD;HD."Issued Date")
            {
            }
            column(IssuedTime_HD;HD."Issued Time")
            {
            }
            column(Type_HD;HD.Type)
            {
            }
            column(LastModifiedDateTime_HD;HD."Last Modified Date Time")
            {
            }
            column(LastDateModified_HD;HD."Last Date Modified")
            {
            }
            column(CertificateNo_HD;HD."Certificate No.")
            {
            }
            column(Collected_HD;HD.Collected)
            {
            }
            column(StorageAmount_HD;HD."Storage Amount")
            {
            }
            column(Status_HD;HD.Status)
            {
            }
            column(SecurityCode_HD;HD."Security Code")
            {
            }
            column(YearCompleted_HD;HD."Year Completed")
            {
            }
            column(EffeStorageFeeCalcDate_HD;HD."Effe Storage Fee Calc Date")
            {
            }
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
