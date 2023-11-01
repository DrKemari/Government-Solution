#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85552 "Team Leader Report"
{
    Editable = false;
    PageType = Document;
    SourceTable = "Scripts Dispatch Header";

    layout
    {
        area(content)
        {
            group(General)
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
                field(DocumentStatus;Rec."Document Status")
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
            systempart(Control10;Outlook)
            {
            }
            systempart(Control11;Notes)
            {
            }
            systempart(Control12;MyNotes)
            {
            }
            systempart(Control13;Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type":=Rec."document type"::"Team Leader Reports";
    end;
}
