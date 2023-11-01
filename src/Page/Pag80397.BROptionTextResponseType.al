#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80397 "BR Option Text Response Type"
{
    PageType = List;
    SourceTable = w;

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
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Score (%)"; Rec."Score (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score (%) field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("BR Response Code")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "BR Response Code";
                RunPageLink = "Response Type" = field(Code);
                ToolTip = 'Executes the BR Response Code action.';
            }
        }
    }
}

#pragma implicitwith restore

