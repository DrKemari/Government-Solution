#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51328 "Account Users"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Library Accounts";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Authentication Email"; Rec."Authentication Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authentication Email field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field(State; Rec.State)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the State field.';
                }
                field("Change Password"; Rec."Change Password")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Change Password field.';
                }
                field("Record Type"; Rec."Record Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Record Type field.';
                }
                field("Record ID"; Rec."Record ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Record ID field.';
                }
                field("Password Value"; Rec."Password Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Password Value field.';
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Modified Date field.';
                }
                field(PasswordChanged; Rec.PasswordChanged)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PasswordChanged field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Disable User")
            {
                ApplicationArea = Basic;
                Image = Note;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Disable User action.';
                trigger OnAction()
                begin
                    UserSetup.Reset;
                    UserSetup.SetRange("User ID", UserId);
                    UserSetup.SetRange(Projects, true);
                    if UserSetup.FindSet then begin
                        Rec.State := Rec.State::Disabled;
                        Rec.Modify(true);
                    end else
                        Error('You do not have sufficient rights to disable a user,consult the Data Collection Administrator');
                end;
            }
        }
    }

    var
        UniversityUsers: Record UniversityUsers;
        UserSetup: Record "User Setup";
        Email: Text;
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        CashMgt: Record "Cash Management Setup";
}

#pragma implicitwith restore

