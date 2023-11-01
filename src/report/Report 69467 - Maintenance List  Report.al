report 69467 "Maintenance List  Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Maintenance List  Report.rdlc';

    dataset
    {
        dataitem(MNT;"Maintenance Header")
        {
            column(No_MNT;MNT.No)
            {
            }
            column(Description_MNT;MNT.Description)
            {
            }
            column(CreatedBy_MNT;MNT."Created By")
            {
            }
            column(Created_MNT;MNT.Created)
            {
            }
            column(NoSeries_MNT;MNT."No. Series")
            {
            }
            column(FixedAssetNo_MNT;MNT."Fixed Asset No")
            {
            }
            column(MaintenanceType_MNT;MNT."Maintenance Type")
            {
            }
            column(MaintainedOn_MNT;MNT."Maintained On")
            {
            }
            column(MaintainedBy_MNT;MNT."Maintained By")
            {
            }
            column(Remarks_MNT;MNT.Remarks)
            {
            }
            column(NextMaintenanceDate_MNT;MNT."Next Maintenance Date")
            {
            }
            column(EmployeeNo_MNT;MNT."Employee No")
            {
            }
            column(EmployeeName_MNT;MNT."Employee Name")
            {
            }
            column(DocumentStatus_MNT;MNT."Document Status")
            {
            }
            column(AssignedTo_MNT;MNT."Assigned To")
            {
            }
            column(AssignedToEmployeeNo_MNT;MNT."Assigned To Employee No")
            {
            }
            column(AssignedToEmployeeName_MNT;MNT."Assigned To Employee Name")
            {
            }
            column(AssignedOn_MNT;MNT."Assigned On")
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

