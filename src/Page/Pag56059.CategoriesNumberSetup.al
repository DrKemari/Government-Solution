#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56059 "Categories Number Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Categories Number Setup";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("copyright Category Code"; Rec."copyright Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the copyright Category Code field.';
                }
                field("Copyright Category Description"; Rec."Copyright Category Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Copyright Category Description field.';
                }
                field("no series"; Rec."no series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the no series field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

