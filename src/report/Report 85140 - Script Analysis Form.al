report 85140 "Script Analysis Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Script Analysis Form.rdlc';

    dataset
    {
        dataitem("Exam Booking Entries";"Exam Booking Entries")
        {
            DataItemTableView = WHERE(Status=FILTER(Open),Blocked=FILTER(false));
            RequestFilterFields = "Exam Center",Examination;
            column(Logo;CI.Picture)
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
            dataitem(Papers;Papers)
            {
                DataItemLink = Code=FIELD(Paper);
                DataItemTableView = WHERE(Blocked=CONST(false));
                column(CourseName;CourseName)
                {
                }
                column(Code_Papers;Papers.Code)
                {
                }
                column(Course_Papers;Papers.Course)
                {
                }
                column(Section_Papers;Papers.Section)
                {
                }
                column(Part_Papers;Papers.Level)
                {
                }
                column(LevelId;LevelId)
                {
                }
                column(Description_Papers;Papers.Description)
                {
                }
                column(LevelName;LevelName)
                {
                }
                column(NoofPassedStudents_Papers;Papers."No. of Passed Students")
                {
                }
                column(NoofFailedStudents_Papers;Papers."No. of  Failed Students")
                {
                }
                dataitem("Center Dispatch Lines";"Center Dispatch Lines")
                {
                    DataItemLink = "Paper Code"=FIELD(Code),Examination=FIELD(Course);
                    column(QuantityReceived_CenterDispatchLines;"Center Dispatch Lines"."Quantity Received")
                    {
                    }
                    column(NoofEnvelopes_CenterDispatchLines;"Center Dispatch Lines"."No. of Envelopes")
                    {
                    }
                }

                trigger OnPreDataItem()
                var
                    Level: Record Level;
                begin
                end;
            }

            trigger OnAfterGetRecord()
            begin
                   Level.Reset;
                    Level.SetRange(Code,"Exam Booking Entries".Part);
                    if Level.FindFirst then begin
                      LevelName:=Level.Description;
                      LevelId:=Level.Level;
                    end;
                    Courses.Reset;
                    Courses.SetRange(Code,"Exam Booking Entries".Examination);
                    if Courses.FindFirst then begin
                      CourseName:=Courses.Description+'- ('+Courses.Code+') EXAMINATION ';
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        CenterCourseCapacity: Record "Center Course Capacity";
        LevelName: Text;
        Level: Record Level;
        LevelId: Integer;
        Courses: Record Courses;
        CourseName: Text;
}

