#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56020 "Copyright Categories"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Copyright Works Categories";
    UsageCategory = Lists;

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
                field("Authentication Devices"; Rec."Authentication Devices")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authentication Devices field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Copyright Right Sub-Categories")
            {
                ApplicationArea = Basic;
                Caption = 'Copyright Right Sub-Categories';
                Image = Task;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Copyright Sub-Categories Setup";
                RunPageLink = "Category Code" = field(Code);
                ToolTip = 'Executes the Copyright Right Sub-Categories action.';
            }
        }
    }
}

#pragma implicitwith restore

