report 70016 "Annual Procurement Plan Consul"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Annual Procurement Plan Consul.rdlc';

    dataset
    {
        dataitem("Procurement Header";"Procurement Header")
        {
            RequestFilterFields = No;
            column(No_ProcurementHeader;"Procurement Header".No)
            {
            }
            column(StartDate_ProcurementHeader;"Procurement Header"."Start Date")
            {
            }
            column(EndDate_ProcurementHeader;"Procurement Header"."End Date")
            {
            }
            column(Description_ProcurementHeader;"Procurement Header".Description)
            {
            }
            column(CreatedBy_ProcurementHeader;"Procurement Header"."Created By")
            {
            }
            column(DateCreated_ProcurementHeader;"Procurement Header"."Date Created")
            {
            }
            column(TimeCreated_ProcurementHeader;"Procurement Header"."Time Created")
            {
            }
            column(DepartmentFilter_ProcurementHeader;"Procurement Header"."Department Filter")
            {
            }
            column(Status_ProcurementHeader;"Procurement Header".Status)
            {
            }
            column(BudgetType_ProcurementHeader;"Procurement Header"."Budget Type")
            {
            }
            column(Select_ProcurementHeader;"Procurement Header".Select)
            {
            }
            column(BudgetPlanPosted_ProcurementHeader;"Procurement Header"."Budget Plan Posted")
            {
            }
            column(NoSeries_ProcurementHeader;"Procurement Header"."No. Series")
            {
            }
            column(EchequerJobID_ProcurementHeader;"Procurement Header"."Echequer Job ID")
            {
            }
            column(FinancialYearCode_ProcurementHeader;"Procurement Header"."Financial Year Code")
            {
            }
            column(CompanyName;CompanyName)
            {
            }
            dataitem("Procurement Plan1";"Procurement Plan1")
            {
                DataItemLink = "Plan Year"=FIELD(No);
                DataItemTableView = WHERE("Procurement Type"=FILTER(Service));
                column(PlanYear_ProcurementPlan;"Procurement Plan1"."Plan Year")
                {
                }
                column(PlanItemNo_ProcurementPlan;"Procurement Plan1"."Plan Item No")
                {
                }
                column(ProcurementType_ProcurementPlan;"Procurement Plan1"."Procurement Type")
                {
                }
                column(UnitofMeasure_ProcurementPlan;"Procurement Plan1"."Unit of Measure")
                {
                }
                column(UnitCost_ProcurementPlan;"Procurement Plan1"."Unit Cost")
                {
                }
                column(ProcurementMethod_ProcurementPlan;"Procurement Plan1"."Procurement Method")
                {
                }
                column(SourceofFunds_ProcurementPlan;"Procurement Plan1"."Source of Funds")
                {
                }
                column(EstimatedCost_ProcurementPlan;"Procurement Plan1"."Estimated Cost")
                {
                }
                column(AdvertisementDate_ProcurementPlan;"Procurement Plan1"."Advertisement Date")
                {
                }
                column(BidQuotationOpeningDate_ProcurementPlan;"Procurement Plan1"."Bid/Quotation Opening Date")
                {
                }
                column(ProposalEvaluationdate_ProcurementPlan;"Procurement Plan1"."Proposal Evaluation date")
                {
                }
                column(FinancialOpeningdate_ProcurementPlan;"Procurement Plan1"."Financial Opening date")
                {
                }
                column(Negotiationdate_ProcurementPlan;"Procurement Plan1"."Negotiation date")
                {
                }
                column(Notificationofawarddate_ProcurementPlan;"Procurement Plan1"."Notification of award date")
                {
                }
                column(ContractDate_ProcurementPlan;"Procurement Plan1"."Contract Date")
                {
                }
                column(ContractEndDatePlanned_ProcurementPlan;"Procurement Plan1"."Contract End Date (Planned)")
                {
                }
                column(DepartmentCode_ProcurementPlan;"Procurement Plan1"."Department Code")
                {
                }
                column(TORTechnicalspecsdueDate_ProcurementPlan;"Procurement Plan1"."TOR/Technical specs due Date")
                {
                }
                column(ItemDescription_ProcurementPlan;"Procurement Plan1"."Item Description")
                {
                }
                column(Quantity_ProcurementPlan;"Procurement Plan1".Quantity)
                {
                }
                column(Category_ProcurementPlan;"Procurement Plan1".Category)
                {
                }
                column(ProcessType_ProcurementPlan;"Procurement Plan1"."Process Type")
                {
                }
                column(ApprovedBudget_ProcurementPlan;"Procurement Plan1"."Approved Budget")
                {
                }
                column(PlanStatus_ProcurementPlan;"Procurement Plan1"."Plan Status")
                {
                }
                column(Type_ProcurementPlan;"Procurement Plan1".Type)
                {
                }
                column(No_ProcurementPlan;"Procurement Plan1"."No.")
                {
                }
                column(Actual_ProcurementPlan;"Procurement Plan1".Actual)
                {
                }
                column(Commitment_ProcurementPlan;"Procurement Plan1".Commitment)
                {
                }
                column(Test_ProcurementPlan;"Procurement Plan1".Test)
                {
                }
                column(RequisitionItems_ProcurementPlan;"Procurement Plan1"."Requisition Items")
                {
                }
                column(FundingSourceCode_ProcurementPlan;"Procurement Plan1"."Funding Source Code")
                {
                }
                column(OutputCode_ProcurementPlan;"Procurement Plan1"."Output Code")
                {
                }
                column(ObjectiveCode_ProcurementPlan;"Procurement Plan1"."Objective Code")
                {
                }
                column(OutcomeCode_ProcurementPlan;"Procurement Plan1"."Outcome Code")
                {
                }
                column(TargetGroups_ProcurementPlan;"Procurement Plan1"."Target Groups")
                {
                }
                column(MarginofpreferenceforLocal_ProcurementPlan;"Procurement Plan1"."Margin of preference for Local")
                {
                }
                column(Quarter1Amount_ProcurementPlan;"Procurement Plan1"."Quarter 1 Amount")
                {
                }
                column(Quarter2Amount_ProcurementPlan;"Procurement Plan1"."Quarter 2 Amount")
                {
                }
                column(Quarter3Amount_ProcurementPlan;"Procurement Plan1"."Quarter 3 Amount")
                {
                }
                column(Quarter4Amount_ProcurementPlan;"Procurement Plan1"."Quarter 4 Amount")
                {
                }
                column(Quarter1Qty_ProcurementPlan;"Procurement Plan1"."Quarter 1 Qty")
                {
                }
                column(Quarter2Qty_ProcurementPlan;"Procurement Plan1"."Quarter 2 Qty")
                {
                }
                column(Quarter3Qty_ProcurementPlan;"Procurement Plan1"."Quarter 3 Qty")
                {
                }
                column(Quarter4Qty_ProcurementPlan;"Procurement Plan1"."Quarter 4 Qty")
                {
                }
                column(Youth_ProcurementPlan;"Procurement Plan1".Youth)
                {
                }
                column(Women_ProcurementPlan;"Procurement Plan1".Women)
                {
                }
                column(PWD_ProcurementPlan;"Procurement Plan1".PWD)
                {
                }
                column(CitizenContractors_ProcurementPlan;"Procurement Plan1"."Citizen Contractors")
                {
                }
                column(ResponsibilityCenter_ProcurementPlan;"Procurement Plan1"."Responsibility Center")
                {
                }
                column(JobID_ProcurementPlan;"Procurement Plan1"."Job ID")
                {
                }
                column(JobTaskNo_ProcurementPlan;"Procurement Plan1"."Job Task No.")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                /*IF CompanyInfo.GET(CompanyName) THEN
                   CompanyName:=CompanyInfo.Name;
                END;*/

            end;
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

