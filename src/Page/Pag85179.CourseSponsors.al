#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85179 "Course Sponsors"
{
    PageType = List;
    SourceTable = "Course Sponsors";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DonorCode;Rec."Sponsor Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Code';
                }
                field(DonorName;Rec."Sponsor Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Name';
                }
                field(PrizeDetails;Rec."Prize Details")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field(NotifiedOn;Rec."Notified On")
                {
                    ApplicationArea = Basic;
                }
                field(Notified;Rec.Notified)
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
