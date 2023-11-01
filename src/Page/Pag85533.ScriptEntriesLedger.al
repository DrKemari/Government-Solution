#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85533 "Script Entries Ledger"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Disp Script Envelope Serials";
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
                field(LineNo;Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(EntryNo;Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(PaperCode;Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field(EnvelopeSerialNo;Rec."Envelope Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field(NoofScripts;Rec."No. of Scripts")
                {
                    ApplicationArea = Basic;
                }
                field(MarkerCode;Rec."Marker Code")
                {
                    ApplicationArea = Basic;
                }
                field(MarkerName;Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                }
                field(Allocated;Rec.Allocated)
                {
                    ApplicationArea = Basic;
                }
                field(Examination;Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationSitting;Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field(PaperName;Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(Level;Rec.Level)
                {
                    ApplicationArea = Basic;
                }
                field(ProjectNo;Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectName;Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(CenterCode;Rec."Center Code")
                {
                    ApplicationArea = Basic;
                }
                field(CenterName;Rec."Center Name")
                {
                    ApplicationArea = Basic;
                }
                field(ReallocatedFromMarkerCode;Rec."Reallocated From Marker Code")
                {
                    ApplicationArea = Basic;
                }
                field(ReallocatedFromMarkerName;Rec."Reallocated From Marker Name")
                {
                    ApplicationArea = Basic;
                }
                field(ReallocatedOn;Rec."Reallocated On")
                {
                    ApplicationArea = Basic;
                }
                field(ReAllocated;Rec."Re-Allocated")
                {
                    ApplicationArea = Basic;
                }
                field(Submitted;Rec.Submitted)
                {
                    ApplicationArea = Basic;
                }
                field(CheckerSubmitted;Rec."Checker Submitted")
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
