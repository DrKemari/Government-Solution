report 85401 "Setter Disclosure Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Setter Disclosure Form.rdlc';

    dataset
    {
        dataitem("Setter Header"; "Setter Header")
        {
            column(Logo; CI.Picture)
            {
            }
            column(DocumentNo_SetterHeader; "Setter Header"."Document No.")
            {
            }
            column(Signature; Resource.Signature)
            {
            }
            column(DocumentType_SetterHeader; "Setter Header"."Document Type")
            {
            }
            column(CreatedBy_SetterHeader; "Setter Header"."Created By")
            {
            }
            column(CreatedOn_SetterHeader; "Setter Header"."Created On")
            {
            }
            column(ExaminationSitting_SetterHeader; "Setter Header"."Examination Sitting")
            {
            }
            column(ExaminerCode_SetterHeader; "Setter Header"."Examiner Code")
            {
            }
            column(ExaminerName_SetterHeader; "Setter Header"."Examiner Name")
            {
            }
            column(IDNo_SetterHeader; "Setter Header"."ID No.")
            {
            }
            column(PhoneNo_SetterHeader; "Setter Header"."Phone No.")
            {
            }
            column(Email_SetterHeader; "Setter Header".Email)
            {
            }
            column(Address_SetterHeader; "Setter Header".Address)
            {
            }
            column(Submitted_SetterHeader; "Setter Header".Submitted)
            {
            }
            column(SubmittedOn_SetterHeader; "Setter Header"."Submitted On")
            {
            }
            column(SubmittedBy_SetterHeader; "Setter Header"."Submitted By")
            {
            }
            column(Declaration_SetterHeader; "Setter Header".Declaration)
            {
            }
            column(DeclarationDate_SetterHeader; "Setter Header"."Declaration Date")
            {
            }
            column(NoofPapers_SetterHeader; "Setter Header"."No. of Papers")
            {
            }
            column(NoofQuestions_SetterHeader; "Setter Header"."No. of Questions")
            {
            }
            column(BankCode_SetterHeader; "Setter Header"."Bank Code")
            {
            }
            column(BankBranch_SetterHeader; "Setter Header"."Bank Branch")
            {
            }
            column(BankName_SetterHeader; "Setter Header"."Bank Name")
            {
            }
            column(BankAccountNo_SetterHeader; "Setter Header"."Bank Account No.")
            {
            }
            column(AccountName_SetterHeader; "Setter Header"."Account Name")
            {
            }
            column(KRAPin_SetterHeader; "Setter Header"."KRA Pin")
            {
            }
            column(ApprovalStatus_SetterHeader; "Setter Header"."Approval Status")
            {
            }
            dataitem("Disclosure Papers"; "Disclosure Papers")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(Examination_DisclosurePapers; "Disclosure Papers".Examination)
                {
                }
                column(ExaminationName_DisclosurePapers; "Disclosure Papers"."Examination Name")
                {
                }
                column(Level_DisclosurePapers; "Disclosure Papers".Level)
                {
                }
                column(PaperCode_DisclosurePapers; "Disclosure Papers"."Paper Code")
                {
                }
                column(PaperName_DisclosurePapers; "Disclosure Papers"."Paper Name")
                {
                }
            }
            dataitem("Disclosure Training Inst"; "Disclosure Training Inst")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(InstitutionCode_DisclosureTrainingInst; "Disclosure Training Inst"."Institution Code")
                {
                }
                column(InstitutionName_DisclosureTrainingInst; "Disclosure Training Inst"."Institution Name")
                {
                }
                column(DateCommencedTraining_DisclosureTrainingInst; "Disclosure Training Inst"."Date Commenced Training")
                {
                }
            }
            dataitem("Disclosure Relative"; "Disclosure Relative")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(InterestType_DisclosureRelative; "Disclosure Relative"."Interest Type")
                {
                }
                column(InstitutionCode_DisclosureRelative; "Disclosure Relative"."Institution Code")
                {
                }
                column(InstitutionName_DisclosureRelative; "Disclosure Relative"."Institution Name")
                {
                }
                column(NameofRelative_DisclosureRelative; "Disclosure Relative"."Name of Relative")
                {
                }
                column(Relationship_DisclosureRelative; "Disclosure Relative".Relationship)
                {
                }
                column(Course_DisclosureRelative; "Disclosure Relative".Course)
                {
                }
                column(Level_DisclosureRelative; "Disclosure Relative".Level)
                {
                }
                column(NatureofInterest_DisclosureRelative; "Disclosure Relative"."Nature of Interest")
                {
                }
            }
            dataitem("Disclosure Paper Submitted"; "Disclosure Paper Submitted")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(Examination_DisclosurePaperSubmitted; "Disclosure Paper Submitted".Examination)
                {
                }
                column(ExaminationName_DisclosurePaperSubmitted; "Disclosure Paper Submitted"."Examination Name")
                {
                }
                column(Level_DisclosurePaperSubmitted; "Disclosure Paper Submitted".Level)
                {
                }
                column(PaperCode_DisclosurePaperSubmitted; "Disclosure Paper Submitted"."Paper Code")
                {
                }
                column(PaperName_DisclosurePaperSubmitted; "Disclosure Paper Submitted"."Paper Name")
                {
                }
                column(QuestionNo_DisclosurePaperSubmitted; "Disclosure Paper Submitted"."Question No.")
                {
                }
                column(TopicCode_DisclosurePaperSubmitted; "Disclosure Paper Submitted"."Topic Code")
                {
                }
                column(TopicName_DisclosurePaperSubmitted; "Disclosure Paper Submitted"."Topic Name")
                {
                }
                column(QuestionPaper_DisclosurePaperSubmitted; Format("Disclosure Paper Submitted"."Question Paper"))
                {
                }
                column(SuggestedSolution_DisclosurePaperSubmitted; Format("Disclosure Paper Submitted"."Suggested Solution"))
                {
                }
                column(CompletenessStatus_DisclosurePaperSubmitted; "Disclosure Paper Submitted"."Completeness Status")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                if Resource.Get("Setter Header"."Examiner Code") then begin

                    Resource.CalcFields(Signature);

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
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        Resource: Record Resource;
}

