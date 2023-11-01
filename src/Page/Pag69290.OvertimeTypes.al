#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69290 "Overtime Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Overtime Type Rates";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Overtime Type"; Rec."Overtime Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Type field.';
                }
                field("Overtime Rate"; Rec."Overtime Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Rate field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

