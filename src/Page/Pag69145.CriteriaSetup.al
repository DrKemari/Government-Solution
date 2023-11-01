#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69145 "Criteria Setup"
{
    PageType = List;
    SourceTable = "Criteria Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("General Categories"; Rec."General Categories")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Categories field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

