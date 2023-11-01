report 55003 "Board Attendance report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Board Attendance report.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Board Meeting Attendance";"Board Meeting Attendance")
        {
            column(MeetingCode_BoardMeetingAttendance;"Board Meeting Attendance"."Meeting Code")
            {
            }
            column(MemberNo_BoardMeetingAttendance;"Board Meeting Attendance"."Member No")
            {
            }
            column(CommiteeNo_BoardMeetingAttendance;"Board Meeting Attendance"."Commitee No")
            {
            }
            column(MeetingName_BoardMeetingAttendance;"Board Meeting Attendance"."Meeting Name")
            {
            }
            column(MemberName_BoardMeetingAttendance;"Board Meeting Attendance"."Member Name")
            {
            }
            column(CommitteeName_BoardMeetingAttendance;"Board Meeting Attendance"."Committee  Name")
            {
            }
            column(MeetingDate_BoardMeetingAttendance;"Board Meeting Attendance"."Meeting Date")
            {
            }
            column(Venue_BoardMeetingAttendance;"Board Meeting Attendance".Venue)
            {
            }
            column(Designation_BoardMeetingAttendance;"Board Meeting Attendance"."Attendance Confirmation")
            {
            }
            column(Name;CompanyInfo.Name)
            {
            }
            column(Picture;CompanyInfo.Picture)
            {
            }
            column(Titlename;Text0001)
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        Text0001: Label 'ATTENDANCE REGISTER';
}

