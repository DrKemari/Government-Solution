report 85107 "Diploma Attendance Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Diploma Attendance Register.rdlc';
    Caption = 'Diploma Attendance Register';

    dataset
    {
        dataitem("Examination Centres";"Examination Centres")
        {
            RequestFilterFields = "Code";
            column(CenterName;"Examination Centres".Name)
            {
            }
            column(CenterCode;"Examination Centres".Code)
            {
            }
            column(SittingDate;Sittingtxt)
            {
            }
            column(CourseDescription_ExaminationAccount;Examinationtxt)
            {
            }
            dataitem("Exam Booking Entries";"Exam Booking Entries")
            {
                DataItemLink = "Exam Center"=FIELD(Code);
                DataItemTableView = WHERE(Status=FILTER(Open));
                dataitem("Examination Account";"Examination Account")
                {
                    DataItemLink = "Registration No."=FIELD("Student Reg No.");
                    RequestFilterFields = "Course ID","Registration Date";
                    column(RegistrationNo_ExaminationAccount;IntegerRegnumb)
                    {
                    }
                    column(RegistrationNo;"Examination Account"."Registration No.")
                    {
                    }
                    column(Name_ExaminationAccount;"Examination Account".Name)
                    {
                    }
                    column(IDNo_ExaminationAccount;"Examination Account"."ID No.")
                    {
                    }
                    column(PhoneNo_ExaminationAccount;"Examination Account"."Phone No.")
                    {
                    }
                    column(Email_ExaminationAccount;"Examination Account".Email)
                    {
                    }
                    column(LevelName;levelName1)
                    {
                    }
                    column(levelName2;levelName2)
                    {
                    }
                    column(levelName3;levelName3)
                    {
                    }
                    column(LEVEL1;LEVEL1)
                    {
                    }
                    column(LEVEL2;LEVEL2)
                    {
                    }
                    column(LEVEL3;LEVEL3)
                    {
                    }
                    dataitem("Integer";"Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(Foundvalue;Foundvalue)
                        {
                        }
                        column(Foundvalue1;Foundvalue1)
                        {
                        }
                        column(Foundvalue2;Foundvalue2)
                        {
                        }
                        column(PaperLevel_Value;PaperLevelValue[Number,1])
                        {
                        }
                        column(Paper_Value;PaperValue[Number,1])
                        {
                        }
                        column(Paper_Value_Name;PaperValueName[Number,1])
                        {
                        }
                        column(Status_Value;StatusValue[Number,1])
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            Integer.SetRange(Number,1,No-1);
                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin

                         if( (Examinationtxt='') or (Sittingtxt=''))then begin
                           Error('Kindly fill in the Examination or the Sitting');
                         end else
                         begin
                           ExaminationCentertxt:="Examination Centres".Code;
                          end;
                          Regnumb:=CopyStr("Examination Account"."Registration No.",5);
                           Evaluate(IntegerRegnumb,Regnumb);

                         //get centername
                        ExaminationCentres.Reset;
                        ExaminationCentres.SetRange(Code,ExaminationCentertxt);
                        if ExaminationCentres.FindFirst then begin
                          CenterName:=ExaminationCentres.Name;
                        end;

                          Foundvalue:=false;
                          Foundvalue1:=false;
                          Foundvalue2:=false;



                        ExaminationAccount.Reset;
                        ExaminationAccount.SetRange("Registration No.","Examination Account"."Registration No.");
                        if ExaminationAccount.FindFirst then begin
                           //check all papers in a level
                         Level.Reset;
                         Level.SetRange(Course,ExaminationAccount."Course ID");
                         Level.SetRange(Code,LEVEL1);
                         if Level.FindSet then begin
                          // levelName1:=Level.Description;
                          BookingEntries.Reset;
                          BookingEntries.SetRange(Part,Level.Code);
                          BookingEntries.SetRange(Status,BookingEntries.Status::Open);
                          BookingEntries.SetRange("Exam Center",ExaminationCentertxt);
                          BookingEntries.SetRange("Student Reg No.",ExaminationAccount."Registration No.");
                          BookingEntries.SetRange(Blocked,false);
                          if BookingEntries.FindFirst then begin
                            Foundvalue:=true;

                          end
                          else begin
                          Foundvalue:=false;
                            //LOOK
                                     Level.Reset;
                                     Level.SetRange(Course,ExaminationAccount."Course ID");
                                     Level.SetRange(Code,LEVEL2);
                                     if Level.FindSet then begin
                                      // levelName2:=Level.Description;
                                     BookingEntries.Reset;
                                      BookingEntries.SetRange(Part,Level.Code);
                                      BookingEntries.SetRange(Status,BookingEntries.Status::Open);
                                      BookingEntries.SetRange("Exam Center",ExaminationCentertxt);
                                      BookingEntries.SetRange("Student Reg No.",ExaminationAccount."Registration No.");
                                      if BookingEntries.FindFirst then begin
                                        Foundvalue1:=true;
                                      end else begin
                                       Foundvalue1:=false;
                                        //FIADVANCEND
                                         Level.Reset;
                                         Level.SetRange(Course,ExaminationAccount."Course ID");
                                         Level.SetRange(Code,LEVEL3);
                                         if Level.FindSet then begin
                                          // levelName3:=Level.Description;
                                          BookingEntries.Reset;
                                          BookingEntries.SetRange(Part,Level.Code);
                                          BookingEntries.SetRange(Status,BookingEntries.Status::Open);
                                          BookingEntries.SetRange("Exam Center",ExaminationCentertxt);
                                          BookingEntries.SetRange("Student Reg No.",ExaminationAccount."Registration No.");
                                          BookingEntries.SetRange(Blocked,false);
                                          if BookingEntries.FindFirst then begin
                                            Foundvalue2:=true;
                                          end else begin
                                           Foundvalue2:=false;

                                          end;
                                         end;
                                        //END FIND ADNANCED


                                      end;
                                     end;

                          end;

                         end;

                         No:=1;
                         No1:=1;
                         StatusValue[No,1]:='NOT BOOKED';
                         Papers1.Reset;
                         Papers1.SetRange(Course,ExaminationAccount."Course ID");
                         Papers1.SetRange(Blocked,false);
                         if Papers1.FindSet then begin
                          repeat


                              PaperValue[No,1]:=Papers1.Code;
                              PaperLevelValue[No,1]:=Papers1.Level;
                              PaperValueName[No,1]:=Papers1.Description;

                                    //verify the student has entry for that center
                        //      CenterBookingEntries.RESET;
                        //      CenterBookingEntries.SETRANGE("Exam Center Code",ExaminationCentertxt);
                        //      CenterBookingEntries.SETRANGE("Student Reg No.",ExaminationAccount."Registration No.");
                        //      IF CenterBookingEntries.FINDFIRST THEN BEGIN
                                      StatusValue[No,1]:='NOT BOOKED';
                                      ExamBookingEntries.Reset;
                                      ExamBookingEntries.SetRange(Paper,Papers1.Code);
                                      ExamBookingEntries.SetRange("Exam Center",ExaminationCentertxt);
                                      ExamBookingEntries.SetRange("Student Reg No.",ExaminationAccount."Registration No.");
                                      ExamBookingEntries.SetRange(Status,ExamBookingEntries.Status::Open);
                                      if ExamBookingEntries.FindSet then begin
                                        StatusValue[No,1]:=' ';


                                      end;

                                               //if not found
                                          ExemptionEntries.Reset;
                                          ExemptionEntries.SetRange("Stud. Reg. No",ExaminationAccount."Registration No.");
                                          ExemptionEntries.SetRange("No.",Papers1.Code);
                                          if ExemptionEntries.FindFirst then begin


                                            StatusValue[No,1]:='EXEMPTED';

                                          end;

                                      ExamBookingEntries.Reset;
                                      ExamBookingEntries.SetRange(Paper,Papers1.Code);
                                      ExamBookingEntries.SetRange("Student Reg No.",ExaminationAccount."Registration No.");
                                      ExamBookingEntries.SetRange(Status,ExamBookingEntries.Status::Passed);
                                      if ExamBookingEntries.FindFirst then begin
                                        StatusValue[No,1]:='PASS';
                                      end;



                           No+=1;
                         until Papers1.Next=0;

                         end;
                         end
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                     Courses.Reset;
                     Courses.SetRange(Code,"Exam Booking Entries".Examination);
                     if Courses.FindFirst then begin
                      if Courses.Type=Courses.Type::"Post-Graduate" then begin
                         LEVEL1:='MODULE 1';
                         LEVEL2:='MODULE 2';
                         LEVEL3:='MODULE 3';

                        end  else
                          begin
                         LEVEL1:='LEVEL 1';
                         LEVEL2:='LEVEL 2';
                         LEVEL3:='LEVEL 3';
                        end;
                        end;
                                 Level.Reset;
                                 Level.SetRange(Course,"Exam Booking Entries".Examination);
                                 Level.SetRange(Code,LEVEL1);
                                 if Level.FindSet then begin
                                   levelName1:=Level.Description;
                                  end;

                                 Level.Reset;
                                 Level.SetRange(Course,"Exam Booking Entries".Examination);
                                 Level.SetRange(Code,LEVEL2);
                                 if Level.FindSet then begin
                                   levelName2:=Level.Description;
                                  end;

                                 Level.Reset;
                                 Level.SetRange(Course,"Exam Booking Entries".Examination);
                                 Level.SetRange(Code,LEVEL3);
                                 if Level.FindSet then begin
                                   levelName3:=Level.Description;
                                  end;
                end;

                trigger OnPreDataItem()
                begin
                    "Exam Booking Entries".SetRange("Exam Booking Entries".Examination,Examinationtxt);
                    "Exam Booking Entries".SetRange("Exam Booking Entries"."Exam Center","Examination Centres".Code);
                    "Exam Booking Entries".SetRange("Exam Booking Entries"."Exam Sitting",Sittingtxt);
                    "Exam Booking Entries".SetRange("Exam Booking Entries".Blocked,false);

                end;
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(SITTING;Sittingtxt)
                {
                    ShowMandatory = true;
                    TableRelation = "Exam Sitting Cycle";
                }
                field(EXAMINATION;Examinationtxt)
                {
                    ShowMandatory = true;
                    TableRelation = Courses WHERE (Type=FILTER(Diploma|"Post-Graduate"|Professional));
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
        CountNo:=0;
    end;

    var
        CI: Record "Company Information";
        StudentEmail: Text;
        StudentPhone: Text;
        CountNo: Integer;
        StudentID: Code[30];
        Customer: Record Customer;
        RegNo: Code[30];
        RegNo1: Code[30];
        ExemptionEntries: Record "Exemption Entries";
        ExamBookingEntries: Record "Exam Booking Entries";
        ExamStatus: Code[30];
        LEVEL1: Text;
        LEVEL2: Text;
        LEVEL3: Text;
        Level: Record Level;
        Loopvalue: Integer;
        Examtxt: Code[50];
        ExaminationResults: Record "Examination Results";
        Papers1: Record Papers;
        PaperLevel: Code[30];
        PaperCode: Code[30];
        Foundvalue: Boolean;
        Foundvalue1: Boolean;
        Foundvalue2: Boolean;
        PaperValue: array [20,20] of Code[30];
        PaperValueName: array [20,100] of Text;
        StatusValue: array [30,30] of Code[30];
        No: Integer;
        No1: Integer;
        Courses: Record Courses;
        BookingEntries: Record "Exam Booking Entries";
        PaperLevelValue: array [20,20] of Code[30];
        ExaminationCentertxt: Code[30];
        Sittingtxt: Code[30];
        CenterBookingEntries: Record "Center Booking Entries";
        ExaminationAccount: Record "Examination Account";
        ExaminationCentres: Record "Examination Centres";
        CenterName: Text;
        Examinationtxt: Text;
        Regnumb: Text;
        IntegerRegnumb: Integer;
        J: Integer;
        levelName1: Text;
        levelName2: Text;
        levelName3: Text;
}

