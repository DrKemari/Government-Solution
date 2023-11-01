#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85010 "Examination Results DataPort"
{
    Direction = Both;
    //Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Examination Results"; "Examination Results")
            {
                AutoUpdate = true;
                XmlName = 'ExaminationAccount';
                fieldelement(Student_Reg_No; "Examination Results"."Student Reg No.")
                {
                }
                fieldelement(Examination; "Examination Results".Examination)
                {
                }
                fieldelement(Part; "Examination Results".Part)
                {
                }
                fieldelement(Paper; "Examination Results".Paper)
                {
                }
                fieldelement(Grade; "Examination Results".Grade)
                {
                    FieldValidate = no;
                }
                fieldelement(ExaminationSittingId; "Examination Results"."Examination Sitting ID")
                {
                }
                fieldelement(FinancialYear; "Examination Results"."Financial Year")
                {
                    FieldValidate = no;
                }
                fieldelement(ExaminationCenter; "Examination Results"."Examination Center")
                {
                    FieldValidate = no;
                }
                fieldelement(SerialNo; "Examination Results"."Serial No")
                {
                }
                fieldelement(SubC; "Examination Results"."Sub C")
                {
                }
                fieldelement(FC; "Examination Results".Fc)
                {
                }
                fieldelement(IssueDate; "Examination Results"."Issue Date")
                {
                }
                fieldelement(Passed; "Examination Results".Passed)
                {
                }
                fieldelement(Marks; "Examination Results".Mark)
                {
                }



                trigger OnAfterInsertRecord()
                begin

                    BookingEntries.Reset;
                    BookingEntries.SetRange("Student Reg No.", "Examination Results"."Student Reg No.");
                    BookingEntries.SetRange(Paper, "Examination Results".Paper);
                    BookingEntries.SetRange("Exam Sitting", "Examination Results"."Examination Sitting ID");
                    BookingEntries.SetRange(Blocked, false);
                    BookingEntries.SetFilter(Status, '%1|%2|%3', BookingEntries.Status::Open, BookingEntries.Status::Passed, BookingEntries.Status::Failed);
                    if BookingEntries.FindFirst then begin
                        if "Examination Results".Passed = true then begin
                            BookingEntries.Status := BookingEntries.Status::Passed;
                            BookingEntries.Modify(true);
                        end else begin
                            BookingEntries.Status := BookingEntries.Status::Failed;
                            BookingEntries.Modify(true);
                        end;
                    end
                end;

                trigger OnBeforeInsertRecord()
                begin

                    IntCount := IntCount + 1;
                    fnClearResults("Examination Results"."Student Reg No.", "Examination Results"."Examination Sitting ID",
                                   "Examination Results".Examination, IntCount);


                    ExaminationAccount.Reset;
                    ExaminationAccount.SetRange("Registration No.", "Examination Results"."Student Reg No.");
                    if not ExaminationAccount.FindFirst then
                        currXMLport.Skip;




                    Result.Reset;
                    if Result.FindLast then
                        LineNo := Result."Line No.";

                    "Examination Results"."Line No." := LineNo + 1;
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

    trigger OnPostXmlPort()
    begin
        // COMMIT;
        // ExaminationResult.SETRANGE("Examination Sitting ID","Examination Results"."Examination Sitting ID");
        // REPORT.RUN(85095,TRUE,FALSE,ExaminationResult);
        Message('Results and Booking Entries Updated Successfully');
    end;

    trigger OnPreXmlPort()
    begin
        IntCount := 0;
    end;

    var
        HeaderNo: Code[30];
        CourseID: Code[30];
        HRDates: Codeunit "HR Dates";
        Customer: Record Customer;
        MarksheetLines: Record "Exam Marksheet Lines";
        MarksheetLines1: Record "Exam Marksheet Lines";
        SittingID: Code[30];
        ExaminationAccount: Record "Examination Account";
        BookingEntries: Record "Exam Booking Entries";
        ExaminationResult: Record "Examination Results";
        Result: Record "Examination Results";
        LineNo: Integer;
        IntCount: Integer;

    local procedure fnClearResults(StudentRegNo: Code[30]; ExamSittingCycle: Code[30]; Paper: Code[30]; IntCounter: Integer)
    var
        ExaminationResults: Record "Examination Results";
    begin
        if IntCount = 1 then begin
            ExaminationResults.Reset;
            ExaminationResults.SetRange("Student Reg No.", StudentRegNo);
            ExaminationResults.SetRange("Examination Sitting ID", ExamSittingCycle);
            ExaminationResults.SetRange(Examination, Paper);
            ExaminationResults.DeleteAll;
        end;
    end;
}

