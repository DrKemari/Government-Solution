report 85012 "Timetable Planner"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Timetable Planner.rdlc';

    dataset
    {
        dataitem("Timetable Planner Header";"Timetable Planner Header")
        {
            column(Name;CI.Name)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(Code_TimetablePlannerHeader;"Timetable Planner Header".Code)
            {
            }
            column(ExamID_TimetablePlannerHeader;"Timetable Planner Header"."Exam ID")
            {
            }
            column(ExamSittingID_TimetablePlannerHeader;"Timetable Planner Header"."Exam Sitting ID")
            {
            }
            column(DocumentDate_TimetablePlannerHeader;"Timetable Planner Header"."Document Date")
            {
            }
            column(FinancialYearCode_TimetablePlannerHeader;"Timetable Planner Header"."Financial Year Code")
            {
            }
            column(Description_TimetablePlannerHeader;"Timetable Planner Header".Description)
            {
            }
            column(CorporateStrategicPlanID_TimetablePlannerHeader;"Timetable Planner Header"."Corporate Strategic Plan ID")
            {
            }
            column(FinancialBudgetID_TimetablePlannerHeader;"Timetable Planner Header"."Financial Budget ID")
            {
            }
            column(ExamStartDate_TimetablePlannerHeader;"Timetable Planner Header"."Exam Start Date")
            {
            }
            column(ExamEndDate_TimetablePlannerHeader;"Timetable Planner Header"."Exam End Date")
            {
            }
            column(TotalCandidature_TimetablePlannerHeader;"Timetable Planner Header"."Total Candidature")
            {
            }
            column(ApprovalStatus_TimetablePlannerHeader;"Timetable Planner Header"."Approval Status")
            {
            }
            column(Posted_TimetablePlannerHeader;"Timetable Planner Header".Posted)
            {
            }
            column(CreatedBy_TimetablePlannerHeader;"Timetable Planner Header"."Created By")
            {
            }
            column(CreatedOn_TimetablePlannerHeader;"Timetable Planner Header"."Created On")
            {
            }
            column(CreatedTime_TimetablePlannerHeader;"Timetable Planner Header"."Created Time")
            {
            }
            dataitem("Timetable Planner Lines";"Timetable Planner Lines")
            {
                DataItemLink = Code=FIELD(Code);
                column(Code_TimetablePlannerLines;"Timetable Planner Lines".Code)
                {
                }
                column(LineNo_TimetablePlannerLines;"Timetable Planner Lines"."Line No.")
                {
                }
                column(Exam_TimetablePlannerLines;"Timetable Planner Lines".Examination)
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
                column(Date_TimetablePlannerLines;ExamDate)
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

                trigger OnAfterGetRecord()
                begin
                    ExamDate:=Format("Timetable Planner Lines".Date,0,'<Day,2>/<Month,2>/<Year4>');
                end;
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
        ExamDate: Text;
}

