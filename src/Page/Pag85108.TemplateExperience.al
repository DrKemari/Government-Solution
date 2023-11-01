#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85108 "Template Experience"
{
    PageType = ListPart;
    SourceTable = "Staff Template Experience";

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
                }
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Years of Experience"; Rec."Minimum Years of Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Experience Requirement"; Rec."Minimum Experience Requirement")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

