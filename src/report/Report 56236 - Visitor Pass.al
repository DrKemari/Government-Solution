report 56236 "Visitor Pass"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Visitor Pass.rdlc';

    dataset
    {
        dataitem("Visitors Pass";"Visitors Pass")
        {
            column(No_VisitorsPass;"Visitors Pass".No)
            {
            }
            column(DocumentDate_VisitorsPass;"Visitors Pass"."Document Date")
            {
            }
            column(CreatedBy_VisitorsPass;"Visitors Pass"."Created By")
            {
            }
            column(DateCreated_VisitorsPass;"Visitors Pass"."Date Created")
            {
            }
            column(TimeCreated_VisitorsPass;"Visitors Pass"."Time Created")
            {
            }
            column(Dateofvisit_VisitorsPass;"Visitors Pass"."Date of visit")
            {
            }
            column(Timeofvisit_VisitorsPass;"Visitors Pass"."Time of visit")
            {
            }
            column(VisitorName_VisitorsPass;"Visitors Pass"."Visitor Name")
            {
            }
            column(IDNo_VisitorsPass;"Visitors Pass"."ID No")
            {
            }
            column(MobileNo_VisitorsPass;"Visitors Pass"."Mobile No.")
            {
            }
            column(From_VisitorsPass;"Visitors Pass".From)
            {
            }
            column(OfficertoseeNo_VisitorsPass;"Visitors Pass"."Officer to see No")
            {
            }
            column(OfficertoseeName_VisitorsPass;"Visitors Pass"."Officer to see Name")
            {
            }
            column(Reason_VisitorsPass;"Visitors Pass".Reason)
            {
            }
            column(NoSeries_VisitorsPass;"Visitors Pass"."No. Series")
            {
            }
            column(Status_VisitorsPass;"Visitors Pass".Status)
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
}

