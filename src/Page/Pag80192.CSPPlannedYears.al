#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80192 "CSP Planned Years"
{
    PageType = List;
    SourceTable = "CSP Planned Years";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Annual Year Code"; Rec."Annual Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Year Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

