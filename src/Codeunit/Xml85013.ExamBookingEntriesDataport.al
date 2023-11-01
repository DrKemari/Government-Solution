#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85013 "Exam Booking Entries Dataport"
{
    //xml
    Direction = Both;
    //Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Exam Booking Entries"; "Exam Booking Entries")
            {
                XmlName = 'ExamBooking';
                fieldelement(EntryNo; "Exam Booking Entries"."Entry No.")
                {
                }
                fieldelement(StudentRegNo; "Exam Booking Entries"."Student Reg No.")
                {
                }
                fieldelement(ExamId; "Exam Booking Entries".Examination)
                {
                }
                fieldelement(Part; "Exam Booking Entries".Part)
                {
                }
                fieldelement(Paper; "Exam Booking Entries".Paper)
                {
                }
                fieldelement(Status; "Exam Booking Entries".Status)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    ExaminationAccount.Reset;
                    ExaminationAccount.SetRange("Registration No.", "Exam Booking Entries"."Student Reg No.");
                    if not ExaminationAccount.FindSet then
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

