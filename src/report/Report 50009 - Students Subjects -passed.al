report 50009 "Students Subjects -passed"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Students Subjects -passed.rdlc';

    dataset
    {
        dataitem("Examination Account";"Examination Account")
        {
            RequestFilterFields = "Registration No.";
            column(RegistrationNo_ExaminationAccount;"Examination Account"."Registration No.")
            {
            }
            dataitem("Exam Booking Entries";"Exam Booking Entries")
            {
                DataItemLink = "Student Reg No."=FIELD("Registration No.");
                DataItemTableView = WHERE(Code=FILTER(=''));
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

                trigger OnAfterGetRecord()
                begin


                    Papers.Reset;
                    Papers.SetRange(Level,"Exam Booking Entries".Part);
                    Papers.SetRange(Course,"Exam Booking Entries".Examination);
                    if Papers.FindSet then begin
                      repeat

                        ExamBookingEntries.Reset;
                        ExamBookingEntries.SetRange("Student Reg No.","Examination Account"."Registration No.");
                        ExamBookingEntries.SetRange(Paper,Papers.Code);
                        ExamBookingEntries.SetRange(Blocked,false);
                        if  not ExamBookingEntries.FindSet then begin
                          ExemptionEntries.Reset;
                          ExemptionEntries.SetRange("No.",Papers.Code);
                          ExemptionEntries.SetRange("Stud. Reg. No","Examination Account"."Registration No.");
                          ExemptionEntries.SetRange(Deleted,false);
                          if not ExemptionEntries.FindSet then begin
                            //insert the paper
                            //SubjectsPassed.INIT;
                            SubjectsPassed.Reset;
                            if SubjectsPassed.FindLast then
                            LineNo:=SubjectsPassed."Entry No.";
                            SubjectsPassed1.Reset;
                            SubjectsPassed1.SetRange("Student Reg No.","Examination Account"."Registration No.");
                            SubjectsPassed1.SetRange(Paper,Papers.Code);
                            if not SubjectsPassed1.FindFirst then begin
                            SubjectsPassed.Init;
                            SubjectsPassed."Entry No.":=LineNo+1;
                            SubjectsPassed."Student Reg No.":="Examination Account"."Registration No.";
                            SubjectsPassed.Paper:=Papers.Code;
                            SubjectsPassed.Insert(true);
                            end;
                          end;

                        end
                      until Papers.Next=0;
                    end;

                    //MESSAGE('Last Level %1',"Exam Booking Entries".Part);NSC/87
                end;
            }

            trigger OnAfterGetRecord()
            begin
                NumCode:=CopyStr("Examination Account"."Registration No.",5,10);
                Evaluate(NumInt,NumCode);


                if NumInt<165192 then
                   CurrReport.Skip;
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

    var
        Level: Record Level;
        ExemptionEntries: Record "Exemption Entries";
        ExamBookingEntries: Record "Exam Booking Entries";
        Papers: Record Papers;
        SubjectsPassed: Record "Subjects Passed";
        LineNo: Integer;
        SubjectsPassed1: Record "Subjects Passed";
        NumCode: Code[10];
        NumInt: Integer;
}

