report 85300 "Application Review Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Application Review Details.rdlc';

    dataset
    {
        dataitem("Syllabus Review";"Syllabus Review")
        {
            column(Logo;CI.Picture)
            {
            }
            column(ApplicationNo_SyallabusReview;"Syllabus Review"."Application No.")
            {
            }
            column(SyllabusNo_SyallabusReview;"Syllabus Review"."Syllabus No.")
            {
            }
            column(SyllabusName_SyallabusReview;"Syllabus Review"."Syllabus Name")
            {
            }
            column(DomainCode_SyallabusReview;"Syllabus Review"."Domain Code")
            {
            }
            column(DomainName_SyallabusReview;"Syllabus Review"."Domain Name")
            {
            }
            column(CreatedOn_SyallabusReview;"Syllabus Review"."Created On")
            {
            }
            column(CreatedBy_SyallabusReview;"Syllabus Review"."Created By")
            {
            }
            column(TypeofSyllabus_SyallabusReview;"Syllabus Review"."Type of Syllabus")
            {
            }
            column(SyllabusTypeName_SyallabusReview;"Syllabus Review"."Syllabus Type Name")
            {
            }
            column(DateofLastReview_SyallabusReview;"Syllabus Review"."Date of Last Review")
            {
            }
            column(New_SyallabusReview;"Syllabus Review".New)
            {
            }
            column(StartDate_SyallabusReview;"Syllabus Review"."Start Date")
            {
            }
            column(EndDate_SyallabusReview;"Syllabus Review"."End Date")
            {
            }
            column(Status_SyallabusReview;"Syllabus Review".Status)
            {
            }
            column(ApprovalStatus_SyallabusReview;"Syllabus Review"."Approval Status")
            {
            }
            column(Description_SyallabusReview;"Syllabus Review".Description)
            {
            }
            dataitem("Review Stakeholder Comment";"Review Stakeholder Comment")
            {
                column(ApplicationNo_ReviewStakeholderComment;"Review Stakeholder Comment"."Application No.")
                {
                }
                column(StakeholderType_ReviewStakeholderComment;"Review Stakeholder Comment"."Stakeholder Type")
                {
                }
                column(StakeholderName_ReviewStakeholderComment;"Review Stakeholder Comment"."Stakeholder Name")
                {
                }
                column(ExpectedContent_ReviewStakeholderComment;ContentTxt)
                {
                }
                column(SourceType_ReviewStakeholderComment;"Review Stakeholder Comment"."Source Name")
                {
                }
                column(RulesandRegulation_ReviewStakeholderComment;RuleTxt)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Review Stakeholder Comment".CalcFields("Expected Content");
                    "Review Stakeholder Comment".CalcFields("Rules and Regulation");

                    if not "Review Stakeholder Comment"."Expected Content".HasValue then
                      ContentTxt:=''
                    else begin
                     "Review Stakeholder Comment"."Expected Content".CreateInStream(InStr);
                      InStr.Read(ContentTxt,MaxStrLen(ContentTxt));
                      end;

                    if not "Review Stakeholder Comment"."Rules and Regulation".HasValue then
                      RuleTxt:=''
                    else begin
                     "Review Stakeholder Comment"."Rules and Regulation".CreateInStream(InStr);
                      InStr.Read(RuleTxt,MaxStrLen(RuleTxt));
                      end;
                end;
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
        InStr: InStream;
        OutStr: OutStream;
        ContentTxt: Text;
        RuleTxt: Text;
}

