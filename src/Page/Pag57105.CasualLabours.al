#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57105 "Casual Labours"
{
    PageType = List;
    SourceTable = "Casual Labours";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("National ID Number of casual"; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Type; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Type field.';
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Days field.';
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

