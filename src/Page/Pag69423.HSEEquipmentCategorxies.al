#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69423 "HSE Equipment Categorxies"
{
    ApplicationArea = Basic;
    CardPageID = "HSE Equipment Categoryx";
    PageType = List;
    SourceTable = "HSE Equipment Categoryx";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Additional Notes/Comments"; Rec."Additional Notes/Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Notes/Comments field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Safety Equipment Register")
            {
                ApplicationArea = Basic;
                Caption = 'Safety Equipment Register';
                Image = DistributionGroup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Safety Equipment Registers";
                RunPageLink = "Safety Equipment Category" = field(Code);
                ToolTip = 'Executes the Safety Equipment Register action.';
            }
        }
    }
}

#pragma implicitwith restore

