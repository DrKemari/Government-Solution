#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85012 "Examination Results Remarks"
{
    Direction = Both;
    // Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Examination Results Remarks"; "Examination Results Remarks")
            {
                AutoUpdate = true;
                XmlName = 'ExaminationAccount';
                fieldelement(EntryNo; "Examination Results Remarks"."Line No.")
                {
                    FieldValidate = no;
                }
                fieldelement(Student_Reg_No; "Examination Results Remarks"."Student Reg No.")
                {
                }
                fieldelement(Examination; "Examination Results Remarks".Examination)
                {
                }
                fieldelement(Part; "Examination Results Remarks".Part)
                {
                }
                fieldelement(Paper; "Examination Results Remarks".Paper)
                {
                }
                fieldelement(ExamSittingId; "Examination Results Remarks"."Examination Sitting ID")
                {
                }
                fieldelement(Remarks; "Examination Results Remarks".Remark)
                {
                }
                fieldelement(Year; "Examination Results Remarks"."Exam Year")
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

