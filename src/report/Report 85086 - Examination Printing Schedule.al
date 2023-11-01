report 85086 "Examination Printing Schedule"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Examination Printing Schedule.rdlc';

    dataset
    {
        dataitem(Courses;Courses)
        {
            RequestFilterFields = Type,"Code";
            column(Sitting;Sitting)
            {
            }
            column(Code_Courses;Courses.Code)
            {
            }
            column(DomainID_Courses;Courses."Domain ID")
            {
            }
            column(Description_Courses;Courses.Description)
            {
            }
            column(NoofLevels_Courses;Courses."No. of Levels")
            {
            }
            column(NoofSections_Courses;Courses."No. of Sections")
            {
            }
            column(NoofPapers_Courses;Courses."No. of Papers")
            {
            }
            column(NoofExamBookings_Courses;Courses."No. of Exam Bookings")
            {
            }
            column(NoofPassed_Courses;Courses."No. of Passed")
            {
            }
            column(NoSeries_Courses;Courses."No. Series")
            {
            }
            column(Type_Courses;Courses.Type)
            {
            }
            column(CertificateNos_Courses;Courses."Certificate Nos.")
            {
            }
            column(ExemptionReferenceNos_Courses;Courses."Exemption Reference Nos.")
            {
            }
            column(TransferCourse_Courses;Courses."Transfer Course")
            {
            }
            column(PaperColor_Courses;Courses."Paper Color")
            {
            }
            dataitem(LevelName;Level)
            {
                DataItemLink = Course=FIELD(Code);
                column(Code_Level;LevelName.Code)
                {
                }
                column(Course_Level;LevelName.Course)
                {
                }
                column(LevelInt;LevelName.Level)
                {
                }
                column(Description_Level;LevelName.Description)
                {
                }
                dataitem("Integer";"Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(PaperLevel_Value;PaperLevelValue[Number,1])
                    {
                    }
                    column(Paper_Value;PaperValue[Number,1])
                    {
                    }
                    column(Paper_Value_Name;PaperValueName[Number,1])
                    {
                    }
                    column(TotalStudents;TotalStudents[Number,1])
                    {
                    }
                    column(PrintingFactor;ExaminationSetup."Printing No. Factor")
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        Integer.SetRange(Number,1,No-1);
                        Integer.SetRange(Number,1,No1-1);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                                 No1:=1;
                                  Papers1.Reset;
                                  Papers1.SetRange(Course,LevelName.Course);
                                  Papers1.SetRange(Level,LevelName.Code);
                                  if Papers1.FindSet then begin
                                  repeat
                                    PaperValue[No1,1]:=Papers1.Code;
                                    PaperValueName[No1,1]:=Papers1.Description;
                                    ExamBookingEntries.Reset;
                                    ExamBookingEntries.SetRange(Paper,Papers1.Code);
                                    ExamBookingEntries.SetRange("Exam Sitting",Sitting);
                                    ExamBookingEntries.SetFilter(Status,'%1|%2|%3',ExamBookingEntries.Status::Open,ExamBookingEntries.Status::Failed,ExamBookingEntries.Status::Passed);
                                    if ExamBookingEntries.FindSet then begin
                                      TotalStudents[No1,1]:=ExamBookingEntries.Count;
                                    end;

                                    No1+=1;
                                  until  Papers1.Next=0;

                                end;
                end;
            }

            trigger OnAfterGetRecord()
            var
                TXT001: Label 'Select the examination Sitting';
            begin
                ExaminationSetup.Get;
                ExaminationSetup.TestField("Printing No. Factor");
                if Sitting='' then
                    Error(TXT001);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("EXAMINATION SITTING";Sitting)
                {
                    ShowMandatory = true;
                    TableRelation = "Exam Sitting Cycle";
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

    var
        PaperLevel: Code[30];
        PaperCode: Code[30];
        PaperValue: array [100,100] of Code[30];
        PaperValueName: array [1000,100] of Text;
        PaperLevelValue: array [200,100] of Code[30];
        No: Integer;
        Papers1: Record Papers;
        Levels: Record Level;
        No1: Integer;
        Numb: Integer;
        TotalStudents: array [100,100] of Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Sitting: Code[30];
        ExaminationSetup: Record "Examination Setup";
}

