report 85008 "Detailed Examination Planner"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Detailed Examination Planner.rdlc';

    dataset
    {
        dataitem("Exam Material Planner Header";"Exam Material Planner Header")
        {
            column(CI_Picture;CI.Picture)
            {
            }
            column(CI_Address;CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
            {
            }
            column(CI_City;CI.City)
            {
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
            }
            column(COMPANYNAME;CompanyName)
            {
            }
            column(Code_ExamMaterialPlannerHeader;"Exam Material Planner Header".Code)
            {
            }
            column(Examination_ExamMaterialPlannerHeader;"Exam Material Planner Header".Examination)
            {
            }
            column(ExaminationSittingID_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Examination Sitting ID")
            {
            }
            column(EaminationCenterCode_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Eamination Center Code")
            {
            }
            column(ExaminationCenter_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Examination Center")
            {
            }
            column(DocumentDate_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Document Date")
            {
            }
            column(FinancialYearCode_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Financial Year Code")
            {
            }
            column(Description_ExamMaterialPlannerHeader;"Exam Material Planner Header".Description)
            {
            }
            column(RegionID_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Region ID")
            {
            }
            column(CorporateStrategicID_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Corporate Strategic ID")
            {
            }
            column(FinancialPlanID_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Financial Plan ID")
            {
            }
            column(PlanningStartDate_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Planning Start Date")
            {
            }
            column(PlanningEndDate_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Planning End Date")
            {
            }
            column(TotalCandidature_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Total Candidature")
            {
            }
            column(TotalQuantity_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Total Quantity")
            {
            }
            column(TotalBudget_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Total Budget")
            {
            }
            column(TotalActualCost_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Total Actual Cost")
            {
            }
            column(ApprovalStatus_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Approval Status")
            {
            }
            column(Posted_ExamMaterialPlannerHeader;"Exam Material Planner Header".Posted)
            {
            }
            column(PostedOn_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Posted On")
            {
            }
            column(PostedBy_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Posted By")
            {
            }
            column(CreatedBy_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Created By")
            {
            }
            column(CreatedOn_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Created On")
            {
            }
            column(NoSeries_ExamMaterialPlannerHeader;"Exam Material Planner Header"."No. Series")
            {
            }
            column(ExaminationProjectID_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Examination Project ID")
            {
            }
            column(ProjectName_ExamMaterialPlannerHeader;"Exam Material Planner Header"."Project Name")
            {
            }
            dataitem("Exam Planner Line";"Exam Planner Line")
            {
                DataItemLink = "Planner No."=FIELD(Code);
                column(PlannerNo_ExamPlannerLine;"Exam Planner Line"."Planner No.")
                {
                }
                column(LineNo_ExamPlannerLine;"Exam Planner Line"."Line No.")
                {
                }
                column(ExaminationTaskNo_ExamPlannerLine;"Exam Planner Line"."Examination Task No.")
                {
                }
                column(Description_ExamPlannerLine;"Exam Planner Line".Description)
                {
                }
                column(Examination_ExamPlannerLine;"Exam Planner Line".Examination)
                {
                }
                column(Section_ExamPlannerLine;"Exam Planner Line".Section)
                {
                }
                column(SubjectCode_ExamPlannerLine;"Exam Planner Line"."Subject Code")
                {
                }
                column(SubjectName_ExamPlannerLine;"Exam Planner Line"."Subject Name")
                {
                }
                column(TotalCandidature_ExamPlannerLine;"Exam Planner Line"."Total Candidature")
                {
                }
                column(TotalQuantity_ExamPlannerLine;"Exam Planner Line"."Total Quantity")
                {
                }
                column(TotalBudget_ExamPlannerLine;"Exam Planner Line"."Total Budget")
                {
                }
                column(TotalActualCost_ExamPlannerLine;"Exam Planner Line"."Total Actual Cost")
                {
                }
                column(BoQTemplateCode_ExamPlannerLine;"Exam Planner Line"."BoQ Template Code")
                {
                }
                column(Region_ExamPlannerLine;"Exam Planner Line".Region)
                {
                }
                column(Directorate_ExamPlannerLine;"Exam Planner Line".Directorate)
                {
                }
                column(Department_ExamPlannerLine;"Exam Planner Line".Department)
                {
                }
                column(FinancialYearCode_ExamPlannerLine;"Exam Planner Line"."Financial Year Code")
                {
                }
                column(StartDate_ExamPlannerLine;"Exam Planner Line"."Start Date")
                {
                }
                column(EndDate_ExamPlannerLine;"Exam Planner Line"."End Date")
                {
                }
                column(GlobalDimension1Code_ExamPlannerLine;"Exam Planner Line"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_ExamPlannerLine;"Exam Planner Line"."Global Dimension 2 Code")
                {
                }
                column(ProcurementCategory_ExamPlannerLine;"Exam Planner Line"."Procurement Category")
                {
                }
                column(Posted_ExamPlannerLine;"Exam Planner Line".Posted)
                {
                }
                column(ProjectNo_ExamPlannerLine;"Exam Planner Line"."Project No.")
                {
                }
                dataitem("Examination Planner Items";"Examination Planner Items")
                {
                    DataItemLink = "Exam Planner Entry"=FIELD("Line No.");
                    column(LineNo_ExaminationPlannerItems;"Examination Planner Items"."Line No.")
                    {
                    }
                    column(Type_ExaminationPlannerItems;"Examination Planner Items".Type)
                    {
                    }
                    column(No_ExaminationPlannerItems;"Examination Planner Items"."No.")
                    {
                    }
                    column(LocationCode_ExaminationPlannerItems;"Examination Planner Items"."Location Code")
                    {
                    }
                    column(PostingGroup_ExaminationPlannerItems;"Examination Planner Items"."Posting Group")
                    {
                    }
                    column(Description_ExaminationPlannerItems;"Examination Planner Items".Description)
                    {
                    }
                    column(Description2_ExaminationPlannerItems;"Examination Planner Items"."Description 2")
                    {
                    }
                    column(UnitofMeasure_ExaminationPlannerItems;"Examination Planner Items"."Unit of Measure")
                    {
                    }
                    column(Quantity_ExaminationPlannerItems;"Examination Planner Items".Quantity)
                    {
                    }
                    column(Amount_ExaminationPlannerItems;"Examination Planner Items"."Unit Amount")
                    {
                    }
                    column(ExamPlannerNo_ExaminationPlannerItems;"Examination Planner Items"."Exam Planner No.")
                    {
                    }
                    column(ExamPlannerEntry_ExaminationPlannerItems;"Examination Planner Items"."Exam Planner Entry")
                    {
                    }
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

