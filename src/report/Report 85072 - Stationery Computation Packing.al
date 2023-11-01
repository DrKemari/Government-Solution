report 85072 "Stationery Computation Packing"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Stationery Computation Packing.rdlc';

    dataset
    {
        dataitem("Exam Booking Entries";"Exam Booking Entries")
        {
            DataItemTableView = WHERE(Status=FILTER(Open),Paper=FILTER(<>' '));
            RequestFilterFields = "Exam Sitting","Exam Center";
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
            column(TotalEnvelopes;TotalEnvelopes)
            {
            }
            column(TotalWhiteBooklets;TotalWhiteBooklets)
            {
            }
            column(TotalBrownEnvelopes;TotalBrownEnvelopes)
            {
            }
            column(EnvelopeValue;ExaminationSetup."Envelope Value")
            {
            }
            column(BufferZone;ExaminationSetup."Buffer Zone %")
            {
            }
            column(KISEBCenter;KISEBCenter)
            {
            }
            column(NonBufferZone;ExaminationSetup."Non-Buffer Zone %")
            {
            }

            trigger OnAfterGetRecord()
            var
                ExaminationCode: Code[30];
                ExaminationSearched: array [50,100] of Code[30];
            begin
                 //add KISEB rows based on if center is kiseb

                 Courses.Reset;
                 Courses.SetRange(Code,"Exam Booking Entries".Examination);
                 if Courses.FindFirst then begin
                 end;
                  TotalNo:=0;

                 ExamBookingEntries.Reset;
                 ExamBookingEntries.SetRange("Exam Center","Exam Booking Entries"."Exam Center");
                 ExamBookingEntries.SetRange("Exam Sitting","Exam Booking Entries"."Exam Sitting");
                 ExamBookingEntries.SetRange(Paper,"Exam Booking Entries".Paper);
                 ExamBookingEntries.SetRange(Status,ExamBookingEntries.Status::Open);
                 if ExamBookingEntries.FindSet then begin
                    TotalNo:=ExamBookingEntries.Count;
                    Papers.Reset;
                    Papers.SetRange(Course,ExamBookingEntries.Examination);
                    if Papers.FindSet then begin
                      ExaminationCode:=ExamBookingEntries.Examination;
                          TotalEnvelopes:=0;
                          repeat
                              ExaminationSetup.Get;
                              ExaminationSetup.TestField("Envelope Value");
                             if TotalNo<ExaminationSetup."Envelope Value" then
                              TotalEnvelopes+=1
                             else
                            TotalEnvelopes:=TotalEnvelopes+Round(TotalNo/ExaminationSetup."Envelope Value",1,'>');
                         until Papers.Next=0;
                     end;


                 end;
                 //insert in temp table


                ComputationTable.Reset;
                ComputationTable.SetRange(Examination,ExamBookingEntries.Examination);
                if not ComputationTable.FindFirst then begin
                  ComputationTable1.Init;
                  ComputationTable1."Entry No.":=i+1;
                  ComputationTable1.Examination:="Exam Booking Entries".Examination;
                  ComputationTable1."Total Envelopes":=TotalEnvelopes;
                  ComputationTable1.Insert(true);
                    i+=1;
                end;





                 //get total number not per paper
                  TotalNo1:=0;
                 ExamBookingEntries1.Reset;
                 ExamBookingEntries1.SetRange("Exam Center","Exam Booking Entries"."Exam Center");
                 ExamBookingEntries1.SetRange("Exam Sitting","Exam Booking Entries"."Exam Sitting");
                 ExamBookingEntries1.SetRange(Status,ExamBookingEntries1.Status::Open);
                 if ExamBookingEntries1.FindSet then begin
                    TotalNo1:=ExamBookingEntries1.Count;
                 end;

                 //get envelopes global
                 TotalEnvelopes1:=0;
                  if TotalNo1<ExaminationSetup."Envelope Value" then
                  TotalEnvelopes1:=1
                 else
                 TotalEnvelopes1:=Round(TotalNo1/ExaminationSetup."Envelope Value",1,'>');


                 //get the white booklets and envelopes
                 ExaminationCentres.Reset;
                 ExaminationCentres.SetRange(Code,"Exam Booking Entries"."Exam Center");
                 if ExaminationCentres.FindFirst then begin
                   KISEBCenter:=ExaminationCentres."KISEB Centers";
                  if ExaminationCentres."Exam Buffer Zone"=true then begin
                    ExaminationSetup.TestField("Buffer Zone %");

                    TotalWhiteBooklets:=TotalNo1+Round((ExaminationSetup."Buffer Zone %"*TotalNo1)/100,1,'>');
                    TotalBrownEnvelopes:=TotalEnvelopes1+Round((ExaminationSetup."Buffer Zone %"*TotalEnvelopes1)/100,1,'>');

                  end else
                  if ExaminationCentres."Neutral Buffer Zone"=true then  begin
                    ExaminationSetup.TestField("Non-Buffer Zone %");
                    TotalWhiteBooklets:=Round(TotalNo1,1,'>');
                    TotalBrownEnvelopes:=Round(TotalEnvelopes1,1,'>');

                  end else
                  begin
                    ExaminationSetup.TestField("Non-Buffer Zone %");
                    TotalWhiteBooklets:=TotalNo1+Round((ExaminationSetup."Non-Buffer Zone %"*TotalNo1)/100,1,'>');
                    TotalBrownEnvelopes:=TotalEnvelopes1+Round((ExaminationSetup."Non-Buffer Zone %"*TotalEnvelopes1)/100,1,'>');

                  end

                 end;
                 //any center starting  with 1 and 9 nmark it as neutral
            end;

            trigger OnPreDataItem()
            begin
                ComputationTable.Reset;
                ComputationTable.DeleteAll;

                i:=1;
            end;
        }
        dataitem("Packing Computation Table";"Packing Computation Table")
        {
            column(GlobalEnvelopes;"Packing Computation Table"."Total Envelopes")
            {
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
        ExaminationSetup.Get;
         GlobalEnvelopes:=0;
    end;

    var
        CI: Record "Company Information";
        Courses: Record Courses;
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalNo: Integer;
        ExaminationSetup: Record "Examination Setup";
        TotalEnvelopes: Integer;
        TotalWhiteBooklets: Integer;
        TotalBrownEnvelopes: Integer;
        ExaminationCentres: Record "Examination Centres";
        ExamBookingEntries1: Record "Exam Booking Entries";
        TotalNo1: Integer;
        TotalEnvelopes1: Integer;
        Papers: Record Papers;
        GlobalEnvelopes: Integer;
        GlobalEnvelopes1: Integer;
        ExamCode: Code[30];
        ComputationTable: Record "Packing Computation Table";
        ComputationTable1: Record "Packing Computation Table";
        ComputationTable2: Record "Packing Computation Table";
        i: Integer;
        KISEBCenter: Boolean;

    local procedure GetTotalEnvelopes(ExamBookingEntries: Record "Exam Booking Entries";TotalBookings: Integer) EnvelopValue: Integer
    var
        Subject: Record Papers;
        EnvelopNo: Integer;
        EnvelopNo2: Integer;
        SubjectCode: Code[50];
    begin
           if SubjectCode<>ExamBookingEntries.Examination then begin
            Subject.Reset;
            Subject.SetRange(Course,ExamBookingEntries.Examination);
            if Subject.FindSet then begin
                 EnvelopNo:=0;
                SubjectCode:=Subject.Code;
                  repeat

                      ExaminationSetup.Get;
                      ExaminationSetup.TestField("Envelope Value");
                     if TotalBookings<ExaminationSetup."Envelope Value" then
                      EnvelopNo+=1
                     else
                    EnvelopNo:=EnvelopNo+Round(TotalBookings/ExaminationSetup."Envelope Value",1,'>');
                 until Subject.Next=0;

             end;
             end;

         exit(EnvelopNo);
    end;
}

