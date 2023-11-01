#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69417 "Safety Permit Consequences"
{
    CardPageID = "Safety Permit Consequence";
    PageType = List;
    SourceTable = "Safety Permit Consequence";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Permit Type"; Rec."Permit Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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

