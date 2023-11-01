#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54049 "Money Market Category List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Equity Sectors";
    SourceTableView = sorting("Sector Code")
                      order(ascending)
                      where(Type = const(MMarket));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sector Code"; Rec."Sector Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sector Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

