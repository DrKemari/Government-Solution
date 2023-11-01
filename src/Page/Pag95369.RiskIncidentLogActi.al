#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95369 "Risk Incident Log Acti"
{
    CardPageID = "Risk Incident Log Action";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Risk Incident Log Action";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Action Status"; Rec."Action Status")
                {
                    ApplicationArea = Basic;
                }
                field("% Complete"; Rec."% Complete")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Date Done"; Rec."Actual Date Done")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
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

#pragma implicitwith restore

