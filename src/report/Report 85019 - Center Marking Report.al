report 85019 "Center Marking Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Center Marking Report.rdlc';

    dataset
    {
        dataitem("Center  Header";"Center  Header")
        {
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_CenterDispatchHeader;"Center  Header"."Document No.")
            {
            }
            column(Description_CenterDispatchHeader;"Center  Header".Description)
            {
            }
            column(ProjectNo_CenterDispatchHeader;"Center  Header"."Project No.")
            {
            }
            column(ProjectName_CenterDispatchHeader;"Center  Header"."Project Name")
            {
            }
            column(SittingCycle_CenterDispatchHeader;"Center  Header"."Sitting Cycle")
            {
            }
            column(CenterCode_CenterDispatchHeader;"Center  Header"."Center Code")
            {
            }
            column(CenterName_CenterDispatchHeader;"Center  Header"."Center Name")
            {
            }
            column(ApprovalStatus_CenterDispatchHeader;"Center  Header"."Approval Status")
            {
            }
            column(DocumentStatus_CenterDispatchHeader;"Center  Header"."Document Status")
            {
            }
            column(CreatedBy_CenterDispatchHeader;"Center  Header"."Created By")
            {
            }
            column(CreatedOn_CenterDispatchHeader;"Center  Header"."Created On")
            {
            }
            column(Posted_CenterDispatchHeader;"Center  Header".Posted)
            {
            }
            column(PostedOn_CenterDispatchHeader;"Center  Header"."Posted On")
            {
            }
            column(PostedBy_CenterDispatchHeader;"Center  Header"."Posted By")
            {
            }
            column(NoSeries_CenterDispatchHeader;"Center  Header"."No. Series")
            {
            }
            column(ExaminationStartDate_CenterDispatchHeader;"Center  Header"."Examination Start Date")
            {
            }
            column(ExaminationEndDate_CenterDispatchHeader;"Center  Header"."Examination End Date")
            {
            }
            column(TotalCandidature_CenterDispatchHeader;"Center  Header"."Total Candidature")
            {
            }
            dataitem("Marking Lines";"Marking Lines")
            {
                RequestFilterFields = Examination,Paper,Section;
                column(DocumentNo_MarkingLines;"Marking Lines"."Document No.")
                {
                }
                column(LineNo_MarkingLines;"Marking Lines"."Line No.")
                {
                }
                column(Part_MarkingLines;"Marking Lines".Part)
                {
                }
                column(Section_MarkingLines;"Marking Lines".Section)
                {
                }
                column(Paper_MarkingLines;"Marking Lines".Paper)
                {
                }
                column(PaperName_MarkingLines;"Marking Lines"."Paper Name")
                {
                }
                column(Examination_MarkingLines;"Marking Lines".Examination)
                {
                }
                column(TotalCandidature_MarkingLines;"Marking Lines"."Total Candidature")
                {
                }
                column(NoofMarkers_MarkingLines;"Marking Lines"."No. of Markers")
                {
                }
                column(NoofTeamLeaders_MarkingLines;"Marking Lines"."No. of Team Leaders")
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

