#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57087 "Dividend List"
{
    CardPageID = "Dividend Schedule header";
    Editable = false;
    PageType = List;
    SourceTable = "Casual Labours";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Imprest Memo No."; Rec."Imprest Memo No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Memo No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No. Required"; Rec."No. Required")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Required field.';
                }
                field("Work Type"; Rec."Work Type")
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

