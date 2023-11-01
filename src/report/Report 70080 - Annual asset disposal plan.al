report 70080 "Annual asset disposal plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Annual asset disposal plan.rdlc';

    dataset
    {
        dataitem("Disposal Plan Lines";"Disposal Plan Lines")
        {
            column(image1;corec.Picture)
            {
            }
            column(Disposalheader_DisposalPlanLines;"Disposal Plan Lines"."Disposal header")
            {
            }
            column(LineNo_DisposalPlanLines;"Disposal Plan Lines"."Line No.")
            {
            }
            column(Type_DisposalPlanLines;"Disposal Plan Lines".Type)
            {
            }
            column(ItemNo_DisposalPlanLines;"Disposal Plan Lines"."Item No.")
            {
            }
            column(DescriptionofItem_DisposalPlanLines;"Disposal Plan Lines"."Description of Item")
            {
            }
            column(UnitofIssue_DisposalPlanLines;"Disposal Plan Lines"."Unit of Issue")
            {
            }
            column(Quantity_DisposalPlanLines;"Disposal Plan Lines".Quantity)
            {
            }
            column(DateOfPurchase_DisposalPlanLines;"Disposal Plan Lines"."Date Of Purchase")
            {
            }
            column(PurchaseUnitPrice_DisposalPlanLines;"Disposal Plan Lines"."Purchase Unit Price")
            {
            }
            column(TotalPurchasePrice_DisposalPlanLines;"Disposal Plan Lines"."Total Purchase Price")
            {
            }
            column(GeneralCondition_DisposalPlanLines;"Disposal Plan Lines"."General Condition")
            {
            }
            column(DisposalcommitteeRecommend_DisposalPlanLines;"Disposal Plan Lines"."Disposal committee Recommend")
            {
            }
            column(Estimatedcurrentvalue_DisposalPlanLines;"Disposal Plan Lines"."Estimated current value")
            {
            }
            column(AccountingOfficerDecision_DisposalPlanLines;"Disposal Plan Lines"."Accounting Officer Decision")
            {
            }
            column(DisposalType_DisposalPlanLines;"Disposal Plan Lines"."Disposal Type")
            {
            }
            column(DisposalMethods_DisposalPlanLines;"Disposal Plan Lines"."Disposal Methods")
            {
            }

            trigger OnPreDataItem()
            begin
                corec.Get;
                corec.CalcFields(corec.Picture);
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

    var
        corec: Record "Company Information";
}

