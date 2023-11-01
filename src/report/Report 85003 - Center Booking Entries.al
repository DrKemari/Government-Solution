report 85003 "Center Booking Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Center Booking Entries.rdlc';

    dataset
    {
        dataitem("Center Booking Entries";"Center Booking Entries")
        {
            DataItemTableView = WHERE(Status=FILTER(Allocated));
            RequestFilterFields = "Examination Id","Exam Center Code","Examination Sitting";
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
            column(HeaderNo_CenterBookingEntries;"Center Booking Entries"."Header No.")
            {
            }
            column(LineNo_CenterBookingEntries;"Center Booking Entries"."Line No.")
            {
            }
            column(StudentRegNo_CenterBookingEntries;"Center Booking Entries"."Student Reg No.")
            {
            }
            column(StudentName_CenterBookingEntries;"Center Booking Entries"."Student Name")
            {
            }
            column(CourseId_CenterBookingEntries;"Center Booking Entries"."Examination Id")
            {
            }
            column(CourseDescription_CenterBookingEntries;"Center Booking Entries"."Examination Description")
            {
            }
            column(Region_CenterBookingEntries;"Center Booking Entries".Region)
            {
            }
            column(Zone_CenterBookingEntries;"Center Booking Entries".Zone)
            {
            }
            column(ExamCenterCode_CenterBookingEntries;"Center Booking Entries"."Exam Center Code")
            {
            }
            column(CenterName_CenterBookingEntries;"Center Booking Entries"."Center Name")
            {
            }
            column(SittingCycle_CenterBookingEntries;"Center Booking Entries"."Examination Sitting")
            {
            }
            column(Year_CenterBookingEntries;"Center Booking Entries".Year)
            {
            }
            column(MaximumCapacity_CenterBookingEntries;"Center Booking Entries"."Maximum Capacity")
            {
            }
            column(AvailableCapacity_CenterBookingEntries;"Center Booking Entries"."Available Capacity")
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

