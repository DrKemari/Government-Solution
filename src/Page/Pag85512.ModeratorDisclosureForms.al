#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85512 "Moderator Disclosure Forms"
{
    ApplicationArea = Basic;
    CardPageID = "Moderator Disclosure Form";
    PageType = List;
    SourceTable = "Setter Header";
    SourceTableView = where("Document Type"=const("Moderator Disclosure"),
                            Posted=const(false));
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
                field(DocumentType;Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationSitting;Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminerCode;Rec."Examiner Code")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminerName;Rec."Examiner Name")
                {
                    ApplicationArea = Basic;
                }
                field(IDNo;Rec."ID No.")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo;Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field(Submitted;Rec.Submitted)
                {
                    ApplicationArea = Basic;
                }
                field(SubmittedOn;Rec."Submitted On")
                {
                    ApplicationArea = Basic;
                }
                field(SubmittedBy;Rec."Submitted By")
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
            systempart(Control17;Outlook)
            {
            }
            systempart(Control18;Notes)
            {
            }
            systempart(Control19;MyNotes)
            {
            }
            systempart(Control20;Links)
            {
            }
        }
    }

    actions
    {
    }
}
