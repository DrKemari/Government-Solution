#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85019 "Import Journal"
{
    Direction = Both;
    Encoding = UTF8;
    Format = xml;
    FormatEvaluate = Legacy;
    //TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Gen. Journal Line"; "Gen. Journal Line")
            {
                XmlName = 'Journal';
                fieldelement(LineNo; "Gen. Journal Line"."Line No.")
                {
                }
                fieldelement(JournalTemp; "Gen. Journal Line"."Journal Template Name")
                {
                    FieldValidate = yes;
                }
                fieldelement(JournalBatch; "Gen. Journal Line"."Journal Batch Name")
                {
                }
                fieldelement(DocumentNo; "Gen. Journal Line"."Document No.")
                {
                }
                fieldelement(PostingDate; "Gen. Journal Line"."Posting Date")
                {
                }
                fieldelement(AccountType; "Gen. Journal Line"."Account Type")
                {
                    FieldValidate = no;
                }
                fieldelement(AccountNo; "Gen. Journal Line"."Account No.")
                {
                }
                fieldelement(Description; "Gen. Journal Line".Description)
                {
                }
                fieldelement(Amount; "Gen. Journal Line".Amount)
                {
                }
                fieldelement(BalAcType; "Gen. Journal Line"."Bal. Account Type")
                {
                }
                fieldelement(BalAcNo; "Gen. Journal Line"."Bal. Account No.")
                {
                }
                fieldelement(ExternalNo; "Gen. Journal Line"."External Document No.")
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

