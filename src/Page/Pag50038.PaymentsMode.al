#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50038 "Payments Mode"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Payment Modes";
    UsageCategory = Administration;

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
                field("Related Bank"; Rec."Related Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Related Bank field.';
                }
            }
        }
    }

    actions
    {
    }
}

