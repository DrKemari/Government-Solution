report 50001 "Modify Exam Booking Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Modify Exam Booking Entries.rdlc';

    dataset
    {
        dataitem("Exam Booking Entries-Buffer";"Exam Booking Entries-Buffer")
        {

            trigger OnAfterGetRecord()
            begin
                Papers.Reset;
                Papers.SetRange(Code,"Exam Booking Entries-Buffer".Paper);
                if Papers.FindSet then begin
                    "Exam Booking Entries-Buffer".Part:=Papers.Level;
                     "Exam Booking Entries-Buffer".Modify;
                  end;
                
                
                
                
                
                
                /*"Examination Results".VALIDATE("Examination Results"."Student Reg No.");
                "Examination Results".VALIDATE("Examination Results".Part);
                "Examination Results".VALIDATE("Examination Results".Paper);
                 "Examination Results".MODIFY;*/
                //
                // IF (("Examination Results"."Issue Date"=051021D) AND ("Examination Results".Examination='CPA')
                // AND ("Examination Results"."Examination Sitting ID"='DECEMBER')) THEN BEGIN
                //     "Examination Results"."Examination Sitting ID":='AUGUST 2021';
                //     "Examination Results".MODIFY;
                // END;
                
                /*
                ExamBookingEntries.RESET;
                ExamBookingEntries.SETRANGE("Student Reg No.","Duplicate Booking Entries"."Stud Reg No");
                ExamBookingEntries.SETRANGE(Examination,"Duplicate Booking Entries".Examination);
                ExamBookingEntries.SETRANGE(Part,"Duplicate Booking Entries".Part);
                ExamBookingEntries.SETRANGE(Paper,"Duplicate Booking Entries".Paper);
                IF ExamBookingEntries.FIND('-') THEN BEGIN
                  ExamBookingEntries."To Delete":=TRUE;
                  ExamBookingEntries.MODIFY;
                END;
                
                */
                
                
                //    CountNum:=0;
                //    Level.RESET;
                //    Level.SETRANGE(Course,"Exam Booking Entries".Examination);
                //    Level.SETRANGE(Code,"Exam Booking Entries".Part);
                //    IF Level.FIND('-') THEN BEGIN
                //        CountNum:=CountNum+1;
                //        IF CountNum=1 THEN BEGIN
                //            ExamBookingEntries.RESET;
                //            ExamBookingEntries.SETRANGE("Student Reg No.",ExaminationAcc."Registration No.");
                //            ExamBookingEntries.SETRANGE(Examination,Level.Course);
                //            ExamBookingEntries.SETRANGE(Part,Level.Code);
                //            IF ExamBookingEntries.FIND('-') THEN BEGIN
                //              REPEAT
                //                  MESSAGE('Part %1 and ExamBookingEntries."Student Reg No." %2 ',ExamBookingEntries.Part,ExamBookingEntries."Student Reg No.");
                //              UNTIL ExamBookingEntries.NEXT=0;
                //            END;
                //        END
                //    END;
                
                //get total number of level
                // ExamBookingEntries1.RESET;
                // ExamBookingEntries1.SETRANGE("Student Reg No.","Examination Account"."Registration No.");
                // IF ExamBookingEntries1.FINDSET THEN BEGIN
                // TotalStudent:=0;
                // CountNum:=0;
                // Courses.RESET;
                // Courses.SETRANGE(Code,ExamBookingEntries1.Examination);
                //        IF Courses.FINDFIRST THEN BEGIN
                //          //get total level
                //          Level.RESET;
                //          Level.SETRANGE(Course,Courses.Code);
                //                IF Level.FINDSET THEN BEGIN
                //                 REPEAT
                //                          CountNum+=1;
                //                       ExamBookingEntries.RESET;
                //                       ExamBookingEntries.SETRANGE(Part,Level.Code);
                //                       ExamBookingEntries.SETRANGE(Status,ExamBookingEntries.Status::Failed);
                //                       ExamBookingEntries.SETRANGE("Student Reg No.",ExamBookingEntries1."Student Reg No.");
                //                       IF ExamBookingEntries.FINDFIRST THEN BEGIN
                //                         TotalStudent+=1;
                //
                //                       END;
                //
                //
                //                   IF TotalStudent>1 THEN BEGIN
                //                   //mark student as more
                //                       ExamBookingEntries1.RESET;
                //                      ExamBookingEntries1.SETRANGE(Part,Level.Code);
                //                      ExamBookingEntries.SETRANGE(Status,ExamBookingEntries.Status::Failed);
                //                      ExamBookingEntries1.SETRANGE("Student Reg No.",ExamBookingEntries1."Student Reg No.");
                //                      IF ExamBookingEntries.FINDFIRST THEN BEGIN
                //                        ExamBookingEntries.More:=TotalStudent;
                //                        ExamBookingEntries.MODIFY(TRUE);
                //                      END;
                //                 END;
                //                  UNTIL Level.NEXT=0;
                //          ExamBookingEntries.RESET;
                //           ExamBookingEntries.SETRANGE(Status,ExamBookingEntries.Status::Failed);
                //           ExamBookingEntries.SETFILTER(More,'>%1',1);
                //          ExamBookingEntries.SETRANGE("Student Reg No.",ExamBookingEntries1."Student Reg No.");
                //          IF ExamBookingEntries.FINDFIRST THEN BEGIN
                //                               //delete
                //                    LevelCode:=ExamBookingEntries.Part;
                //                                      ExamBookingEntries3.RESET;
                //                    ExamBookingEntries3.SETRANGE(Part,LevelCode);
                //                    ExamBookingEntries3.SETRANGE(Status,ExamBookingEntries.Status::Failed);
                //                    ExamBookingEntries3.SETRANGE("Student Reg No.",ExamBookingEntries1."Student Reg No.");
                //                    IF ExamBookingEntries3.FINDSET THEN BEGIN
                //
                //                     ExamBookingEntries3.DELETEALL;
                //                    END;
                //
                //
                //        END;
                //               END
                //        END;
                //        //if greater than 1 mark lowest level
                //
                // END

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
        BudgetDate: Date;
        Courses: Record Courses;
        CountNum: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Level: Record Level;
        ExaminationAcc: Record "Examination Account";
        TotalStudent: Integer;
        ExamBookingEntries1: Record "Exam Booking Entries";
        ExamBookingEntries2: Record "Exam Booking Entries";
        Level1: Record Level;
        LevelCode: Code[30];
        ExamBookingEntries3: Record "Exam Booking Entries";
        Papers: Record Papers;
}

