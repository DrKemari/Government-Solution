report 51155 "Feedback Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Feedback Report.rdlc';

    dataset
    {
        dataitem("Accreditation Comment";"Accreditation Comment Line")
        {
            column(logo;CompanyInfo.Picture)
            {
            }
            column(No_AccreditationCommentLine;"Accreditation Comment"."No.")
            {
            }
            column(DocumentLineNo_AccreditationCommentLine;"Accreditation Comment"."Document Line No.")
            {
            }
            column(Comment_AccreditationCommentLine;"Accreditation Comment".Comment)
            {
            }
            dataitem("Checks Lines";"Checks Lines")
            {
                DataItemLink = "Evaluation Header No."=FIELD("No."),Code=FIELD("Document Line No.");
                column(ComponentDescription_ProgrammeEvaluationLines;"Checks Lines"."Component Description")
                {
                }
                column(LineNo;"Checks Lines".Code)
                {
                }
                column(Comment;Comment)
                {
                }
                column(EvaluationHeaderNo_ProgrammeEvaluationLines;"Checks Lines"."Evaluation Header No.")
                {
                }
                column(Status_ChecksLines;"Checks Lines".Status)
                {
                }
                dataitem("Programme Evaluation Header";"Evaluation Header")
                {
                    DataItemLink = Code=FIELD("Evaluation Header No.");
                    column(ApplicationNo_ProgrammeEvaluationHeader;"Programme Evaluation Header"."Application No.")
                    {
                    }
                    column(Code_ProgrammeEvaluationHeader;"Programme Evaluation Header".Code)
                    {
                    }
                    column(ApplicationDescription;"Programme Evaluation Header"."Application Description")
                    {
                    }
                    column(InstitutionEmail_ProgrammeEvaluationHeader;"Programme Evaluation Header"."Institution Email")
                    {
                    }
                    column(Type_ProgrammeEvaluationHeader;"Programme Evaluation Header".Type)
                    {
                    }
                    column(DocumentStatus_ProgrammeEvaluationHeader;"Programme Evaluation Header"."Document Status")
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin
                recCount:=recCount+1;
                ProgramHeader.Reset;
                ProgramHeader.SetRange("Application No.","Accreditation Comment"."No.");
                if ProgramHeader.FindFirst then begin
                   Programme:=ProgramHeader."Insitution Code";
                  ApplicationNo:=ProgramHeader."Application No.";
                  Institution:=ProgramHeader."Application Description";
                  Verdict:=Format(ProgramHeader."Document Status");
                  Email:=ProgramHeader."Institution Email";
                end;
            end;
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

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        recCount: Integer;
        PercentageScore: Decimal;
        CompanyInfo: Record "Company Information";
        Programme: Text;
        Institution: Text;
        Verdict: Text;
        ApplicationNo: Code[30];
        Email: Text;
        Comment: Text;
        ProgramHeader: Record "Evaluation Header";
}

