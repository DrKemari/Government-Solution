#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85020 "Examination History Dataport"
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
            tableelement("Examination History"; "Examination History")
            {
                AutoUpdate = true;
                XmlName = 'ExaminationAccount';
                fieldelement(LineNum; "Examination History"."Line No.")
                {
                    FieldValidate = yes;
                }
                fieldelement(StudentReg; "Examination History"."Student Reg No.")
                {
                    FieldValidate = no;
                }
                fieldelement(Examination; "Examination History".Examination)
                {
                }
                fieldelement(Part; "Examination History".Part)
                {
                }
                fieldelement(Section; "Examination History".Section)
                {
                }
                fieldelement(Type; "Examination History".Type)
                {
                }
                fieldelement(FinYear; "Examination History"."Financial Year")
                {
                }
                fieldelement(Exsit; "Examination History".exsit)
                {
                }
                fieldelement(Ctr; "Examination History".ctr)
                {
                }
                fieldelement(SectionGrade; "Examination History".Grade)
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

