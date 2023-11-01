#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59033 "Limit Types"
{
    ApplicationArea = Basic;
    CardPageID = "Limit Types Card";
    PageType = List;
    SourceTable = "Limit Types";
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
                field("Request Duration"; Rec."Request Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Duration field.';
                }
                field("Lower Limit"; Rec."Lower Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lower Limit field.';
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Upper Limit field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

