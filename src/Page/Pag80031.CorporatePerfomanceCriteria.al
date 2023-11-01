#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80031 "Corporate Perfomance Criteria"
{
    PageType = List;
    SourceTable = "Corporate Perfomance Criteria";

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
                field("Perfomance Criteria Category"; Rec."Perfomance Criteria Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Perfomance Criteria Category field.';
                }
                field("Weight (%)"; Rec."Weight (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight (%) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

