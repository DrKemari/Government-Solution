#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85001 "Examination Worksheet Import"
{
    Direction = Import;
    //Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Examination Results"; "Examination Results")
            {
                XmlName = 'StudentMarks';
                fieldelement(CenterCode; "Examination Results"."Examination Center")
                {
                }
                fieldelement(StudentRegistration; "Examination Results"."Student Reg No.")
                {
                }
                fieldelement(PaperCode; "Examination Results".Paper)
                {
                }
                fieldelement(Marks; "Examination Results".Mark)
                {
                }

                trigger OnAfterInitRecord()
                begin
                    "Examination Results"."Document No." := HeaderNo;
                    "Examination Results"."Examination Sitting ID" := SittingID;
                    "Examination Results".Validate("Student Reg No.");
                    "Examination Results".Validate(Paper);
                    "Examination Results".Validate(Mark);
                end;

                trigger OnBeforeInsertRecord()
                begin
                    //create a student on student lines
                    MarksheetLines1.Reset;
                    MarksheetLines1.SetRange("Document No.", HeaderNo);
                    MarksheetLines1.SetRange("Student Reg No.", "Examination Results"."Student Reg No.");
                    if not MarksheetLines1.FindSet then begin
                        MarksheetLines."Document No." := HeaderNo;
                        MarksheetLines."Student Reg No." := "Examination Results"."Student Reg No.";
                        MarksheetLines."Examination Sitting ID" := SittingID;
                        MarksheetLines.Validate("Student Reg No.");
                        MarksheetLines."Examination Center" := "Examination Results"."Examination Center";
                        MarksheetLines.Insert;
                    end
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

    procedure GetVariables(MarksheetHeader: Record "Marksheet Header") MarksheetCode: Code[30]
    begin
        HeaderNo := MarksheetHeader."Document No.";
        SittingID := MarksheetHeader."Examination Sitting ID";
    end;
}

