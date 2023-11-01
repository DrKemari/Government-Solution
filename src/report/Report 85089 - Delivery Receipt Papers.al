report 85089 "Delivery Receipt Papers"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Delivery Receipt Papers.rdlc';

    dataset
    {
        dataitem("Timetable Planner Lines";"Timetable Planner Lines")
        {
            column(Logo;CI.Picture)
            {
            }
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
            column(LevelNo;LevelNo)
            {
            }
            column(CoursesType;CoursesType)
            {
            }
            column(ExaminationCentres;ExaminationCentres)
            {
            }
            column(ExaminationDate;ExaminationDate)
            {
            }
            column(CenterName_ExamBookingEntries;CenterName)
            {
            }
            dataitem("Exam Booking Entries";"Exam Booking Entries")
            {
                DataItemLink = "Exam Sitting"=FIELD("Exam Sitting ID"),Paper=FIELD(Paper);
                column(StudentRegNo_ExamBookingEntries;"Exam Booking Entries"."Student Reg No.")
                {
                }
                column(StudentName_ExamBookingEntries;"Exam Booking Entries"."Student Name")
                {
                }
                column(Examination_ExamBookingEntries;"Exam Booking Entries".Examination)
                {
                }
                column(Section_ExamBookingEntries;"Exam Booking Entries".Section)
                {
                }
                column(Part_ExamBookingEntries;"Exam Booking Entries".Part)
                {
                }
                column(Paper_ExamBookingEntries;"Exam Booking Entries".Paper)
                {
                }
                column(Description_ExamBookingEntries;"Exam Booking Entries".Description)
                {
                }
                column(CurrencyCode_ExamBookingEntries;"Exam Booking Entries"."Currency Code")
                {
                }
                column(FeeAmount_ExamBookingEntries;"Exam Booking Entries"."Fee Amount")
                {
                }
                column(FeeAmountLCY_ExamBookingEntries;"Exam Booking Entries"."Fee Amount LCY")
                {
                }
                column(ExamCenter_ExamBookingEntries;"Exam Booking Entries"."Exam Center")
                {
                }
                column(ExamSitting_ExamBookingEntries;"Exam Booking Entries"."Exam Sitting")
                {
                }
                column(Year_ExamBookingEntries;"Exam Booking Entries".Year)
                {
                }

                trigger OnPreDataItem()
                begin
                    "Exam Booking Entries".SetRange("Exam Booking Entries"."Exam Center",ExaminationCentres);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Courses.Reset;
                Courses.SetRange(Code,"Timetable Planner Lines".Examination);
                if Courses.FindFirst then begin
                  CoursesType:=Format(Courses.Type);
                end;
                Centres.Reset;
                Centres.SetRange(Code,ExaminationCentres);
                if Centres.FindFirst then begin
                  CenterName:=Centres.Name;
                end;
                LevelRec.Reset;
                LevelRec.SetRange(Code,"Timetable Planner Lines".Part);
                if LevelRec.FindFirst then begin
                  LevelNo:=LevelRec.Level;
                end
            end;

            trigger OnPreDataItem()
            begin
                "Timetable Planner Lines".SetRange("Timetable Planner Lines".Date,ExaminationDate)
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Examination Center";ExaminationCentres)
                {
                    ShowMandatory = true;
                    TableRelation = "Examination Centres";
                }
                field("Date of Examination";ExaminationDate)
                {
                    ShowMandatory = true;
                }
            }
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
        CoursesType: Text;
        ExaminationCentres: Text;
        ExaminationDate: Date;
        Courses: Record Courses;
        CenterName: Text;
        Centres: Record "Examination Centres";
        LevelRec: Record Level;
        LevelNo: Integer;
}

