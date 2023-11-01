#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85004 "StudentCourseLevelBuffer"
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
            tableelement("Student Course Level Buffer";"Student Course Level Buffer")
            {
                XmlName = 'StudentCourseLevelBuffer';
                fieldelement(StudentRegNo;"Student Course Level Buffer"."Student Reg No")
                {
                    FieldValidate = yes;
                }
                fieldelement(CourseId;"Student Course Level Buffer"."Couse Id")
                {
                }
                fieldelement(Level;"Student Course Level Buffer".Level)
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

