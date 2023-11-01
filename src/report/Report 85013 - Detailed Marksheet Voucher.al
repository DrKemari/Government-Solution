report 85013 "Detailed Marksheet Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Detailed Marksheet Voucher.rdlc';

    dataset
    {
        dataitem("Marksheet Header";"Marksheet Header")
        {
            column(Logo;CI.Picture)
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
            column(FinancialBudgetID_MarksheetHeader;"Marksheet Header"."Financial Budget ID")
            {
            }
            column(ExaminationStartDate_MarksheetHeader;"Marksheet Header"."Examination Start Date")
            {
            }
            column(ExaminationEndDate_MarksheetHeader;"Marksheet Header"."Examination End Date")
            {
            }
            column(TotalCandidature_MarksheetHeader;"Marksheet Header"."Total Candidature")
            {
            }
            column(ApprovalStatus_MarksheetHeader;"Marksheet Header"."Approval Status")
            {
            }
            column(CreatedBy_MarksheetHeader;"Marksheet Header"."Created By")
            {
            }
            column(CreatedOn_MarksheetHeader;"Marksheet Header"."Created On")
            {
            }
            column(Posted_MarksheetHeader;"Marksheet Header".Posted)
            {
            }
            column(PostedOn_MarksheetHeader;"Marksheet Header"."Posted On")
            {
            }
            column(PostedBy_MarksheetHeader;"Marksheet Header"."Posted By")
            {
            }
            column(NoSeries_MarksheetHeader;"Marksheet Header"."No. Series")
            {
            }
            column(ExaminationProjectID_MarksheetHeader;"Marksheet Header"."Examination Project ID")
            {
            }
            dataitem("Marksheet Detailed Lines";"Marksheet Detailed Lines")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
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
}

