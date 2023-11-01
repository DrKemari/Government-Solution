#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85009 "Exmptions Accounts Export"
{
    Direction = Both;
    //  Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Exemption Entries"; "Exemption Entries")
            {
                AutoUpdate = true;
                XmlName = 'ExaminationAccount';
                fieldelement(Entry_No; "Exemption Entries"."Entry No.")
                {
                    FieldValidate = yes;
                }
                fieldelement(CourseId; "Exemption Entries"."Course Id")
                {
                    FieldValidate = yes;
                }
                fieldelement(Type; "Exemption Entries".Type)
                {
                }
                fieldelement("No."; "Exemption Entries"."No.")
                {
                }
                fieldelement(StudRegNo; "Exemption Entries"."Stud. Reg. No")
                {
                }
                fieldelement(flag; "Exemption Entries".Flag)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    ExaminationAccount.Reset;
                    ExaminationAccount.SetRange("Registration No.", "Exemption Entries"."Stud. Reg. No");
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
        Customer: Record Customer;
        MarksheetLines: Record "Exam Marksheet Lines";
        MarksheetLines1: Record "Exam Marksheet Lines";
        SittingID: Code[30];
        ExaminationAccount: Record "Examination Account";
}

