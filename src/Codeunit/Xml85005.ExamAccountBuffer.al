#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85005 "Exam Account Buffer"
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
            tableelement("Subjects Passed";"Subjects Passed")
            {
                XmlName = 'StudentData';
                fieldelement(EntryNo;"Subjects Passed"."Entry No.")
                {
                }
                fieldelement(RegNo;"Subjects Passed"."Student Reg No.")
                {
                }
                fieldelement(Paper;"Subjects Passed".Paper)
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
        MarksheetLines: Record "Exam Marksheet Lines";
        MarksheetLines1: Record "Exam Marksheet Lines";
        SittingID: Code[30];
}

