#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90424 "Innovation Template Category"
{
    PageType = List;
    SourceTable = "Innovation Template Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Checklists"; Rec."No. of Checklists")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Checklists field.';
                }
                field("Total Weighted Score %"; Rec."Total Weighted Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Weighted Score % field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

