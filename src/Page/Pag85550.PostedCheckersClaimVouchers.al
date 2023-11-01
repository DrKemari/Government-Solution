#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85550 "Posted Checkers Claim Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "Checker Claim Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Scripts Dispatch Header";
    SourceTableView = where("Approval Status"=filter(<>Released),
                            Posted=const(true),
                            "Document Type"=const("Checker Claim Voucher"));
    UsageCategory = History;

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
                field(MarkerNo;Rec."Marker No")
                {
                    ApplicationArea = Basic;
                }
                field(MarkerName;Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                }
                field(SittingCycle;Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(ProjectNo;Rec."Project No.")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectName;Rec."Project Name")
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
            systempart(Control14;Outlook)
            {
            }
            systempart(Control15;Notes)
            {
            }
            systempart(Control16;MyNotes)
            {
            }
            systempart(Control17;Links)
            {
            }
        }
    }

    actions
    {
    }
}
