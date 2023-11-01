#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85537 "Marking Progress Lines"
{
    PageType = List;
    SourceTable = "Marking Progress Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Course;Rec.Course)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Level;Rec.Level)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Code";Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(MarkingStartDate;Rec."Marking Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(MarkingEndDate;Rec."Marking End Date")
                {
                    ApplicationArea = Basic;
                }
                field(CheckingStartDate;Rec."Checking Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(CheckingEndDate;Rec."Checking End Date")
                {
                    ApplicationArea = Basic;
                }
                field(EnteringStartDate;Rec."Entering Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EnteringEndDate;Rec."Entering End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingMarkersStartDate;Rec."Clearing(Markers) Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingMarkersEndDate;Rec."Clearing(Markers) End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ComparingStartDate;Rec."Comparing Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ComparingEndDate;Rec."Comparing End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingTeamLeadersDate;Rec."Clearing Team Leaders  Date")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingPapersStartDate;Rec."Clearing(Papers) Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingPapersEndDate;Rec."Clearing(Papers) End Date")
                {
                    ApplicationArea = Basic;
                }
                field(PackingStartDate;Rec."Packing Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(PackingEndDate;Rec."Packing End Date")
                {
                    ApplicationArea = Basic;
                }
                field(KeyinginStartDate;Rec."Keying in Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(KeyinginEndDate;Rec."Keying in End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ProofReadingStartDate;Rec."Proof Reading Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ProofReadingEndDate;Rec."Proof Reading End  Date")
                {
                    ApplicationArea = Basic;
                }
                field("2ndProofReadingStartDate";Rec."2nd Proof Reading Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("2ndProofReadingEndDate";Rec."2nd Proof Reading End  Date")
                {
                    ApplicationArea = Basic;
                }
                field(ConfimofCorrStartDate;Rec."Confim of Corr Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ConfimofCorrEndDate;Rec."Confim of Corr  End  Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
