#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85503 "Script Re-Allocation Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "Script Re-Allocation Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Re-Allocation Header";
    SourceTableView = where("Document Type"=const("Script Re-allocation"));
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
                field(SittingCycle;Rec."Sitting Cycle")
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
                field(EnvelopeSerialNo;Rec."Envelope Serial No")
                {
                    ApplicationArea = Basic;
                }
                field(ReAllocatetoMarkerNo;Rec."Re-Allocate to Marker No")
                {
                    ApplicationArea = Basic;
                }
                field(ReAllocatetoMarkerName;Rec."Re-Allocate to Marker Name")
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
