report 85040 "Examination Cerificate"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Examination Cerificate.rdlc';

    dataset
    {
        dataitem("Examination Account";"Examination Account")
        {
            column(Logo;CI.Picture)
            {
            }
            column(RegistrationNo_ExaminationAccount;"Examination Account"."Registration No.")
            {
            }
            column(StudentCustNo_ExaminationAccount;"Examination Account"."Student Cust No.")
            {
            }
            column(CourseID_ExaminationAccount;"Examination Account"."Course ID")
            {
            }
            column(CourseDescription_ExaminationAccount;"Examination Account"."Course Description")
            {
            }
            column(CurrentExaminationCycle_ExaminationAccount;"Examination Account"."Current Examination Sitting")
            {
            }
            column(FirstName_ExaminationAccount;"Examination Account"."First Name")
            {
            }
            column(MiddleName_ExaminationAccount;"Examination Account"."Middle Name")
            {
            }
            column(Surname_ExaminationAccount;"Examination Account".Surname)
            {
            }
            column(IDNo_ExaminationAccount;"Examination Account"."ID No.")
            {
            }
            column(RegistrationDate_ExaminationAccount;"Examination Account"."Registration Date")
            {
            }
            column(CurrencyCode_ExaminationAccount;"Examination Account"."Currency Code")
            {
            }
            column(PartNo;PartNo)
            {
            }
            column(CourseNo;CourseNo)
            {
            }
            column(Address_ExaminationAccount;"Examination Account".Address)
            {
            }
            dataitem("Exam Booking Entries";"Exam Booking Entries")
            {
                DataItemLink = "Student Reg No."=FIELD("Registration No."),"Exam Sitting"=FIELD("Current Examination Sitting");
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
            }

            trigger OnAfterGetRecord()
            begin
                CourseNo:='CA789069';
                PartNo:='CA1201960589';
                //get the number from course and part
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
        CourseNo: Code[30];
        PartNo: Code[30];
}

