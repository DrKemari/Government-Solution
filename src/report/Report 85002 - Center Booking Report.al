report 85002 "Center Booking Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Center Booking Report.rdlc';

    dataset
    {
        dataitem("Center Booking Header";"Center Booking Header")
        {
            column(CI_Picture;CI.Picture)
            {
            }
            column(CI_Address;CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
            {
            }
            column(CI_City;CI.City)
            {
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
            }
            column(COMPANYNAME;CompanyName)
            {
            }
            column(HeaderNo_CenterBookingHeader;"Center Booking Header"."Header No.")
            {
            }
            column(StudentRegNo_CenterBookingHeader;"Center Booking Header"."Student Reg No.")
            {
            }
            column(StudentName_CenterBookingHeader;"Center Booking Header"."Student Name")
            {
            }
            column(CourseId_CenterBookingHeader;"Center Booking Header"."Course Id")
            {
            }
            column(CourseDescription_CenterBookingHeader;"Center Booking Header"."Course Description")
            {
            }
            column(Region_CenterBookingHeader;"Center Booking Header".Region)
            {
            }
            column(Zone_CenterBookingHeader;"Center Booking Header".Zone)
            {
            }
            column(ExamCenterCode_CenterBookingHeader;"Center Booking Header"."Exam Center Code")
            {
            }
            column(CenterName_CenterBookingHeader;"Center Booking Header"."Center Name")
            {
            }
            column(SittingCycle_CenterBookingHeader;"Center Booking Header"."Examination Sitting")
            {
            }
            column(Year_CenterBookingHeader;"Center Booking Header".Year)
            {
            }
            column(MaximumCapacity_CenterBookingHeader;"Center Booking Header"."Maximum Capacity")
            {
            }
            column(AvailableCapacity_CenterBookingHeader;"Center Booking Header"."Available Capacity")
            {
            }
            column(ApprovalStatus_CenterBookingHeader;"Center Booking Header"."Approval Status")
            {
            }
            column(InitialCenterCode_CenterBookingHeader;"Center Booking Header"."Initial Center Booking")
            {
            }
            column(InitialCenterName_CenterBookingHeader;"Center Booking Header"."Initial Center Name")
            {
            }
            column(CreatedBy_CenterBookingHeader;"Center Booking Header"."Created By")
            {
            }
            column(CreatedOn_CenterBookingHeader;"Center Booking Header"."Created On")
            {
            }
            column(Type_CenterBookingHeader;"Center Booking Header".Type)
            {
            }
            column(NoSeries_CenterBookingHeader;"Center Booking Header"."No. Series")
            {
            }
            column(Posted_CenterBookingHeader;"Center Booking Header".Posted)
            {
            }
            dataitem("Center Booking Lines";"Center Booking Lines")
            {
                DataItemLink = "Header No."=FIELD("Header No.");
                column(HeaderNo_CenterBookingLines;"Center Booking Lines"."Header No.")
                {
                }
                column(LineNo_CenterBookingLines;"Center Booking Lines"."Line No.")
                {
                }
                column(StudentRegNo_CenterBookingLines;"Center Booking Lines"."Student Reg No.")
                {
                }
                column(StudentName_CenterBookingLines;"Center Booking Lines"."Student Name")
                {
                }
                column(CourseId_CenterBookingLines;"Center Booking Lines"."Course Id")
                {
                }
                column(CourseDescription_CenterBookingLines;"Center Booking Lines"."Course Description")
                {
                }
                column(Region_CenterBookingLines;"Center Booking Lines".Region)
                {
                }
                column(Zone_CenterBookingLines;"Center Booking Lines".Zone)
                {
                }
                column(ExamCenterCode_CenterBookingLines;"Center Booking Lines"."Exam Center Code")
                {
                }
                column(CenterName_CenterBookingLines;"Center Booking Lines"."Center Name")
                {
                }
                column(SittingCycle_CenterBookingLines;"Center Booking Lines"."Sitting Cycle")
                {
                }
                column(Year_CenterBookingLines;"Center Booking Lines".Year)
                {
                }
                column(MaximumCapacity_CenterBookingLines;"Center Booking Lines"."Maximum Capacity")
                {
                }
                column(AvailableCapacity_CenterBookingLines;"Center Booking Lines"."Available Capacity")
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

