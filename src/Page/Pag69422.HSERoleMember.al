#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69422 "HSE Role Member"
{
    PageType = Card;
    SourceTable = "HSE Role Member";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Role ID"; Rec."Role ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role ID field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Membership Role Type"; Rec."Membership Role Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Role Type field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Service Start Date"; Rec."Service Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Start Date field.';
                }
                field("Service End Date"; Rec."Service End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service End Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

