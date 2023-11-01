report 85305 "Syllabus Dev Application"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Syllabus Dev Application.rdlc';

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
            column(BoardVerdict_SyllabusReview;"Syllabus Review"."Board Verdict")
            {
            }
            column(NoofDays_SyllabusReview;"Syllabus Review"."No. of Days")
            {
            }
            column(VerdictDate_SyllabusReview;"Syllabus Review"."Verdict Date")
            {
            }
            column(BoardComments_SyllabusReview;"Syllabus Review"."Board Comments")
            {
            }
            column(TerminationReason_SyllabusReview;"Syllabus Review"."Termination Reason")
            {
            }
            column(Type_SyllabusReview;"Syllabus Review".Type)
            {
            }
            column(OrdinalNumber_SyllabusReview;"Syllabus Review"."Ordinal Number")
            {
            }
            column(LetterofTermination_SyllabusReview;"Syllabus Review"."Letter of Termination")
            {
            }
            column(PlanNo_SyllabusReview;"Syllabus Review"."Plan No.")
            {
            }
            column(PlanItem_SyllabusReview;"Syllabus Review"."Plan Item")
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

