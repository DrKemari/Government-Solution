#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75095 "Bid Selection Method"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Bid Selection Method";
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
                field(Overview; Rec.Overview)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overview field.';
                }
                field("Applies To Goods"; Rec."Applies To Goods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies To Goods field.';
                }
                field("Applies To Works"; Rec."Applies To Works")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies To Works field.';
                }
                field("Applies To Services"; Rec."Applies To Services")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies To Services field.';
                }
                field("No. of Invitations For Supply"; Rec."No. of Invitations For Supply")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Invitations For Supply field.';
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
    }
}

#pragma implicitwith restore

