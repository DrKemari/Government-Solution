report 85014 "Marksheet Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Marksheet Voucher.rdlc';

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
            dataitem("Exam Marksheet Lines";"Exam Marksheet Lines")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
                column(DocumentNo_MarksheetLines;"Exam Marksheet Lines"."Document No.")
                {
                }
                column(StudentRegNo_MarksheetLines;"Exam Marksheet Lines"."Student Reg No.")
                {
                }
                column(StudentName_MarksheetLines;"Exam Marksheet Lines"."Student Name")
                {
                }
                column(ExaminationCenter_MarksheetLines;"Exam Marksheet Lines"."Examination Center")
                {
                }
                column(NoofPapers_MarksheetLines;"Exam Marksheet Lines"."No. of Papers")
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

