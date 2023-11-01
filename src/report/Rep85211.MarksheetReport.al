#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85211 "Marksheet Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Marksheet Report.rdlc';

    dataset
    {
        dataitem("Marksheet Header";"Marksheet Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(DocumentNo_MarksheetHeader;"Marksheet Header"."Document No.")
            {
            }
            column(ExaminationSittingID_MarksheetHeader;"Marksheet Header"."Examination Sitting ID")
            {
            }
            column(DocumentDate_MarksheetHeader;"Marksheet Header"."Document Date")
            {
            }
            column(FinancialYearCode_MarksheetHeader;"Marksheet Header"."Financial Year Code")
            {
            }
            column(Description_MarksheetHeader;"Marksheet Header".Description)
            {
            }
            column(CorporateStrategicPlanID_MarksheetHeader;"Marksheet Header"."Corporate Strategic Plan ID")
            {
            }
            dataitem("Marksheet Detailed Lines";"Marksheet Detailed Lines")
            {
                DataItemLink = "Document No."=field("Document No.");
                RequestFilterFields = "Marker No",Paper,"Examination Center";
                column(ReportForNavId_8; 8)
                {
                }
                column(DocumentNo_MarksheetDetailedLines;"Marksheet Detailed Lines"."Document No.")
                {
                }
                column(LineNo_MarksheetDetailedLines;"Marksheet Detailed Lines"."Line No.")
                {
                }
                column(StudentRegNo_MarksheetDetailedLines;"Marksheet Detailed Lines"."Student Reg No.")
                {
                }
                column(StudentName_MarksheetDetailedLines;"Marksheet Detailed Lines"."Student Name")
                {
                }
                column(Examination_MarksheetDetailedLines;"Marksheet Detailed Lines".Examination)
                {
                }
                column(Part_MarksheetDetailedLines;"Marksheet Detailed Lines".Part)
                {
                }
                column(Section_MarksheetDetailedLines;"Marksheet Detailed Lines".Section)
                {
                }
                column(Paper_MarksheetDetailedLines;"Marksheet Detailed Lines".Paper)
                {
                }
                column(Mark_MarksheetDetailedLines;"Marksheet Detailed Lines".Mark)
                {
                }
                column(Grade_MarksheetDetailedLines;"Marksheet Detailed Lines".Grade)
                {
                }
                column(Passed_MarksheetDetailedLines;"Marksheet Detailed Lines".Passed)
                {
                }
                column(ExaminationCenter_MarksheetDetailedLines;"Marksheet Detailed Lines"."Examination Center")
                {
                }
                column(PaperName_MarksheetDetailedLines;"Marksheet Detailed Lines"."Paper Name")
                {
                }
                column(ExaminationSittingID_MarksheetDetailedLines;"Marksheet Detailed Lines"."Examination Sitting ID")
                {
                }
                column(EnvelopeSerialNo_MarksheetDetailedLines;"Marksheet Detailed Lines"."Envelope Serial No.")
                {
                }
                column(Submitted_MarksheetDetailedLines;"Marksheet Detailed Lines".Submitted)
                {
                }
                column(MarkerNo_MarksheetDetailedLines;"Marksheet Detailed Lines"."Marker No")
                {
                }
                column(MarkerName_MarksheetDetailedLines;"Marksheet Detailed Lines"."Marker Name")
                {
                }
                column(Question1_MarksheetDetailedLines;"Marksheet Detailed Lines"."Question 1")
                {
                }
                column(Question2_MarksheetDetailedLines;"Marksheet Detailed Lines"."Question 2")
                {
                }
                column(Question3_MarksheetDetailedLines;"Marksheet Detailed Lines"."Question 3")
                {
                }
                column(Question4_MarksheetDetailedLines;"Marksheet Detailed Lines"."Question 4")
                {
                }
                column(Question5_MarksheetDetailedLines;"Marksheet Detailed Lines"."Question 5")
                {
                }
                column(Question6_MarksheetDetailedLines;"Marksheet Detailed Lines"."Question 6")
                {
                }
                column(Question7_MarksheetDetailedLines;"Marksheet Detailed Lines"."Question 7")
                {
                }
                column(Question8_MarksheetDetailedLines;"Marksheet Detailed Lines"."Question 8")
                {
                }
                column(Question9_MarksheetDetailedLines;"Marksheet Detailed Lines"."Question 9")
                {
                }
                column(Question10_MarksheetDetailedLines;"Marksheet Detailed Lines"."Question 10")
                {
                }
                column(TotalMarks_MarksheetDetailedLines;"Marksheet Detailed Lines"."Total Marks")
                {
                }
                column(ActualMarks_MarksheetDetailedLines;"Marksheet Detailed Lines"."Actual Marks")
                {
                }
                column(Variance_MarksheetDetailedLines;"Marksheet Detailed Lines".Variance)
                {
                }
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
}
