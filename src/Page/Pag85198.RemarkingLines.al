#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85198 "Remarking Lines"
{
    PageType = ListPart;
    SourceTable = "Student Processing Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    Caption = 'Level';
                }
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                }
                field("Paper Marks"; Rec."Paper Marks")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Marker No"; Rec."Marker No")
                {
                    ApplicationArea = Basic;
                }
                field("Marker Name"; Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount LCY"; Rec."Amount LCY")
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

