report 85016 "Result Slip"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Result Slip.rdlc';

    dataset
    {
        dataitem("Examination Results"; "Examination Results")
        {
            RequestFilterFields = "Examination Sitting ID";

            column(Logo; CI.Picture)
            {
            }
            column(Address1; CI.Address)
            {
            }
            column(Address2; CI."Address 2")
            {
            }
            column(City; CI.City)
            {
            }
            column(PostCode; CI."Post Code")
            {
            }
            column(Country; CI."Country/Region Code")
            {
            }
            column(Tel; CI."Phone No.")
            {
            }
            column(Tel32; CI."Phone No. 2")
            {
            }
            column(Email; CI."E-Mail")
            {
            }
            column(Website; CI."Home Page")
            {
            }
            column(Fax; CI."Fax No.")
            {
            }
            column("CurrentHeadName"; CI."Current Head Name")
            {
            }
            column(TXT001; TXT001)
            {
            }
            column(ReferenceNo; ReferenceNo)
            {
            }
            column(LevelName; LevelName)
            {
            }
            column(BarcodeNo; BarcodeNo)
            {
            }
            column(Barcode; ExaminationSetup.Picture)
            {
            }
            column(LineNo_ExaminationResults; "Examination Results"."Line No.")
            {
            }
            column(StudentRegNo_ExaminationResults; "Examination Results"."Student Reg No.")
            {
            }
            column(Examination_ExaminationResults; "Examination Results".Examination)
            {
            }
            column(Part_ExaminationResults; "Examination Results".Part)
            {
            }
            column(Section_ExaminationResults; "Examination Results".Section)
            {
            }
            column(Paper_ExaminationResults; "Examination Results".Paper)
            {
            }
            column(PaperName_ExaminationResults; "Examination Results"."Paper Name")
            {
            }
            column(Type_ExaminationResults; "Examination Results".Type)
            {
            }
            column(Mark_ExaminationResults; Mark)
            {
            }
            column(StudentName_ExaminationResults; "Examination Results"."Student Name")
            {
            }
            column(Address_ExaminationResults; "Examination Results".Address)
            {
            }
            column(Email_ExaminationResults; "Examination Results".Email)
            {
            }
            column(NationalIDNo_ExaminationResults; "Examination Results"."National ID No.")
            {
            }
            column(PassportNo_ExaminationResults; "Examination Results"."Passport No.")
            {
            }
            column(Grade_ExaminationResults; "Examination Results".Grade)
            {
            }
            column(SectionGrade_ExaminationResults; "Examination Results"."Section Grade")
            {
            }
            column(SectionDescription_ExaminationResults; "Examination Results"."Section Description")
            {
            }
            column(ExaminationSittingID_ExaminationResults; "Examination Results"."Examination Sitting ID")
            {
            }
            column(FinancialYear_ExaminationResults; "Examination Results"."Financial Year")
            {
            }
            column(CenterName; CenterName)
            {
            }
            column(DateIssued; DateIssued)
            {
            }
            column(Remark; Remarktxt)
            {
            }
            dataitem("Examination Results Remarks"; "Examination Results Remarks")
            {
                column(LineNo_ExaminationResultsRemarks; "Examination Results Remarks"."Line No.")
                {
                }
                column(StudentRegNo_ExaminationResultsRemarks; "Examination Results Remarks"."Student Reg No.")
                {
                }
                column(Examination_ExaminationResultsRemarks; "Examination Results Remarks".Examination)
                {
                }
                column(Part_ExaminationResultsRemarks; "Examination Results Remarks".Part)
                {
                }
                column(Section_ExaminationResultsRemarks; "Examination Results Remarks".Section)
                {
                }
                column(Paper_ExaminationResultsRemarks; "Examination Results Remarks".Paper)
                {
                }
                column(ExaminationSittingID_ExaminationResultsRemarks; "Examination Results Remarks"."Examination Sitting ID")
                {
                }
                column(Remark_ExaminationResultsRemarks; "Examination Results Remarks".Remark)
                {
                }
                column(ExamYear_ExaminationResultsRemarks; "Examination Results Remarks"."Exam Year")
                {
                }
            }

            trigger OnAfterGetRecord()
            var
                TT001: Label 'Kindly select the sitting to view the results';
            begin
                TXT001 := '============  END OF RESULT DETAILS ============';
                //IF "Examination Results"."Examination Sitting ID"='' THEN
                //ERROR(TT001);
                // Centres.RESET;
                // Centres.SETRANGE(Code,"Examination Results"."Examination Center");
                // IF Centres.FINDFIRST THEN BEGIN
                //  CenterName:=Centres.Name;
                //  END;
                CenterName := "Examination Results"."Examination Center";
                DateIssued := Format("Examination Results"."Issue Date", 0, '<Day, 2> / <Month, 2>/ <Year4>');
                //get the level'
                Papers.Reset;
                Papers.SetRange(Code, "Examination Results".Paper);
                if Papers.FindFirst then begin
                    Level.Reset;
                    Level.SetRange(Code, Papers.Level);
                    if Level.FindFirst then begin
                        LevelName := Level.Description;
                        //get the reference No
                        Courses.Reset;
                        Courses.SetRange(Code, "Examination Results".Examination);
                        if Courses.FindFirst then begin
                            //get the sitting
                            Cycle.Reset;
                            Cycle.SetRange("Exam Sitting Cycle", "Examination Results"."Examination Sitting ID");
                            if Cycle.FindFirst then begin
                                ReferenceNo := Courses."Result Reference" + Format(Level.Level)
                                 + Format(Cycle."Sitting Sequence") + "Examination Results"."Financial Year" + '/' + "Examination Results"."Serial No";
                            end;
                        end;
                        BarcodeNo := ReferenceNo + ' ' + "Examination Results"."Student Reg No.";//remove the / on the reg no

                    end;

                end;

                //get the signatory

                // Remarktxt:='';
                // ResultsRemarks.RESET;
                // ResultsRemarks.SETRANGE("Student Reg No.","Examination Results"."Student Reg No.");
                // ResultsRemarks.SETRANGE(Part,"Examination Results".Part);
                // IF ResultsRemarks.FINDSET THEN  BEGIN
                //  REPEAT
                //    MESSAGE('%1',Remarktxt);
                //
                //    Remarktxt:=ResultsRemarks.Remark;
                //  UNTIL ResultsRemarks.NEXT=0
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
        ExaminationSetup.Get;
        ExaminationSetup.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        MarksheetLines: Record "Exam Marksheet Lines";
        CenterName: Text;
        DateIssued: Text;
        TXT001: Text;
        ExaminationSetup: Record "Examination Setup";
        ReferenceNo: Code[50];
        BarcodeNo: Code[50];
        ResultsRemarks: Record "Examination Results Remarks";
        Remarktxt: Text;
        Papers: Record Papers;
        LevelName: Text;
        Level: Record Level;
        Centres: Record "Examination Centres";
        Courses: Record Courses;
        Cycle: Record "Exam Sitting Cycle";
}

