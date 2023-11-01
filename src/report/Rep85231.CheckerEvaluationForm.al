#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85231 "Checker Evaluation Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Checker Evaluation Form.rdlc';

    dataset
    {
        dataitem(HD; "Marksheet Header")
        {
            column(ReportForNavId_35; 35)
            {
            }
            column(Logo; CI.Picture)
            {
            }
            column(name; CI.Name)
            {
            }
            column(city; CI.City)
            {
            }
            column(Add2; CI."Address 2")
            {
            }
            column(DocumentNo_HD; HD."Document No.")
            {
            }
            column(ExaminationSittingID_HD; HD."Examination Sitting ID")
            {
            }
            column(DocumentDate_HD; HD."Document Date")
            {
            }
            column(FinancialYearCode_HD; HD."Financial Year Code")
            {
            }
            column(Description_HD; HD.Description)
            {
            }
            dataitem(CS; "Course Sponsors")
            {
                DataItemLink = Code = field("Document No.");
                column(ReportForNavId_12; 12)
                {
                }
                column(Code_CS; CS.Code)
                {
                }
                column(SponsorCode_CS; CS."Sponsor Code")
                {
                }
                column(SponsorName_CS; CS."Sponsor Name")
                {
                }
                column(CourseCode_CS; CS."Course Code")
                {
                }
                column(CourseDescription_CS; CS."Course Description")
                {
                }
                column(EntryNo_CS; CS."Entry No")
                {
                }
                column(LineNo_CS; CS."Line No")
                {
                }
                column(NotifiedOn_CS; CS."Notified On")
                {
                }
                column(Notified_CS; CS.Notified)
                {
                }
                column(PrizeDetails_CS; CS."Prize Details")
                {
                }
                column(Amount_CS; CS.Amount)
                {
                }
                column(REgno; MarksheetDetailedLines."Student Reg No.")
                {
                }
                column(namest; MarksheetDetailedLines."Student Name")
                {
                }

                //                 trigger OnAfterGetRecord()
                //                 begin
                //                     MarksheetDetailedLines.Reset;
                //                     MarksheetDetailedLines.SetRange("Document No.",CS.Code);
                //                     MarksheetDetailedLines.SetRange("Line No.",CS."Line No");
                //                     if MarksheetDetailedLines.FindSet then
                // ;
                //             }

                //             trigger OnAfterGetRecord()
                //             begin
                //                 // IF Courses.GET(HD.Examination) THEN BEGIN
                //                 //  eXAM:=Courses.Description;
                //                 //  END;
                //             end;
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
        EnvelopeValues: array[10, 1] of Code[30];
        i: Integer;
        Papers: Record Papers;
        eXAM: Text[250];
        MarksheetDetailedLines: Record "Marksheet Detailed Lines";
}

