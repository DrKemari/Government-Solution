#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85011 "Student Remarks DataPort"
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
            tableelement("Student Remarks";"Student Remarks")
            {
                AutoUpdate = true;
                XmlName = 'ExaminationAccount';
                fieldelement(EntryNo;"Student Remarks"."Entry No.")
                {
                }
                fieldelement(SourceDocument;"Student Remarks"."Source Document")
                {
                    FieldValidate = no;
                }
                fieldelement(Details;"Student Remarks".Details)
                {
                }
                fieldelement(RemarkCode;"Student Remarks"."Remark Code")
                {
                    FieldValidate = no;
                }
                fieldelement(RegNo;"Student Remarks"."Registration No.")
                {
                    FieldValidate = no;
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

