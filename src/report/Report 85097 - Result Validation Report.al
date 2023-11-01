report 85097 "Result Validation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Result Validation Report.rdlc';

    dataset
    {
        dataitem("Exam Sitting Cycle";"Exam Sitting Cycle")
        {
            dataitem("Exam Booking Entries";"Exam Booking Entries")
            {
                DataItemLink = "Exam Sitting"=FIELD("Exam Sitting Cycle");
                column(StudentRegNo_ExamBookingEntries;"Exam Booking Entries"."Student Reg No.")
                {
                }
                column(StudentName_ExamBookingEntries;"Exam Booking Entries"."Student Name")
                {
                }
                column(Examination_ExamBookingEntries;"Exam Booking Entries".Examination)
                {
                }
                column(ExamSitting_ExamBookingEntries;"Exam Booking Entries"."Exam Sitting")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //check if student attemted the booked papers
                    Results.Reset;
                    Results.SetRange("Student Reg No.","Exam Booking Entries"."Student Reg No.");
                    if not Results.FindFirst then begin
                      //mark the booked entries as failed
                      BookingEntries.Reset;
                      BookingEntries.SetRange("Student Reg No.","Exam Booking Entries"."Student Reg No.");
                      BookingEntries.SetRange(Status,BookingEntries.Status::Open);
                      BookingEntries.SetRange("Exam Sitting","Exam Sitting Cycle"."Exam Sitting Cycle");
                      if BookingEntries.FindSet then begin
                        repeat
                          BookingEntries.Status:=BookingEntries.Status::Failed;
                          BookingEntries.Modify(true);
                        until BookingEntries.Next=0;
                      end
                    end;

                    //check if student is in the last level and if they have passed all the papers
                    Passed:=true;
                      Level.Reset;
                      Level.SetRange(Course,"Exam Booking Entries".Examination);
                      Level.SetCurrentKey(Level);
                      Level.SetAscending(Level,true);
                      if Level.FindLast then begin
                        //get the papers
                        Papers.Reset;
                        Papers.SetRange(Level,Level.Code);
                        Papers.SetRange(Course,"Exam Booking Entries".Examination);
                        if Papers.FindSet then begin
                          repeat
                            if Passed=true then begin
                                BookingEntries.Reset;
                                BookingEntries.SetRange("Student Reg No.","Exam Booking Entries"."Student Reg No.");
                                BookingEntries.SetRange(Paper,Papers.Code);
                                BookingEntries.SetRange(Status,BookingEntries.Status::Passed);
                                if BookingEntries.FindFirst then
                                  Passed:=true
                                end else
                                  Passed:=false;
                          until Papers.Next=0
                        end;
                        //if passed is true for all modify the student to graduate
                        if Passed=true then begin
                           ExaminationAccount.Reset;
                           ExaminationAccount.SetRange("Registration No.","Exam Booking Entries"."Student Reg No.");
                           ExaminationAccount.SetRange(Status,ExaminationAccount.Status::Active);
                           if ExaminationAccount.FindFirst then begin
                             ExaminationAccount.Status:=ExaminationAccount.Status::Graduate;
                             ExaminationAccount."Status Remarks":=Format(ExaminationAccount.Status::Graduate)+':'+"Exam Sitting Cycle"."Exam Sitting Cycle";
                             ExaminationAccount.Modify(true);
                            end
                        end
                      end
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

    var
        Results: Record "Examination Results";
        BookingEntries: Record "Exam Booking Entries";
        Exams: Record Courses;
        Level: Record Level;
        Papers: Record Papers;
        Passed: Boolean;
        ExaminationAccount: Record "Examination Account";
}

