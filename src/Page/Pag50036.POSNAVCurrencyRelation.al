#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50036 "POS-NAV Currency Relation"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Pos- nav Currency Relation";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Pos Currency Code";Rec."Pos Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Related Nav Currency Code";Rec."Related Nav Currency Code")
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

