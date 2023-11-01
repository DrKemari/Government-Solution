page 56653 "User Setup Permissions"
{
    ApplicationArea = All;
    Caption = 'User Setup Permissions';
    PageType = List;
    SourceTable = "User Setup Permissions";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("User Name"; Rec."User Name")
                {
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field("Can Change Profile"; Rec."Can Change Profile")
                {
                    ToolTip = 'Specifies the value of the Can Change Profile field.';
                }
                field("Can Modify User Setup"; Rec."Can Modify User Setup")
                {
                    ToolTip = 'Specifies the value of the Can Modify User Setup field.';
                }
            }
        }
    }
}
