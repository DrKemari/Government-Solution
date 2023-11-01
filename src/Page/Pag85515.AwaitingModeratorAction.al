#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85515 "Awaiting Moderator Action"
{
    ApplicationArea = Basic;
    CardPageID = "Moderator Comment Card";
    Editable = false;
    PageType = List;
    SourceTable = "Examination Review Voucher";
    SourceTableView = where("Document Type"=filter(CEO|"Chief Examiner"|Reviewer),
                            Status=const("Awaiting Moderator"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentNo;Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn;Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationSitting;Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field(PaperCode;Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field(PaperName;Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(ModeratorNo;Rec."Moderator No.")
                {
                    ApplicationArea = Basic;
                }
                field(ModeratorName;Rec."Moderator Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control27;Outlook)
            {
            }
            systempart(Control28;Notes)
            {
            }
            systempart(Control29;MyNotes)
            {
            }
            systempart(Control30;Links)
            {
            }
        }
    }

    actions
    {
    }
}
