report 85020 "Center Booking Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Center Booking Details.rdlc';

    dataset
    {
        dataitem("Examination Centres";"Examination Centres")
        {
            RequestFilterFields = "Code";
            column(Logo;CI.Picture)
            {
            }
            column(Code_ExamCenter;"Examination Centres".Code)
            {
            }
            column(Name_ExamCenter;"Examination Centres".Name)
            {
            }
        }
        dataitem("Timetable Planner Lines";"Timetable Planner Lines")
        {
            column(Examination_TimetablePlannerLines;"Timetable Planner Lines".Examination)
            {
            }
            column(Section_TimetablePlannerLines;"Timetable Planner Lines".Section)
            {
            }
            column(Paper_TimetablePlannerLines;"Timetable Planner Lines".Paper)
            {
            }
            column(Description_TimetablePlannerLines;"Timetable Planner Lines".Description)
            {
            }
            column(Date_TimetablePlannerLines;"Timetable Planner Lines".Date)
            {
            }
            column(StartTime_TimetablePlannerLines;"Timetable Planner Lines"."Start Time")
            {
            }
            column(EndTime_TimetablePlannerLines;"Timetable Planner Lines"."End Time")
            {
            }
            column(Day_TimetablePlannerLines;"Timetable Planner Lines".Day)
            {
            }
            column(ExamDuration_TimetablePlannerLines;"Timetable Planner Lines"."Exam Duration")
            {
            }
            column(ExamSittingID_TimetablePlannerLines;"Timetable Planner Lines"."Exam Sitting ID")
            {
            }
            column(Part_TimetablePlannerLines;"Timetable Planner Lines".Part)
            {
            }
            column(Session_TimetablePlannerLines;"Timetable Planner Lines".Session)
            {
            }
            column(SessionCode_TimetablePlannerLines;"Timetable Planner Lines"."Session Code")
            {
            }
            column(PlannedCapacity_TimetablePlannerLines;"Timetable Planner Lines"."Planned Capacity")
            {
            }
            column(TotalCapacity_TimetablePlannerLines;"Timetable Planner Lines"."Total Capacity")
            {
            }
            column(TotalNo;TotalNo)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TotalNo:=0;
                ExamBookingEntries.Reset;
                ExamBookingEntries.SetRange("Exam Center","Examination Centres".Code);
                ExamBookingEntries.SetRange(Paper,"Timetable Planner Lines".Paper);
                if ExamBookingEntries.FindSet then begin
                  repeat
                    TotalNo:=TotalNo+1;
                  until ExamBookingEntries.Next=0;
                end
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

    trigger OnInitReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalNo: Integer;
        CI: Record "Company Information";
}

