report 85036 "Exam Envelopes Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Exam Envelopes Report.rdlc';

    dataset
    {
        dataitem("Exam Booking Entries";"Exam Booking Entries")
        {
            RequestFilterFields = "Exam Sitting",Examination;
            column(Logo;CI.Picture)
            {
            }
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
            column(Course_ExamBookingEntries;Courses.Description)
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
            column(ExamSittingCycle_ExamBookingEntries;"Exam Booking Entries"."Exam Sitting")
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
            column(ProjectCode_ExamBookingEntries;"Exam Booking Entries"."Project Code")
            {
            }
            column(Status_ExamBookingEntries;"Exam Booking Entries".Status)
            {
            }
            column(TotalEnvelopes;TotalEnvelopes)
            {
            }
            column(CenterNo;CenterNo)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Courses.Reset;
                Courses.SetRange(Code,"Exam Booking Entries".Examination);
                if Courses.FindFirst then begin
                end;
                  TotalNo:=0;
                ExamBookingEntries.Reset;
                ExamBookingEntries.SetRange("Exam Center","Exam Booking Entries"."Exam Center");
                ExamBookingEntries.SetRange("Exam Sitting","Exam Booking Entries"."Exam Sitting");
                ExamBookingEntries.SetRange(Paper,"Exam Booking Entries".Paper);
                if ExamBookingEntries.FindSet then begin
                    TotalNo:=ExamBookingEntries.Count;


                end;
                ExaminationCentres.Reset;
                ExaminationCentres.SetRange(Code,"Exam Booking Entries"."Exam Center");
                if ExaminationCentres.FindFirst then begin
                CenterNo:=ExaminationCentres."Code No.";
                 end;
                TotalEnvelopes:=0;
                  ExaminationSetup.Get;
                  ExaminationSetup.TestField("Envelope Value");
                if TotalNo<ExaminationSetup."Envelope Value" then
                  TotalEnvelopes:=1
                 else
                TotalEnvelopes:=Round(TotalNo/ExaminationSetup."Envelope Value",1,'>');
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
    end;

    var
        CI: Record "Company Information";
        Courses: Record Courses;
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalNo: Integer;
        ExaminationSetup: Record "Examination Setup";
        TotalEnvelopes: Integer;
        ExaminationCentres: Record "Examination Centres";
        CenterNo: Integer;
}

