#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85440 "Setter Papers"
{
    PageType = ListPart;
    SourceTable = "Setter Papers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
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

