#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85202 "TLeader Allocation Per Sitting"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/TLeader Allocation Per Sitting.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Marker Task Allocation";"Marker Task Allocation")
        {
            DataItemTableView = where(Role=const("Team Leader"));
            column(ReportForNavId_8; 8)
            {
            }
            column(LineNo_MarkerTaskAllocation;"Marker Task Allocation"."Line No")
            {
            }
            column(ResourceNo_MarkerTaskAllocation;"Marker Task Allocation"."Resource No")
            {
            }
            column(Course_MarkerTaskAllocation;"Marker Task Allocation".Course)
            {
            }
            column(Section_MarkerTaskAllocation;"Marker Task Allocation".Section)
            {
            }
            column(Level_MarkerTaskAllocation;"Marker Task Allocation".Level)
            {
            }
            column(PaperID_MarkerTaskAllocation;"Marker Task Allocation"."Paper ID")
            {
            }
            column(PaperName_MarkerTaskAllocation;"Marker Task Allocation"."Paper Name")
            {
            }
            column(ExaminationSitting_MarkerTaskAllocation;"Marker Task Allocation"."Examination Sitting")
            {
            }
            column(Name_MarkerTaskAllocation;"Marker Task Allocation".Name)
            {
            }
            dataitem(Resource;Resource)
            {
                DataItemLink = "No."=field("Resource No");
                column(ReportForNavId_1; 1)
                {
                }
                column(No_Resource;Resource."No.")
                {
                }
                column(Type_Resource;Resource.Type)
                {
                }
                column(Name_Resource;Resource.Name)
                {
                }
                column(SearchName_Resource;Resource."Search Name")
                {
                }
                column(Name2_Resource;Resource."Name 2")
                {
                }
                column(Address_Resource;Resource.Address)
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
}
