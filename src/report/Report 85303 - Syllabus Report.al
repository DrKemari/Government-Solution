report 85303 "Syllabus Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Syllabus Report.rdlc';

    dataset
    {
        dataitem("Syllabus Header";"Syllabus Header")
        {
            column(Logo;CI.Picture)
            {
            }
            column(Code_SyllabusHeader;"Syllabus Header".Code)
            {
            }
            column(CourseID_SyllabusHeader;"Syllabus Header"."Course ID")
            {
            }
            column(Description_SyllabusHeader;"Syllabus Header".Description)
            {
            }
            column(ExternalDocumentNo_SyllabusHeader;"Syllabus Header"."External Document No.")
            {
            }
            column(ProjectID_SyllabusHeader;"Syllabus Header"."Project ID")
            {
            }
            column(CourseName_SyllabusHeader;"Syllabus Header"."Course Name")
            {
            }
            column(Status_SyllabusHeader;"Syllabus Header".Status)
            {
            }
            column(NoofMajorReviews_SyllabusHeader;"Syllabus Header"."No. of Major Reviews")
            {
            }
            column(NoofMinorReviews_SyllabusHeader;"Syllabus Header"."No. of Minor Reviews")
            {
            }
            column(ApprovalDate_SyllabusHeader;"Syllabus Header"."Approval Date")
            {
            }
            column(DocumentDate_SyllabusHeader;"Syllabus Header"."Document Date")
            {
            }
            column(NextMajorReviewDate_SyllabusHeader;"Syllabus Header"."Next Major Review Date")
            {
            }
            column(NextMinorReviewDate_SyllabusHeader;"Syllabus Header"."Next Minor Review Date")
            {
            }
            column(NoofUnitsPapers_SyllabusHeader;"Syllabus Header"."No. of Units/Papers")
            {
            }
            column(CreatedBy_SyllabusHeader;"Syllabus Header"."Created By")
            {
            }
            column(CreatedOn_SyllabusHeader;"Syllabus Header"."Created On")
            {
            }
            dataitem("Syllabus Paper Line";"Syllabus Paper Line")
            {
                DataItemLink = "Syllabus No."=FIELD(Code);
                column(SyllabusNo_SyllabusPaperLine;"Syllabus Paper Line"."Syllabus No.")
                {
                }
                column(PaperCode_SyllabusPaperLine;"Syllabus Paper Line"."Paper Code")
                {
                }
                column(LineNo_SyllabusPaperLine;"Syllabus Paper Line"."Line No.")
                {
                }
                column(LineType_SyllabusPaperLine;"Syllabus Paper Line"."Line Type")
                {
                }
                column(Title_SyllabusPaperLine;"Syllabus Paper Line".Title)
                {
                }
                column(Details_SyllabusPaperLine;"Syllabus Paper Line".Details)
                {
                }
                column(PaperName_SyllabusPaperLine;"Syllabus Paper Line"."Paper Name")
                {
                }
                column(Part_SyllabusPaperLine;"Syllabus Paper Line".Part)
                {
                }
                column(SectionLevel_SyllabusPaperLine;"Syllabus Paper Line"."Section/Level")
                {
                }
                column(CourseId_SyllabusPaperLine;"Syllabus Paper Line"."Course Id")
                {
                }
            }
            dataitem("Syllabus Rules and Regulations";"Syllabus Rules and Regulations")
            {
                DataItemLink = "Syllabus No."=FIELD(Code);
                column(SyllabusNo_SyllabusRulesandRegulations;"Syllabus Rules and Regulations"."Syllabus No.")
                {
                }
                column(EntryNo_SyllabusRulesandRegulations;"Syllabus Rules and Regulations"."Entry No.")
                {
                }
                column(RuleType_SyllabusRulesandRegulations;"Syllabus Rules and Regulations"."Rule Type")
                {
                }
                column(RuleName_SyllabusRulesandRegulations;"Syllabus Rules and Regulations"."Rule Name")
                {
                }
                column(Details_SyllabusRulesandRegulations;"Syllabus Rules and Regulations".Details)
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
        CI.Get;CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

