pageextension 54800 MyExtension extends "User Settings"
{

    layout
    {
        addafter(UserRoleCenter)
        {
            field(UserRole; CurrUserProfile)
            {

                ApplicationArea = All;
                AssistEdit = true;
                Caption = 'User Role';
                Editable = false;
                Importance = Promoted;
                trigger OnAssistEdit()
                var
                    Userp: page "User Personalization Card1";
                begin
                    page.Run(50689);
                end;
            }
        }
        modify(UserRoleCenter)
        {
            Visible = false;
        }

        /*       modify(UserRoleCenter)
              {
                  Visible = false;
              }

              addafter(UserRoleCenter)
              {
                  field(UserRoleCenter1; GetProfileName)
                  {
                      ApplicationArea = All;
                      AssistEdit = true;
                      Caption = 'User Role Center';
                      Editable = false;
                      Importance = Promoted;
                      ToolTip = 'Specifies the role that defines your home page with links to the most common tasks.';

                      trigger OnAssistEdit()
                      var
                          AllProfile: Record "All Profile";
                          RolecenterSelectorMgt: Codeunit "Rolecenter Selector Mgt.";
                          RoleCenterOverview: Page "Role Center Overview";
                          UserPersonalizationCard: Page "User Personalization Card";
                          UserRec: Record "User Setup";
                      begin
                           UserRec.get(Database.UserId);
                          if UserRec."Can Change Profile" = false then
                              error('Please note that you dont have the rights to change your profile'); 

                          if RolecenterSelectorMgt.IsRolecenterSelectorEnabled(UserId) then begin
                              RoleCenterOverview.SetSelectedProfile(ProfileScope, ProfileAppID, ProfileID);
                              RoleCenterOverview.DelaySessionUpdateRequest;
                              if RoleCenterOverview.RunModal = ACTION::OK then
                                  RoleCenterOverview.GetSelectedProfile(ProfileScope, ProfileAppID, ProfileID);
                          end else begin
                              if AllProfile.Get(ProfileScope, ProfileAppID, ProfileID) then;
                              if PAGE.RunModal(PAGE::"Available Roles", AllProfile) = ACTION::LookupOK then begin
                                  ProfileID := AllProfile."Profile ID";
                                  ProfileAppID := AllProfile."App ID";
                                  ProfileScope := AllProfile.Scope;
                              end;
                          end;

                          OnUserRoleCenterChange(AllProfile);
                          UserPersonalizationCard.SetExperienceToEssential(ProfileID);
                      end;
                  }
              } */
    }

    actions
    {
        addlast(Navigation)
        {
            action(UserProfile)
            {
                caption = 'User Profile';
                ApplicationArea = basic;
                Image = UserInterface;
                RunObject = page "User Personalization Card1";
                // RunPageLink = "User ID" = const(Database."User ID");
            }
        }
    }
    trigger OnModifyRecord(): Boolean
    var
        UserRec: record "User Setup Permissions";
    begin
        // ProfileID := "Profile ID";

        if UserRec.get(database.UserId) then begin
            IF UserRec."Can Change Profile" = FALSE then
                ERROR('Please note that you dont have the rights to Change Profile');
        end else begin
            ERROR('Please note that you dont have the rights to Change Profile!');
        end;
    end;

    trigger OnAfterGetCurrRecord()
    var
        UserP: record "User Personalization";
        UserRec: record "User Setup Permissions";
    begin
        UserP.reset;
        UserP.setrange("User ID", Database.UserId);
        if UserP.find('-') then
            CurrUserProfile := UserP."Profile ID";

        if UserRec.get(database.UserId) then begin
            IF UserRec."Can Change Profile" = FALSE then
                ERROR('Please note that you dont have the rights to Change Profile');
        end else begin
            ERROR('Please note that you dont have the rights to Change Profile!');
        end;
    end;

    trigger OnOpenPage()
    var
        UserRec: record "User Setup Permissions";
    begin
        // ProfileID := "Profile ID";

        if UserRec.get(database.UserId) then begin
            IF UserRec."Can Change Profile" = FALSE then
                ERROR('Please note that you dont have the rights to Change Profile');
        end else begin
            ERROR('Please note that you dont have the rights to Change Profile!');
        end;
    end;

    local procedure OnUserRoleCenterChange(NewAllProfile: Record "All Profile")

    begin

    end;

    local procedure GetProfileName() ProfileName: Text
    var
        AllProfile: Record "All Profile";
        ConfPersonalizationMgt: Codeunit "Conf./Personalization Mgt.";
    begin
        // If current profile has been changed, then find it and update the description; else, get the default
        if not AllProfile.Get(ProfileScope, ProfileAppID, ProfileID) then
            if ConfPersonalizationMgt.TryGetDefaultProfileForCurrentUser(AllProfile) then;

        ProfileName := AllProfile.Caption;
    end;

    var
        ClientTypeManagement: Codeunit "Client Type Management";
        LanguageID: Integer;
        LocaleID: Integer;
        TimeZoneID: Text[180];
        VarCompany: Text;
        NewWorkdate: Date;
        ProfileID: Code[30];
        CurrUserProfile: code[50];
        RunningOnSaaS: Boolean;
        MyNotificationsLbl: Label 'Change when I receive notifications.';
        IsNotOnMobile: Boolean;
        CompanyDisplayName: Text[250];
        ProfileAppID: Guid;
        ProfileScope: Option System,Tenant;
        CompanySetUpInProgressMsg: Label 'Company %1 was just created, and we are still setting it up for you.\This may take up to 10 minutes, so take a short break before you begin to use %2.', Comment = '%1 - a company name,%2 - our product name';
        TrialStartMsg: Label 'We''re glad you''ve chosen to explore %1!\\Your session will restart to activate the new settings.', Comment = '%1 - our product name';
        IsCompanyChanged: Boolean;
        [InDataSet]
        RoleCenterOverviewEnabled: Boolean;
        ShowRoleCenterOverviewEnabledField: Boolean;
        MyLastLoginLbl: Label 'Your last sign in was on %1.', Comment = '%1 - a date time object';
}