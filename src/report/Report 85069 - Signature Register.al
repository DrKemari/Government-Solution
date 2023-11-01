report 85069 "Signature Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Signature Register.rdlc';
    Caption = 'Signature Register';

    dataset
    {
        dataitem("Exam Booking Entries";"Exam Booking Entries")
        {
            RequestFilterFields = "Exam Center",Examination,"Exam Sitting","Part";
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
            column(StudentEmail;StudentEmail)
            {
            }
            column(StudentPhone;StudentPhone)
            {
            }
            column(CountNo;CountNo)
            {
            }
            column(StudentID;StudentID)
            {
            }
            dataitem("Examination Account";"Examination Account")
            {
                DataItemLink = "Registration No."=FIELD("Student Reg No.");

                trigger OnAfterGetRecord()
                begin

                    if RegNo<>RegNo1 then begin
                      CountNo+=1;
                    end else
                    CountNo:=CountNo;

                    RegNo1:="Examination Account"."Registration No.";
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //CountNo:=CountNo+1;
                Courses.Reset;
                Courses.SetRange(Code,"Exam Booking Entries".Examination);
                if Courses.FindFirst then begin
                end;

                Customer.Reset;
                Customer.SetRange("No.","Exam Booking Entries"."Stud. Cust No.");
                if Customer.FindFirst then begin
                  StudentEmail:=Customer."E-Mail";
                  StudentID:=Customer."ID. No.";
                  StudentPhone:=Customer."Phone No.";
                end;
                RegNo:="Exam Booking Entries"."Student Reg No.";
            end;

            trigger OnPreDataItem()
            begin
                // IF (("Exam Booking Entries".Part='') OR ("Exam Booking Entries"."Exam Center"='') OR ("Exam Booking Entries"."Exam Sitting"=''))
                //   THEN ERROR('Kindly fill in all the filters');
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
        CountNo:=0;
    end;

    var
        CI: Record "Company Information";
        Courses: Record Courses;
        StudentEmail: Text;
        StudentPhone: Text;
        CountNo: Integer;
        StudentID: Code[30];
        Customer: Record Customer;
        RegNo: Code[30];
        RegNo1: Code[30];
}

