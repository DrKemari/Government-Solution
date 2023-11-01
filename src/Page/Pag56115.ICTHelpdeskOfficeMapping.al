#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56115 "ICT Helpdesk Office Mapping"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "ICT Officers Category Mapping";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(UserName; Rec.UserName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserName field.';
                }
                field("Help Desk Category"; Rec."Help Desk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Help Desk Category field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("User Feedbback Duration"; Rec."User Feedbback Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Feedbback Duration field.';
                }
                field("Assined Issue Duration"; Rec."Assined Issue Duration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Issue Duration';
                    ToolTip = 'Specifies the value of the Assigned Issue Duration field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

