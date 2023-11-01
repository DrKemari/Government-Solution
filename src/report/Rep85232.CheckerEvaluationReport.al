#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85232 "Checker Evaluation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Checker Evaluation Report.rdlc';

    dataset
    {
        dataitem(HD;"Checker Evaluation Header")
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
            column(DocumentNo_HD;HD."Document No.")
            {
            }
            column(EngagementCategory_HD;HD."Engagement Category")
            {
            }
            column(No_HD;HD.No)
            {
            }
            column(Email_HD;HD.Email)
            {
            }
            column(PlannedStartDate_HD;HD."Planned Start Date")
            {
            }
            column(PlannedEndDate_HD;HD."Planned End Date")
            {
            }
            column(GlobalDimensionDim1Code_HD;HD."Global Dimension Dim 1 Code")
            {
            }
            column(GlobalDimensionDim2Code_HD;HD."Global Dimension  Dim 2 Code")
            {
            }
            column(DimensionSetID_HD;HD."Dimension Set ID")
            {
            }
            column(ExamSitting_HD;HD."Exam Sitting")
            {
            }
            column(DocumentDate_HD;HD."Document Date")
            {
            }
            column(CreatedBy_HD;HD."Created By")
            {
            }
            column(CreatedOn_HD;HD."Created On")
            {
            }
            column(Status_HD;HD.Status)
            {
            }
            column(Name_HD;HD.Name)
            {
            }
            column(NoSeries_HD;HD."No. Series")
            {
            }
            column(DocumentType_HD;HD."Document Type")
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
            column(OverallScore_HD;HD."Overall Score")
            {
            }
            column(OverallComment_HD;HD."Overall Comment")
            {
            }
            dataitem(CS;"Checker Evaluation Lines")
            {
                DataItemLink = "Document No"=field("Document No.");
                column(ReportForNavId_12; 12)
                {
                }
                column(DocumentNo_CS;CS."Document No")
                {
                }
                column(LineNo_CS;CS."Line No")
                {
                }
                column(Criteria_CS;CS.Criteria)
                {
                }
                column(Rating_CS;CS.Rating)
                {
                }
                column(Score_CS;CS.Score)
                {
                }
                column(Recommendation_CS;CS.Recommendation)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    // MarksheetDetailedLines.RESET;
                    // MarksheetDetailedLines.SETRANGE("Document No.",CS.Code);
                    // MarksheetDetailedLines.SETRANGE("Line No.",CS."Line No");
                    // IF MarksheetDetailedLines.FINDSET THEN
                end;
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
        MarksheetDetailedLines: Record "Marksheet Detailed Lines";
}
