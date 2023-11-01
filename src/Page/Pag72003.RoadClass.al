#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Road Class (ID 72003).
/// </summary>
#pragma implicitwith disable
Page 72003 "Road Class"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Road Class";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Class ID"; Rec."Class ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                }
                field("Agency Mandate"; Rec."Agency Mandate")
                {
                    ApplicationArea = Basic;
                }
                field("Paved (Km)"; Rec."Paved (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("UnPaved (Km)"; Rec."UnPaved (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Total (Km)"; Rec."Total (Km)")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Desired Road Reserve Width (M)"; Rec."Desired Road Reserve Width (M)")
                {
                    ApplicationArea = Basic;
                }
                field("Min Road Reserve Width (M)"; Rec."Min Road Reserve Width (M)")
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

