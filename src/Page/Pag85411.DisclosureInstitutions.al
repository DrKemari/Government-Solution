#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85411 "Disclosure Institutions"
{
    PageType = ListPart;
    SourceTable = "Disclosure Training Inst";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Institution Code"; Rec."Institution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Code field.';
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name field.';
                }
                field("Date Commenced Training"; Rec."Date Commenced Training")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Commenced Training field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

