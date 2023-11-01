#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69351 "Evaluation Rating Scale"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Category Rating Scale";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Code field.';
                }
                field("Category Description"; Rec."Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Description field.';
                }
                field("Rating Code"; Rec."Rating Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Code field.';
                }
                field("Rating Description"; Rec."Rating Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

