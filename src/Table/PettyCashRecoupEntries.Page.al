#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57310 "Petty Cash Recoup Entries"
{
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Petty Cash Entries";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(PostedDate; "Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field(InitialDocumentNo; "Payment Document No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Initial Document No';
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
            }
            systempart(Control12; Notes)
            {
            }
            systempart(Control13; MyNotes)
            {
            }
            systempart(Control14; Links)
            {
            }
        }
    }

    actions
    {
    }
}

