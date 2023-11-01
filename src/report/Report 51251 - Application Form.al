report 51251 "Application Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Application Form.rdlc';

    dataset
    {
        dataitem("Accreditation Application";"Accreditation Application")
        {
            column(Logo;CI.Picture)
            {
            }
            column(Name;CI.Name)
            {
            }
            column(Address;CI.Address)
            {
            }
            column(PostCode;CI."Post Code")
            {
            }
            column(County;CI.County)
            {
            }
            column(ApplicationNo_AccreditationApplication;"Accreditation Application"."Application No.")
            {
            }
            column(No_AccreditationApplication;"Accreditation Application"."No.")
            {
            }
            column(Name_AccreditationApplication;"Accreditation Application".Name)
            {
            }
            column(Address_AccreditationApplication;"Accreditation Application".Address)
            {
            }
            column(Address2_AccreditationApplication;"Accreditation Application"."Address 2")
            {
            }
            column(City_AccreditationApplication;"Accreditation Application".City)
            {
            }
            column(Contact_AccreditationApplication;"Accreditation Application".Contact)
            {
            }
            column(PhoneNo_AccreditationApplication;"Accreditation Application"."Phone No.")
            {
            }
            column(Country_AccreditationApplication;"Accreditation Application".Country)
            {
            }
            column(Email_AccreditationApplication;"Accreditation Application".Email)
            {
            }
            column(ApplicationType_AccreditationApplication;"Accreditation Application"."Application Type")
            {
            }
            column(NoSeries_AccreditationApplication;"Accreditation Application"."No. Series")
            {
            }
            column(PostCode_AccreditationApplication;"Accreditation Application"."Post Code")
            {
            }
            column(County_AccreditationApplication;"Accreditation Application".County)
            {
            }
            column(CreatedBy_AccreditationApplication;"Accreditation Application"."Created By")
            {
            }
            column(CreatedOn_AccreditationApplication;"Accreditation Application"."Created On")
            {
            }
            column(ReceiptNo_AccreditationApplication;"Accreditation Application"."Receipt No.")
            {
            }
            column(InvoiceNo_AccreditationApplication;"Accreditation Application"."Invoice No.")
            {
            }
            column(InvoiceAmount_AccreditationApplication;"Accreditation Application"."Invoice Amount")
            {
            }
            column(ReceiptAmount_AccreditationApplication;"Accreditation Application"."Receipt Amount")
            {
            }
            column(Status_AccreditationApplication;"Accreditation Application".Status)
            {
            }
            column(ApplicationTypeName_AccreditationApplication;"Accreditation Application"."Application Type Name")
            {
            }
            column(ApplicationFeeLCY_AccreditationApplication;"Accreditation Application"."Application Fee LCY")
            {
            }
            column(CurrencyCode_AccreditationApplication;"Accreditation Application"."Currency Code")
            {
            }
            column(ApplicationFee_AccreditationApplication;"Accreditation Application"."Application Fee")
            {
            }
            column(Published_AccreditationApplication;"Accreditation Application".Published)
            {
            }
            column(RejectionReason_AccreditationApplication;"Accreditation Application"."Rejection Reason")
            {
            }
            column(PaymentReferenceNo_AccreditationApplication;"Accreditation Application"."Payment  Reference No.")
            {
            }
            column(PaymentDocument_AccreditationApplication;"Accreditation Application"."Payment Document")
            {
            }
            column(InstitutionTypeCode_AccreditationApplication;"Accreditation Application"."Institution Type Code")
            {
            }
            column(InstitutionType_AccreditationApplication;"Accreditation Application"."Institution Type")
            {
            }
            column(InvoiceAmountLCY_AccreditationApplication;"Accreditation Application"."Invoice Amount LCY")
            {
            }
            column(ReceiptAmountLCY_AccreditationApplication;"Accreditation Application"."Receipt Amount LCY")
            {
            }
            dataitem("Acc Administrative Staff";"Acc Administrative Staff")
            {
                DataItemLink = "Application No."=FIELD("Application No.");
                column(ApplicationNo_AccAdministrativeStaff;"Acc Administrative Staff"."Application No.")
                {
                }
                column(Category_AccAdministrativeStaff;"Acc Administrative Staff".Category)
                {
                }
                column(NoofStaff_AccAdministrativeStaff;"Acc Administrative Staff"."No. of Staff")
                {
                }
                column(HighestAcademicQualification_AccAdministrativeStaff;"Acc Administrative Staff"."Highest Academic Qualification")
                {
                }
                column(LowestAcademicQualification_AccAdministrativeStaff;"Acc Administrative Staff"."Lowest Academic Qualification")
                {
                }
                column(EntryNo_AccAdministrativeStaff;"Acc Administrative Staff"."Entry No.")
                {
                }
                column(Description_AccAdministrativeStaff;"Acc Administrative Staff".Description)
                {
                }
            }
            dataitem("Accreditation Trainers";"Accreditation Trainers")
            {
                DataItemLink = "Application No."=FIELD("Application No.");
                column(ApplicationNo_AccreditationTrainers;"Accreditation Trainers"."Application No.")
                {
                }
                column(CourseCode_AccreditationTrainers;"Accreditation Trainers"."Course Code")
                {
                }
                column(CourseSection_AccreditationTrainers;"Accreditation Trainers"."Course Section")
                {
                }
                column(NoofParttimeStudents_AccreditationTrainers;"Accreditation Trainers"."No. of Parttime Students")
                {
                }
                column(NoofFulltimeStudents_AccreditationTrainers;"Accreditation Trainers"."No. of Fulltime Students")
                {
                }
                column(NoofParttimeTrainers_AccreditationTrainers;"Accreditation Trainers"."No. of Parttime Trainers")
                {
                }
                column(NoofFulltimeTrainers_AccreditationTrainers;"Accreditation Trainers"."No. of Fulltime Trainers")
                {
                }
                column(HighestTrainerQualification_AccreditationTrainers;"Accreditation Trainers"."Highest Trainer Qualification")
                {
                }
                column(LowestTrainerQualification_AccreditationTrainers;"Accreditation Trainers"."Lowest Trainer Qualification")
                {
                }
                column(MinLecHrsPerWeekTrainer_AccreditationTrainers;"Accreditation Trainers"."Min Lec Hrs Per Week Trainer")
                {
                }
                column(MaxLecHrsPerWeekTrainer_AccreditationTrainers;"Accreditation Trainers"."Max Lec Hrs Per Week Trainer")
                {
                }
                column(MinCourseHrsPerWeekSem_AccreditationTrainers;"Accreditation Trainers"."Min Course Hrs Per Week Sem")
                {
                }
                column(MaxCourseHrsPerWeekSem_AccreditationTrainers;"Accreditation Trainers"."Max Course Hrs Per Week Sem")
                {
                }
                column(EntryNo_AccreditationTrainers;"Accreditation Trainers"."Entry No.")
                {
                }
            }
            dataitem("Application Response";"Application Response")
            {
                DataItemLink = "Application No."=FIELD("Application No.");
                column(Subquestion;Subquestion)
                {
                }
                column(Subresponse;Subresponse)
                {
                }
                column(ApplicationNo_ApplicationResponse;"Application Response"."Application No.")
                {
                }
                column(AccreditationQuestion_ApplicationResponse;"Application Response"."Accreditation Question")
                {
                }
                column(QuestionType_ApplicationResponse;"Application Response"."Question Type")
                {
                }
                column(AccreditationAnswers_ApplicationResponse;"Application Response"."Accreditation Answers")
                {
                }
                column(EntryNo_ApplicationResponse;"Application Response"."Entry No")
                {
                }
                column(Response_ApplicationResponse;"Application Response".Response)
                {
                }
                column(Description_ApplicationResponse;"Application Response".Description)
                {
                }
                column(ApplicationChapterName;ApplicationChapterName)
                {
                }
                column(QuestionCode_ApplicationResponse;"Application Response"."Question Code")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    //Add chapter
                    ApplicationChapterName:=' ';
                    ApplicationTopicName:=' ';
                    Subquestion:='';
                    Subresponse:='';
                    SubQuesResponse.Reset;
                    SubQuesResponse.SetRange("Question Code","Application Response"."Question Code");
                    if SubQuesResponse.FindSet then begin
                      repeat
                        //insert
                        Subquestion:=SubQuesResponse.Description;
                        Subresponse:=SubQuesResponse.Response;
                      until SubQuesResponse.Next=0;
                    end;
                    AccreditationQuestions.Reset;
                    AccreditationQuestions.SetRange(Code,"Application Response"."Question Code");
                    if AccreditationQuestions.FindFirst then begin
                    ApplicationQuestionNos.Reset;
                    ApplicationQuestionNos.SetRange(Code,AccreditationQuestions."Question No.");
                    if ApplicationQuestionNos.FindFirst then begin
                      ApplicationChapter.Reset;
                      ApplicationChapter.SetRange(Code,ApplicationQuestionNos.Chapter);
                      if ApplicationChapter.FindFirst then begin
                        ApplicationChapterName:=ApplicationChapter."Component Description";

                      end
                    end;
                    end
                end;
            }
            dataitem("Accreditation Seating Capacity";"Accreditation Seating Capacity")
            {
                DataItemLink = "Application No."=FIELD("Application No.");
                column(ApplicationNo_AccreditationSeatingCapacity;"Accreditation Seating Capacity"."Application No.")
                {
                }
                column(Examination_AccreditationSeatingCapacity;"Accreditation Seating Capacity".Examination)
                {
                }
                column(ExamDescription_AccreditationSeatingCapacity;"Accreditation Seating Capacity"."Exam Description")
                {
                }
                column(NoofClassrooms_AccreditationSeatingCapacity;"Accreditation Seating Capacity"."No. of Classrooms")
                {
                }
                column(EstimatedSeatingSpace_AccreditationSeatingCapacity;"Accreditation Seating Capacity"."Estimated Seating Space")
                {
                }
                column(LargestClassSeatingcapacity_AccreditationSeatingCapacity;"Accreditation Seating Capacity"."Largest Class Seating capacity")
                {
                }
                column(SmallestClassSeatingcapacity_AccreditationSeatingCapacity;"Accreditation Seating Capacity"."Smallest ClassSeating capacity")
                {
                }
                column(TotalSeatingcapacity_AccreditationSeatingCapacity;"Accreditation Seating Capacity"."Total Seating capacity")
                {
                }
            }
            dataitem("Accreditation Reference books";"Accreditation Reference books")
            {
                DataItemLink = "Application No."=FIELD("Application No.");
                column(ApplicationNo_AccreditationReferencebooks;"Accreditation Reference books"."Application No.")
                {
                }
                column(DomainAreaCode_AccreditationReferencebooks;"Accreditation Reference books"."Domain Area Code")
                {
                }
                column(DomainArea_AccreditationReferencebooks;"Accreditation Reference books"."Domain Area")
                {
                }
                column(Estimatednumber_AccreditationReferencebooks;"Accreditation Reference books"."Estimated number")
                {
                }
                column(Estimatedtotalvalue_AccreditationReferencebooks;"Accreditation Reference books"."Estimated total value")
                {
                }
                column(NoofRecommbooks_AccreditationReferencebooks;"Accreditation Reference books"."No. of Recomm books")
                {
                }
            }
            dataitem("Accreditation Computer Details";"Accreditation Computer Details")
            {
                DataItemLink = "Application No."=FIELD("Application No.");
                column(ApplicationNo_AccreditationComputerDetails;"Accreditation Computer Details"."Application No.")
                {
                }
                column(NoofComputers_AccreditationComputerDetails;"Accreditation Computer Details"."No. of Computers")
                {
                }
                column(Processortype_AccreditationComputerDetails;"Accreditation Computer Details"."Processor type")
                {
                }
                column(Processorspeed_AccreditationComputerDetails;"Accreditation Computer Details"."Processor speed")
                {
                }
                column(RAMCapacity_AccreditationComputerDetails;"Accreditation Computer Details"."RAM Capacity")
                {
                }
                column(Harddiskcapacity_AccreditationComputerDetails;"Accreditation Computer Details"."Hard disk capacity")
                {
                }
                column(EntryNo_AccreditationComputerDetails;"Accreditation Computer Details"."Entry No.")
                {
                }
            }
            dataitem("Accreditation Computer Labs";"Accreditation Computer Labs")
            {
                DataItemLink = "Application No."=FIELD("Application No.");
                column(ApplicationNo_AccreditationComputerLabs;"Accreditation Computer Labs"."Application No.")
                {
                }
                column(ComputerLaboratory_AccreditationComputerLabs;"Accreditation Computer Labs"."Computer Laboratory")
                {
                }
                column(Seatingcapacity_AccreditationComputerLabs;"Accreditation Computer Labs"."Seating capacity")
                {
                }
                column(Noavailablefortraining_AccreditationComputerLabs;"Accreditation Computer Labs"."No. available for training")
                {
                }
                column(NowithAdapterCards_AccreditationComputerLabs;"Accreditation Computer Labs"."No. with Adapter Cards")
                {
                }
                column(Totalspace_AccreditationComputerLabs;"Accreditation Computer Labs"."Total space")
                {
                }
                column(EntryNo_AccreditationComputerLabs;"Accreditation Computer Labs"."Entry No.")
                {
                }
            }
            dataitem("ICT Equipment";"ICT Equipment")
            {
                DataItemLink = "Application No."=FIELD("Application No.");
                column(ApplicationNo_ICTEquipment;"ICT Equipment"."Application No.")
                {
                }
                column(EntryNo_ICTEquipment;"ICT Equipment"."Entry No.")
                {
                }
                column(AcademicICTType_ICTEquipment;"ICT Equipment"."Academic ICT Type")
                {
                }
                column(AcademicTypeName_ICTEquipment;"ICT Equipment"."Academic Type Name")
                {
                }
                column(Number_ICTEquipment;"ICT Equipment".Number)
                {
                }
                column(TypeAvailable_ICTEquipment;"ICT Equipment"."Type Available")
                {
                }
                column(Category_ICTEquipment;"ICT Equipment".Category)
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        SubQuesResponse: Record "Application Sub-Ques Response";
        Subquestion: Text;
        Subresponse: Text;
        ApplicationChapter: Record "Application Chapter";
        ApplicationTopic: Record "Application Topic";
        ApplicationChapterName: Text;
        ApplicationTopicName: Text;
        ApplicationQuestionNos: Record "Application Question Nos.";
        AccreditationQuestions: Record "Accreditation Questions";
}

