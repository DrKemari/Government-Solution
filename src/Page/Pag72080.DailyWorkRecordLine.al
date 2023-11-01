#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72080 "Daily Work Record Line"
{
    PageType = ListPart;
    SourceTable = "Daily Work Record Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Chainage From"; Rec."Chainage From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chainage From field.';
                }
                field("Chainage To"; Rec."Chainage To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chainage To field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Photo No."; Rec."Photo No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Photo No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

