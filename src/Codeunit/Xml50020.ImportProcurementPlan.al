#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 50020 "Import Procurement Plan"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Procurement Plan1";"Procurement Plan1")
            {
                XmlName = 'ProcurementPlan';
                fieldelement(PlanYear;"Procurement Plan1"."Plan Year")
                {
                }
                fieldelement(PlanItemNo;"Procurement Plan1"."Plan Item No")
                {
                }
                fieldelement(des;"Procurement Plan1"."Item Description")
                {
                }
                fieldelement(dir;"Procurement Plan1"."Directorate Code")
                {
                }
                fieldelement(Dept;"Procurement Plan1"."Department Code")
                {
                }
                fieldelement(ProcurementType;"Procurement Plan1"."Procurement Type")
                {
                }
                fieldelement(Quantity;"Procurement Plan1".Quantity)
                {
                }
                fieldelement(UnitPrice;"Procurement Plan1"."Unit Cost")
                {
                }
                fieldelement(FundingSource;"Procurement Plan1"."Funding Source Code")
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
}

