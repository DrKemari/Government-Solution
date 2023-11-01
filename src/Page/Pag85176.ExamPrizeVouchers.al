#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85176 "Exam Prize Vouchers"
{
    ApplicationArea = Basic;
    Caption = 'Exam Prize Vouchers';
    CardPageID = "Exam Prize Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Marksheet Header";
    SourceTableView = where(Posted=filter(false),
                            "Document Type"=filter("Prize Award"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DocumentNo;Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationSittingID;Rec."Examination Sitting ID")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate;Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(FinancialYearCode;Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(CorporateStrategicPlanID;Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(FinancialBudgetID;Rec."Financial Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationStartDate;Rec."Examination Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationEndDate;Rec."Examination End Date")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCandidature;Rec."Total Candidature")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus;Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn;Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20;Outlook)
            {
            }
            systempart(Control21;Notes)
            {
            }
            systempart(Control22;MyNotes)
            {
            }
            systempart(Control23;Links)
            {
            }
        }
    }

    actions
    {
    }
}
