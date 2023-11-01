#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95341 "Audit Committee Function"
{
    PageType = List;
    SourceTable = "Audit Committee Function";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Type field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Act Reference"; Rec."Act Reference")
                {
                    ApplicationArea = Basic;
                    Caption = 'PPDA Act reference';
                    Visible = false;
                    ToolTip = 'Specifies the value of the PPDA Act reference field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

