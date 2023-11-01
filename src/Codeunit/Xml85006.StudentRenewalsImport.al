#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85006 "Student Renewals Import"
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
            tableelement("Student Renewal Entries";"Student Renewal Entries")
            {
                XmlName = 'StudentData';
                fieldelement(EntryNo;"Student Renewal Entries"."Entry No.")
                {
                }
                fieldelement(CourseId;"Student Renewal Entries"."Course Id")
                {
                }
                fieldelement(RegDate;"Student Renewal Entries"."Renewal Date")
                {
                }
                fieldelement(Year;"Student Renewal Entries".Year)
                {
                }
                fieldelement(RegNo;"Student Renewal Entries"."Stud. Reg. No")
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    ExaminationAccount.Reset;
                    ExaminationAccount.SetRange("Registration No.","Student Renewal Entries"."Stud. Reg. No");
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

