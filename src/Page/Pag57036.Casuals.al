#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57036 "Casuals"
{
    PageType = ListPart;
    SourceTable = Casuals;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Type field.';
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Task No. field.';
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity field.';
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Rate field.';
                }
                field("No. Required"; Rec."No. Required")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Required field.';
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Days field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

