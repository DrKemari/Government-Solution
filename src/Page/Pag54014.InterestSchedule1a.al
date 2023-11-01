#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54014 "Interest Schedule1a"
{
    PageType = List;
    SourceTable = "Expected Interest1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Investment No"; Rec."Investment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Coupon Start Date"; Rec."Expected Interest Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Interest Date field.';
                }
                field("Coupon Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Year Start"; Rec."Year Start")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Start field.';
                }
                field("Year End"; Rec."Year End")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year End field.';
                }
                field("Rate %"; Rec."Rate %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate % field.';
                }
                field("Expected Interest Amount"; Rec."Expected Interest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Interest Amount field.';
                }
                field("Whtax Amount"; Rec."Whtax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Whtax Amount field.';
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
                field("Principal Amount + Interest"; Rec."Principal Amount + Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Amount + Interest field.';
                }
                field(Received; Rec.Received)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received field.';
                }
                field("Received Amount"; Rec."Received Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

