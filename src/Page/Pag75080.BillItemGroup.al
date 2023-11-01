#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75080 "Bill Item Group"
{
    PageType = List;
    SourceTable = "Item Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for the item category.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the item category.';
                }
                field("Bill Item Group"; Rec."Bill Item Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Group field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

