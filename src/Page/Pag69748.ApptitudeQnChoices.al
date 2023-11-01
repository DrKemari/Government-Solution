#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69748 "Apptitude Qn Choices"
{
    PageType = ListPart;
    SourceTable = "Apptitude Question Choice";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Apptitude Question"; Rec."Apptitude Question")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Apptitude Question field.';
                }
                field("Choice ID"; Rec."Choice ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Choice ID field.';
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

