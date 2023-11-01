#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85173 "Disc Commitee Members"
{
    PageType = ListPart;
    SourceTable = "Commiitee Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member Role"; Rec."Member Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Role field.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

