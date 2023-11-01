#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85008 "Examination Accounts export"
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
            tableelement("Examination Account"; "Examination Account")
            {
                AutoUpdate = true;
                XmlName = 'ExaminationAccount';
                SourceTableView = where("Course ID" = const('ATD'));
                fieldelement(CourseRegNo; "Examination Account"."Registration No.")
                {
                    FieldValidate = yes;
                }
                fieldelement(StudentRegNo; "Examination Account"."Student Cust No.")
                {
                    FieldValidate = yes;
                }
                fieldelement(CourseId; "Examination Account"."Course ID")
                {
                    FieldValidate = yes;
                }
                fieldelement(Status; "Examination Account".Status)
                {
                }
                fieldelement(RegDate; "Examination Account"."Registration Date")
                {
                }
                fieldelement(StatusRemarks; "Examination Account"."Status Remarks")
                {
                }
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
}

