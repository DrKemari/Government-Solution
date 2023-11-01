report 85403 "Moderator Specification Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Moderator Specification Form.rdlc';

    dataset
    {
        dataitem("Examination Review Voucher";"Examination Review Voucher")
        {
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_ExaminationReviewVoucher;"Examination Review Voucher"."Document No.")
            {
            }
            column(DocumentType_ExaminationReviewVoucher;"Examination Review Voucher"."Document Type")
            {
            }
            column(CreatedBy_ExaminationReviewVoucher;"Examination Review Voucher"."Created By")
            {
            }
            column(CreatedOn_ExaminationReviewVoucher;"Examination Review Voucher"."Created On")
            {
            }
            column(ExaminationSitting_ExaminationReviewVoucher;"Examination Review Voucher"."Examination Sitting")
            {
            }
            column(ExaminerCode_ExaminationReviewVoucher;"Examination Review Voucher"."Examiner Code")
            {
            }
            column(ExaminerName_ExaminationReviewVoucher;"Examination Review Voucher"."Examiner Name")
            {
            }
            column(IDNo_ExaminationReviewVoucher;"Examination Review Voucher"."ID No.")
            {
            }
            column(PhoneNo_ExaminationReviewVoucher;"Examination Review Voucher"."Phone No.")
            {
            }
            column(Email_ExaminationReviewVoucher;"Examination Review Voucher".Email)
            {
            }
            column(Address_ExaminationReviewVoucher;"Examination Review Voucher".Address)
            {
            }
            column(Submitted_ExaminationReviewVoucher;"Examination Review Voucher".Submitted)
            {
            }
            column(SubmittedOn_ExaminationReviewVoucher;"Examination Review Voucher"."Submitted On")
            {
            }
            column(SubmittedBy_ExaminationReviewVoucher;"Examination Review Voucher"."Submitted By")
            {
            }
            column(ModeratorNo_ExaminationReviewVoucher;"Examination Review Voucher"."Moderator No.")
            {
            }
            column(ModeratorName_ExaminationReviewVoucher;"Examination Review Voucher"."Moderator Name")
            {
            }
            column(NoofTopicsExamined_ExaminationReviewVoucher;"Examination Review Voucher"."No. of Topics Examined")
            {
            }
            column(NoofTopicsinSyllabus_ExaminationReviewVoucher;"Examination Review Voucher"."No. of Topics in Syllabus")
            {
            }
            column(ofSyllabusExamined_ExaminationReviewVoucher;"Examination Review Voucher"."% of Syllabus Examined")
            {
            }
            column(PaperCode_ExaminationReviewVoucher;"Examination Review Voucher"."Paper Code")
            {
            }
            column(PaperName_ExaminationReviewVoucher;"Examination Review Voucher"."Paper Name")
            {
            }
            column(ApprovalStatus_ExaminationReviewVoucher;"Examination Review Voucher"."Approval Status")
            {
            }
            column(ActionTaken_ExaminationReviewVoucher;"Examination Review Voucher"."Action Taken")
            {
            }
            column(Examination_ExaminationReviewVoucher;"Examination Review Voucher".Examination)
            {
            }
            column(Level_ExaminationReviewVoucher;"Examination Review Voucher".Level)
            {
            }
            dataitem("Examination Review Lines";"Examination Review Lines")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
                column(DocumentNo_ExaminationReviewLines;"Examination Review Lines"."Document No.")
                {
                }
                column(Totals;Totals)
                {
                }
                column(LineNo_ExaminationReviewLines;"Examination Review Lines"."Line No.")
                {
                }
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
                column(ApplicationandAnalysis_ExaminationReviewLines;"Examination Review Lines"."Application and Analysis")
                {
                }
                column(SynthesisandEvaluation_ExaminationReviewLines;"Examination Review Lines"."Evaluation and Creativity")
                {
                }
                column(Comments_ExaminationReviewLines;"Examination Review Lines".Comments)
                {
                }
                dataitem("Setter Marks Per Question";"Setter Marks Per Question")
                {
                    DataItemLink = "Document No."=FIELD("Document No."),"Line No."=FIELD("Line No.");
                    column(DocumentNo_SetterMarksPerQuestion;"Setter Marks Per Question"."Document No.")
                    {
                    }
                    column(LineNo_SetterMarksPerQuestion;"Setter Marks Per Question"."Line No.")
                    {
                    }
                    column(EntryNo_SetterMarksPerQuestion;"Setter Marks Per Question"."Entry No.")
                    {
                    }
                    column(QuestionNo_SetterMarksPerQuestion;"Setter Marks Per Question"."Question No.")
                    {
                    }
                    column(SetterCode_ExaminationReviewLines;"Setter Marks Per Question"."Setter Code")
                    {
                    }
                    column(SetterName_ExaminationReviewLines;"Setter Marks Per Question"."Setter Name")
                    {
                    }
                    column(SetterTotalMarks_ExaminationReviewLines;"Setter Marks Per Question"."Marks Awarded")
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    Totals:="Examination Review Lines"."Application and Analysis"+"Examination Review Lines"."Knowledge and Comprehension"+"Examination Review Lines"."Evaluation and Creativity";
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
        Totals: Integer;
}

