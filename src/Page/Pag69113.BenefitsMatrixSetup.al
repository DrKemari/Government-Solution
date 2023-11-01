#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69113 "Benefits Matrix Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Benefits Matrix Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Benefit Type"; Rec."Benefit Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Type field.';
                }
                field("Benefit Description"; Rec."Benefit Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Description field.';
                }
                field("Beneficiary Category"; Rec."Beneficiary Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Beneficiary Category field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

