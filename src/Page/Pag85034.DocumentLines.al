#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85034 "Document Lines"
{
    PageType = ListPart;
    SourceTable = "Examination Document Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Examination Process"; Rec."Examination Process")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Process field.';
                }
                field("Examination Document Type"; Rec."Examination Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Document Type field.';
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

