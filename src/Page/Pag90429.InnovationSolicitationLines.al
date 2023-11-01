#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90429 "Innovation Solicitation Lines"
{
    PageType = List;
    SourceTable = "Innovation Solicitation Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Record Type"; Rec."Record Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Record Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
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

