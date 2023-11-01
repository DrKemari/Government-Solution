report 85085 "Center Daily Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Center Daily Summary.rdlc';

    dataset
    {
        dataitem("Examination Centres";"Examination Centres")
        {
            RequestFilterFields = "Code";
            column(Code_ExaminationCentres;"Examination Centres".Code)
            {
            }
            column(Name_ExaminationCentres;"Examination Centres".Name)
            {
            }
            column(Blocked_ExaminationCentres;"Examination Centres".Blocked)
            {
            }
            column(Name2_ExaminationCentres;"Examination Centres"."Name 2")
            {
            }
            column(Address_ExaminationCentres;"Examination Centres".Address)
            {
            }
            column(Address2_ExaminationCentres;"Examination Centres"."Address 2")
            {
            }
            column(City_ExaminationCentres;"Examination Centres".City)
            {
            }
            dataitem("Exam Booking Entries";"Exam Booking Entries")
            {
                DataItemLink = "Exam Center"=FIELD(Code);
                DataItemTableView = WHERE(Cancelled=FILTER(false),Paper=FILTER(<>''),Status=FILTER(Open));
                RequestFilterFields = "Exam Sitting";
                column(Code_ExamBookingEntries;"Exam Booking Entries".Code)
                {
                }
                column(EntryNo_ExamBookingEntries;"Exam Booking Entries"."Entry No.")
                {
                }
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
                column(CenterName_ExamBookingEntries;"Exam Booking Entries"."Center Name")
                {
                }
                column(ExamSitting_ExamBookingEntries;"Exam Booking Entries"."Exam Sitting")
                {
                }
                column(Year_ExamBookingEntries;"Exam Booking Entries".Year)
                {
                }
                column(Blocked_ExamBookingEntries;"Exam Booking Entries".Blocked)
                {
                }
                column(StudCustNo_ExamBookingEntries;"Exam Booking Entries"."Stud. Cust No.")
                {
                }
                column(PaperDate;PaperDate)
                {
                }
                column(PaperTime;PaperTime)
                {
                }
                column(PaperEndTime;PaperEndTime)
                {
                }
                column(Day;Day)
                {
                }
                column(SessionCode;SessionCode)
                {
                }
                dataitem(LevelName;Level)
                {
                    DataItemLink = Code=FIELD(Part);
                    column(Name;LevelName.Description)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    //get the planning lines
                    PaperDate:='';
                    PaperTime:='';
                      PaperEndTime:='';
                    TimetablePlannerLines.Reset;
                    TimetablePlannerLines.SetRange("Exam Sitting ID","Exam Booking Entries"."Exam Sitting");
                    TimetablePlannerLines.SetRange(Paper,"Exam Booking Entries".Paper);
                    if TimetablePlannerLines.FindSet then begin
                      Day:=TimetablePlannerLines.Day;
                      PaperDate:=Format(TimetablePlannerLines.Date,0,'<Day,2>/<Month,2>/<Year4>');
                      PaperTime:=Format(TimetablePlannerLines."Start Time",0,'<Hours12,2>:<Minutes,2> <AM/PM>');
                      PaperEndTime:=Format(TimetablePlannerLines."End Time",0,'<Hours12,2>:<Minutes,2> <AM/PM>');
                      ExamLevel:=TimetablePlannerLines.Part;
                      SessionCode:=TimetablePlannerLines."Session Code";
                    end
                end;
            }

            trigger OnAfterGetRecord()
            var
                TXT001: Label 'The student %1,must have a valid photo on the student card';
            begin
            end;

            trigger OnPostDataItem()
            var
                TXT001: Label 'The student %1,must have a valid photo on the student card';
            begin
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
        CompanyInfo.Get;
        ExaminationSetup.Get;
        Employee.Reset;
        Employee.SetRange("User ID",ExaminationSetup."Timetable Issuer");
        if Employee.FindFirst then begin
         IssuerName:=Employee.Initials;

        end;
        UserSetup.Reset;
        UserSetup.SetRange("User ID",ExaminationSetup."Timetable Issuer");
        if UserSetup.FindFirst then begin
          UserSetup.CalcFields(Picture);
        end
    end;

    var
        TimetablePlannerLines: Record "Timetable Planner Lines";
        PaperDate: Text;
        PaperTime: Text;
        PaperEndTime: Text;
        Customer: Record Customer;
        StudentHeader: Record "Student Processing Header";
        CustPic: OutStream;
        CI: Record "Company Information";
        CompanyInfo: Record "Company Information";
        Day: Text;
        ExaminationSetup: Record "Examination Setup";
        IssuerName: Text;
        Employee: Record Employee;
        ExamLevel: Code[20];
        StudentDate: Text;
        UserSetup: Record "User Setup";
        SessionCode: Text;
}

