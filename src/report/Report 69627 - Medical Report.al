report 69627 "Medical Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Medical Report.rdlc';

    dataset
    {
        dataitem("PreHire Medical Report";"PreHire Medical Report")
        {
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_PreHireMedicalReport;"PreHire Medical Report"."Document No.")
            {
            }
            column(BackgroundChecksInvNo_PreHireMedicalReport;"PreHire Medical Report"."Background Checks Inv No.")
            {
            }
            column(ApplicationNo_PreHireMedicalReport;"PreHire Medical Report"."Application No.")
            {
            }
            column(Description_PreHireMedicalReport;"PreHire Medical Report".Description)
            {
            }
            column(MedicalChecksTemplate_PreHireMedicalReport;"PreHire Medical Report"."Medical Checks Template")
            {
            }
            column(VacancyID_PreHireMedicalReport;"PreHire Medical Report"."Vacancy ID")
            {
            }
            column(LeadHROfficer_PreHireMedicalReport;"PreHire Medical Report"."Lead HR Officer")
            {
            }
            column(DocumentDate_PreHireMedicalReport;"PreHire Medical Report"."Document Date")
            {
            }
            column(CandidateNo_PreHireMedicalReport;"PreHire Medical Report"."Candidate No.")
            {
            }
            column(FirstName_PreHireMedicalReport;"PreHire Medical Report"."First Name")
            {
            }
            column(MiddleName_PreHireMedicalReport;"PreHire Medical Report"."Middle Name")
            {
            }
            column(LastName_PreHireMedicalReport;"PreHire Medical Report"."Last Name")
            {
            }
            column(DoctorName_PreHireMedicalReport;"PreHire Medical Report"."Doctor Name")
            {
            }
            column(Institution_PreHireMedicalReport;"PreHire Medical Report".Institution)
            {
            }
            column(OverallMedicalFitness_PreHireMedicalReport;"PreHire Medical Report"."Overall Medical Fitness")
            {
            }
            column(NoSeries_PreHireMedicalReport;"PreHire Medical Report"."No. Series")
            {
            }
            column(CreatedBy_PreHireMedicalReport;"PreHire Medical Report"."Created By")
            {
            }
            column(CreatedOn_PreHireMedicalReport;"PreHire Medical Report"."Created On")
            {
            }
            column(DocumentStatus_PreHireMedicalReport;"PreHire Medical Report"."Document Status")
            {
            }
            dataitem("Prehire Medical Report Lines";"Prehire Medical Report Lines")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
                column(DocumentNo_PrehireMedicalReportLines;"Prehire Medical Report Lines"."Document No.")
                {
                }
                column(LineNo_PrehireMedicalReportLines;"Prehire Medical Report Lines"."Line No.")
                {
                }
                column(MedicalHistoryType_PrehireMedicalReportLines;"Prehire Medical Report Lines"."Medical History Type")
                {
                }
                column(Code_PrehireMedicalReportLines;"Prehire Medical Report Lines".Code)
                {
                }
                column(Description_PrehireMedicalReportLines;"Prehire Medical Report Lines".Description)
                {
                }
                column(MedicalHistoryResponse_PrehireMedicalReportLines;"Prehire Medical Report Lines"."Medical History Response")
                {
                }
                column(MedicalExaminationResults_PrehireMedicalReportLines;"Prehire Medical Report Lines"."Medical Examination Results")
                {
                }
                column(AdditionalDetails_PrehireMedicalReportLines;"Prehire Medical Report Lines"."Additional Details")
                {
                }
                column(DateofLastVaccination_PrehireMedicalReportLines;"Prehire Medical Report Lines"."Date of Last Vaccination")
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

    labels
    {
    }

    var
        CI: Record "Company Information";
}

