#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72058 "Key Stakeholder Views"
{
    PageType = List;
    SourceTable = "Key StakeHolder Advisory";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Study ID"; Rec."Study ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Stakeholder Advisory"; Rec."Stakeholder Advisory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stakeholder Advisory field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

