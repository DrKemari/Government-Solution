#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85126 "Appointment Experience"
{
    PageType = ListPart;
    SourceTable = "Staff Appoint Experience";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Staff Role Code field.';
                }
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Experience Category field.';
                }
                field("Minimum Years of Experience"; Rec."Minimum Years of Experience")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Years of Experience field.';
                }
                field("Minimum Experience Requirement"; Rec."Minimum Experience Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Experience Requirement field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

