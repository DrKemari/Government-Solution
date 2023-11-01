report 85302 "Curriculum Status Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Curriculum Status Report.rdlc';

    dataset
    {
        dataitem("Syllabus Review";"Syllabus Review")
        {
            column(Logo;CI.Picture)
            {
            }
            column(ApplicationNo_SyllabusReview;"Syllabus Review"."Application No.")
            {
            }
            column(SyllabusNo_SyllabusReview;"Syllabus Review"."Syllabus No.")
            {
            }
            column(SyllabusName_SyllabusReview;"Syllabus Review"."Syllabus Name")
            {
            }
            column(DomainCode_SyllabusReview;"Syllabus Review"."Domain Code")
            {
            }
            column(DomainName_SyllabusReview;"Syllabus Review"."Domain Name")
            {
            }
            column(CreatedOn_SyllabusReview;"Syllabus Review"."Created On")
            {
            }
            column(CreatedBy_SyllabusReview;"Syllabus Review"."Created By")
            {
            }
            column(TypeofSyllabus_SyllabusReview;"Syllabus Review"."Type of Syllabus")
            {
            }
            column(SyllabusTypeName_SyllabusReview;"Syllabus Review"."Syllabus Type Name")
            {
            }
            column(DateofLastReview_SyllabusReview;"Syllabus Review"."Date of Last Review")
            {
            }
            column(New_SyllabusReview;"Syllabus Review".New)
            {
            }
            column(StartDate_SyllabusReview;"Syllabus Review"."Start Date")
            {
            }
            column(EndDate_SyllabusReview;"Syllabus Review"."End Date")
            {
            }
            column(Status_SyllabusReview;"Syllabus Review".Status)
            {
            }
            column(ApprovalStatus_SyllabusReview;"Syllabus Review"."Approval Status")
            {
            }
            column(Description_SyllabusReview;"Syllabus Review".Description)
            {
            }
            column(ProjectNo_SyllabusReview;"Syllabus Review"."Project No.")
            {
            }
            column(Noseries_SyllabusReview;"Syllabus Review"."No series")
            {
            }
            column(PersonResponsible_SyllabusReview;"Syllabus Review"."Person Responsible")
            {
            }
            column(Name_SyllabusReview;"Syllabus Review".Name)
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
}

