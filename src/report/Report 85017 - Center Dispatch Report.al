report 85017 "Center Dispatch Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Center Dispatch Report.rdlc';

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
            dataitem("Center Dispatch Lines";"Center Dispatch Lines")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
                column(DocumentNo_CenterDispatchLines;"Center Dispatch Lines"."Document No.")
                {
                }
                column(LineNo_CenterDispatchLines;"Center Dispatch Lines"."Line No.")
                {
                }
                column(StationeryType_CenterDispatchLines;"Center Dispatch Lines"."Stationery Type")
                {
                }
                column(StationeryName_CenterDispatchLines;"Center Dispatch Lines"."Stationery Name")
                {
                }
                column(UnitofMeasure_CenterDispatchLines;"Center Dispatch Lines"."Unit of Measure")
                {
                }
                column(Quantity_CenterDispatchLines;"Center Dispatch Lines".Quantity)
                {
                }
                column(SerialNoFrom_CenterDispatchLines;"Center Dispatch Lines"."Serial No From")
                {
                }
                column(SerialNoTo_CenterDispatchLines;"Center Dispatch Lines"."Serial No. To")
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

