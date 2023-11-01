report 85400 "Setter Table of Specifications"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Setter Table of Specifications.rdlc';

    dataset
    {
        dataitem("Setter Header";"Setter Header")
        {
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_SetterHeader;"Setter Header"."Document No.")
            {
            }
            column(DocumentType_SetterHeader;"Setter Header"."Document Type")
            {
            }
            column(CreatedBy_SetterHeader;"Setter Header"."Created By")
            {
            }
            column(CreatedOn_SetterHeader;"Setter Header"."Created On")
            {
            }
            column(ExaminationSitting_SetterHeader;"Setter Header"."Examination Sitting")
            {
            }
            column(ExaminerCode_SetterHeader;"Setter Header"."Examiner Code")
            {
            }
            column(ExaminerName_SetterHeader;"Setter Header"."Examiner Name")
            {
            }
            column(IDNo_SetterHeader;"Setter Header"."ID No.")
            {
            }
            column(PhoneNo_SetterHeader;"Setter Header"."Phone No.")
            {
            }
            column(Email_SetterHeader;"Setter Header".Email)
            {
            }
            column(Address_SetterHeader;"Setter Header".Address)
            {
            }
            column(Submitted_SetterHeader;"Setter Header".Submitted)
            {
            }
            column(SubmittedOn_SetterHeader;"Setter Header"."Submitted On")
            {
            }
            column(SubmittedBy_SetterHeader;"Setter Header"."Submitted By")
            {
            }
            column(Declaration_SetterHeader;"Setter Header".Declaration)
            {
            }
            column(DeclarationDate_SetterHeader;"Setter Header"."Declaration Date")
            {
            }
            column(NoofPapers_SetterHeader;"Setter Header"."No. of Papers")
            {
            }
            column(NoofQuestions_SetterHeader;"Setter Header"."No. of Questions")
            {
            }
            column(BankCode_SetterHeader;"Setter Header"."Bank Code")
            {
            }
            column(BankBranch_SetterHeader;"Setter Header"."Bank Branch")
            {
            }
            column(BankName_SetterHeader;"Setter Header"."Bank Name")
            {
            }
            column(BankAccountNo_SetterHeader;"Setter Header"."Bank Account No.")
            {
            }
            column(AccountName_SetterHeader;"Setter Header"."Account Name")
            {
            }
            column(KRAPin_SetterHeader;"Setter Header"."KRA Pin")
            {
            }
            column(PaperCode_SetterHeader;"Setter Header"."Paper Code")
            {
            }
            column(PaperName_SetterHeader;"Setter Header"."Paper Name")
            {
            }
            column(Examination_SetterHeader;"Setter Header".Examination)
            {
            }
            column(Level_SetterHeader;"Setter Header".Level)
            {
            }
            column(NoofTopicsExamined_SetterHeader;"Setter Header"."No. of Topics Examined")
            {
            }
            column(NoofTopicsinSyllabus_SetterHeader;"Setter Header"."No. of Topics in Syllabus")
            {
            }
            column(ofSyllabusExamined_SetterHeader;"Setter Header"."% of Syllabus Examined")
            {
            }
            column(ApprovalStatus_SetterHeader;"Setter Header"."Approval Status")
            {
            }
            dataitem("Examination Review Lines";"Examination Review Lines")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
                column(ExaminationSitting_ExaminationReviewLines;"Examination Review Lines"."Examination Sitting")
                {
                }
                column(QuestionNo_ExaminationReviewLines;"Examination Review Lines"."Question No.")
                {
                }
                column(TopicCode_ExaminationReviewLines;"Examination Review Lines"."Topic Code")
                {
                }
                column(TopicName_ExaminationReviewLines;"Examination Review Lines"."Topic Name")
                {
                }
                column(References_ExaminationReviewLines;"Examination Review Lines".References)
                {
                }
                column(KnowledgeandComprehension_ExaminationReviewLines;"Examination Review Lines"."Knowledge and Comprehension")
                {
                }
                column(Totals;Total)
                {
                }
                column(ApplicationandAnalysis_ExaminationReviewLines;"Examination Review Lines"."Application and Analysis")
                {
                }
                column(SynthesisandEvaluation_ExaminationReviewLines;"Examination Review Lines"."Evaluation and Creativity")
                {
                }
                column(Comments_ExaminationReviewLines;"Examination Review Lines".Comments)
                {
                }
                column(SetterCode_ExaminationReviewLines;"Examination Review Lines"."Setter Code")
                {
                }
                column(SetterName_ExaminationReviewLines;"Examination Review Lines"."Setter Name")
                {
                }
                column(SetterTotalMarks_ExaminationReviewLines;"Examination Review Lines"."Setter Total Marks")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Total:="Examination Review Lines"."Application and Analysis"+"Examination Review Lines"."Knowledge and Comprehension"+"Examination Review Lines"."Evaluation and Creativity";
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

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        Total: Integer;
}

