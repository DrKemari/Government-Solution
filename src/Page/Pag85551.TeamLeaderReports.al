#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85551 "Team Leader Reports"
{
    ApplicationArea = Basic;
    CardPageID = "Team Leader Report";
    Editable = false;
    PageType = List;
    SourceTable = "Scripts Dispatch Header";
    SourceTableView = where("Document Type"=const("Team Leader Reports"));
    UsageCategory = ReportsandAnalysis;

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
                field(SittingCycle;Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                }
                field("Team Leader No";Rec."Marker No")
                {
                    ApplicationArea = Basic;
                }
                field("Team Leader Name";Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9;Outlook)
            {
            }
            systempart(Control10;Notes)
            {
            }
            systempart(Control11;MyNotes)
            {
            }
            systempart(Control12;Links)
            {
            }
        }
    }

    actions
    {
    }
}
