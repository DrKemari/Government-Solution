#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69514 "Case Details"
{
    PageType = ListPart;
    SourceTable = "Case Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case No"; Rec."Case No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case No field.';
                }
                field("Case Type"; Rec."Case Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Type field.';
                }
                field("Case Details"; Rec."Case Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Details field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

