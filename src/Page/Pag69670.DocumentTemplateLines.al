#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69670 "Document Template Lines"
{
    PageType = ListPart;
    SourceTable = "Document Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("HR Document Type"; Rec."HR Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

