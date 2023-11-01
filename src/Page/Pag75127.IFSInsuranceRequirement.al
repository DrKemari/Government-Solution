#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75127 "IFS Insurance Requirement"
{
    PageType = List;
    SourceTable = "IFS Insurance Requirement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Type field.';
                }
                field("Policy Cover Type"; Rec."Policy Cover Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Cover Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Minimum Policy Coverage (LCY)"; Rec."Minimum Policy Coverage (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Policy Coverage (LCY) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

