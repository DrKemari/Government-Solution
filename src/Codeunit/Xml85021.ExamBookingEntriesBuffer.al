#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85021 "Exam Booking Entries Buffer"
{
    Direction = Both;
 //   Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Exam Booking Entries-Buffer";"Exam Booking Entries-Buffer")
            {
                XmlName = 'ExamBooking';
                fieldelement(EntryNo;"Exam Booking Entries-Buffer"."Entry No.")
                {
                }
                fieldelement(StudentRegNo;"Exam Booking Entries-Buffer"."Student Reg No.")
                {
                    FieldValidate = no;
                }
                fieldelement(ExamId;"Exam Booking Entries-Buffer".Examination)
                {
                }
                fieldelement(Part;"Exam Booking Entries-Buffer".Part)
                {
                }
                fieldelement(Paper;"Exam Booking Entries-Buffer".Paper)
                {
                }
                fieldelement(Status;"Exam Booking Entries-Buffer".Status)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    ExaminationAccount.Reset;
                    ExaminationAccount.SetRange("Registration No.","Exam Booking Entries-Buffer"."Student Reg No.");
                    if not ExaminationAccount.FindFirst then
                       currXMLport.Skip;
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

    var
        HeaderNo: Code[30];
        CourseID: Code[30];
        HRDates: Codeunit "HR Dates";
        MarksheetLines: Record "Exam Marksheet Lines";
        MarksheetLines1: Record "Exam Marksheet Lines";
        SittingID: Code[30];
        ExaminationAccount: Record "Examination Account";
}

