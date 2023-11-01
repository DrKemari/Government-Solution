#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69054 "Regional Rates"
{
    PageType = List;
    SourceTable = "Regional Rates";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Night Allowance Rate"; Rec."Night Allowance Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Guards Wages Daily Rate"; Rec."Guards Wages Daily Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Drivers Wages Daily Rate"; Rec."Drivers Wages Daily Rate")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000009; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000010; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

