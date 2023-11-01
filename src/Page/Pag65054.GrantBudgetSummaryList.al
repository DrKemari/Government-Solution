#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65054 "Grant Budget Summary List"
{
    PageType = List;
    SourceTable = "Grant Budget Summary";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Budget Currency"; Rec."Budget Currency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Currency field.';
                }
                field("Budget Amount"; Rec."Budget Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Amount field.';
                }
                field("Budget Amount(LCY)"; Rec."Budget Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Amount(LCY) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

