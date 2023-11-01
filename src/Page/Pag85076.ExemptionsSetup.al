#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85076 "Exemptions Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Exemptions Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Examination Code"; Rec."Examination Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Code field.';
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                // field(Type; Rec.Type)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Type field.';
                // }
                // field("Qualification Code"; Rec."Qualification Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Qualification Code field.';
                // }
                field("Exemption Subject Code"; Rec."Exemption Subject Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exemption Subject Code field.';
                }
                field("Exemption Subject"; Rec."Exemption Subject")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Exemption Subject field.';
                }
                field("Exemption Examination"; Rec."Exemption Examination")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Exemption Examination field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

