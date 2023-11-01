page 50689 "User Personalization Card1"
{
    Caption = 'User Personalization Card';
    DataCaptionExpression = Rec."User ID";
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "User Personalization";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User ID';
                    DrillDown = false;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of a user who is using Database Server Authentication to log on to Business Central.';
                    Visible = false;
                    trigger OnAssistEdit()
                    var
                        UserPersonalization: Record "User Personalization";
                        User: Record User;
                        UserSelection: Codeunit "User Selection";
                    begin
                        if not UserSelection.Open(User) then
                            exit;

                        if (User."User Security ID" <> Rec."User SID") and not IsNullGuid(User."User Security ID") then begin
                            if UserPersonalization.Get(User."User Security ID") then begin
                                UserPersonalization.CalcFields("User ID");
                                Error(Text000, Rec.TableCaption, UserPersonalization."User ID");
                            end;

                            Rec.Validate("User SID", User."User Security ID");
                            Rec.CalcFields("User ID");

                            CurrPage.Update;
                        end;
                    end;
                }
                field(ProfileID; ProfileID)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Profile ID';
                    DrillDown = false;
                    Editable = false;
                    LookupPageID = "Profile List";
                    ToolTip = 'Specifies the ID of the profile that is associated with the current user.';

                    trigger OnAssistEdit()
                    var
                        AllProfileTable: Record "All Profile";
                    begin
                        if PAGE.RunModal(PAGE::"Profile List", AllProfileTable) = ACTION::LookupOK then begin
                            Rec."Profile ID" := AllProfileTable."Profile ID";
                            Rec."App ID" := AllProfileTable."App ID";
                            Rec.Scope := AllProfileTable.Scope;
                            ProfileID := Rec."Profile ID";
                            SetRestartRequiredIfChangeIsForCurrentUser;
                        end
                    end;
                }
                field("Language ID"; Rec."Language ID")
                {
                    ApplicationArea = Basic, Suite;
                    BlankZero = true;
                    Caption = 'Language ID';
                    ToolTip = 'Specifies the ID of the language that Microsoft Windows is set up to run for the selected user.';
                    Visible = false;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Language: Codeunit Language;
                    begin
                        Language.LookupApplicationLanguageId(Rec."Language ID");

                        if Rec."Language ID" <> xRec."Language ID" then begin
                            Rec.Validate("Language ID", Rec."Language ID");
                            SetRestartRequiredIfChangeIsForCurrentUser;
                        end;
                    end;

                    trigger OnValidate()
                    var
                        Language: Codeunit Language;
                    begin
                        Language.ValidateApplicationLanguageId(Rec."Language ID");
                        SetRestartRequiredIfChangeIsForCurrentUser;
                    end;
                }
                field("Locale ID"; Rec."Locale ID")
                {
                    ApplicationArea = Basic, Suite;
                    BlankZero = true;
                    Caption = 'Locale ID';
                    Importance = Additional;
                    TableRelation = "Windows Language"."Language ID";
                    ToolTip = 'Specifies the ID of the locale that Microsoft Windows is set up to run for the selected user.';
                    Visible = false;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Language: Codeunit Language;
                    begin
                        Language.LookupWindowsLanguageId(Rec."Locale ID");

                        if Rec."Locale ID" <> xRec."Locale ID" then begin
                            Rec.Validate("Locale ID", Rec."Locale ID");
                            SetRestartRequiredIfChangeIsForCurrentUser;
                        end;
                    end;

                    trigger OnValidate()
                    var
                        Language: Codeunit Language;
                    begin
                        Language.ValidateWindowsLanguageId(Rec."Locale ID");
                        SetRestartRequiredIfChangeIsForCurrentUser;
                    end;
                }
                field("Time Zone"; Rec."Time Zone")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Time Zone';
                    Importance = Additional;
                    ToolTip = 'Specifies the time zone that Microsoft Windows is set up to run for the selected user.';
                    Visible = false;
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // exit(ConfPersMgt.LookupTimeZone(Text))
                    end;

                    trigger OnValidate()
                    begin
                        // ConfPersMgt.ValidateTimeZone("Time Zone");
                        SetRestartRequiredIfChangeIsForCurrentUser;
                    end;
                }
                field(Company; Rec.Company)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Company';
                    ToolTip = 'Specifies the company that is associated with the user.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("User &Personalization")
            {
                Caption = 'User &Personalization';
                Image = Grid;
                Visible = false;
                action(List)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'List';
                    Image = OpportunitiesList;
                    ToolTip = 'View or edit a list of all users who have personalized their user interface by customizing one or more pages.';

                    trigger OnAction()
                    var
                        UserPersList: Page "User Settings List";
                    begin
                        UserPersList.LookupMode := true;
                        UserPersList.SetRecord(Rec);
                        if UserPersList.RunModal = ACTION::LookupOK then
                            UserPersList.GetRecord(Rec);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                Visible = false;
                action("C&lear Personalized Pages")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'C&lear Personalized Pages';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Delete all personalizations made by the specified user across display targets.';
                    Visible = false;
                    trigger OnAction()
                    begin
                        ConfPersMgt.ClearUserPersonalization(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        UserRec: record "User Setup";
    begin
        ProfileID := Rec."Profile ID";

        if UserRec.get(database.UserId) then begin
            IF UserRec."Can Change Profile" = FALSE then
                ERROR('Please note that you dont have the rights to change your Profile!');
        end else begin
            ERROR('Please note that you dont have the rights to change your Profile!');
        end;
    end;


    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField("User SID");
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Rec.TestField("User SID");
    end;

    trigger OnOpenPage()
    begin
        HideExternalUsers;
        Rec.setfilter("User ID", Database.UserId);
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if RequiresRestart and (CloseAction <> ACTION::Cancel) then
            RestartSession;
    end;

    var
        ConfPersMgt: Codeunit "Conf./Personalization Mgt.";
        Text000: Label '%1 %2 already exists.', Comment = 'User Personalization User1 already exists.';
        AccountantTxt: Label 'ACCOUNTANT', Comment = 'Please translate all caps';
        ProjectManagerTxt: Label 'PROJECT MANAGER', Comment = 'Please translate all caps';
        TeamMemberTxt: Label 'TEAM MEMBER', Comment = 'Please translate all caps';
        ExperienceMsg: Label 'You are changing to a Role Center that has more functionality. To display the full functionality for this role, your Experience setting will be set to Essential.';
        ProfileID: Code[30];
        RequiresRestart: Boolean;

    local procedure HideExternalUsers()
    var
        EnvironmentInfo: Codeunit "Environment Information";
        OriginalFilterGroup: Integer;
    begin
        if not EnvironmentInfo.IsSaaS then
            exit;

        OriginalFilterGroup := Rec.FilterGroup;
        Rec.FilterGroup := 2;
        Rec.CalcFields("License Type");
        Rec.SetFilter("License Type", '<>%1', Rec."License Type"::"External User");
        Rec.FilterGroup := OriginalFilterGroup;
    end;

    procedure SetExperienceToEssential(SelectedProfileID: Text[30])
    var
        ExperienceTierSetup: Record "Experience Tier Setup";
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
        CompanyInformationMgt: Codeunit "Company Information Mgt.";
    begin
        if CompanyInformationMgt.IsDemoCompany then
            if ExperienceTierSetup.Get(CompanyName) then
                if ExperienceTierSetup.Basic then
                    if (SelectedProfileID = TeamMemberTxt) or
                       (SelectedProfileID = AccountantTxt) or
                       (SelectedProfileID = ProjectManagerTxt)
                    then begin
                        Message(ExperienceMsg);
                        ApplicationAreaMgmtFacade.SaveExperienceTierCurrentCompany(ExperienceTierSetup.FieldCaption(Essential));
                    end;
    end;

    local procedure SetRestartRequiredIfChangeIsForCurrentUser()
    begin
        if ((UserSecurityId = Rec."User SID") or IsNullGuid(Rec."User SID")) and (CompanyName = Rec.Company) then
            RequiresRestart := true;
    end;

    local procedure RestartSession()
    var
        UserPersonalization: Record "User Personalization";
        CurrentUserSessionSettings: SessionSettings;
        ProfileScope: Option System,Tenant;
    begin
        UserPersonalization.Get(UserSecurityId);

        CurrentUserSessionSettings.Init();
        CurrentUserSessionSettings.ProfileId := UserPersonalization."Profile ID";
        CurrentUserSessionSettings.ProfileAppId := UserPersonalization."App ID";
        CurrentUserSessionSettings.ProfileSystemScope := UserPersonalization.Scope = ProfileScope::System;
        CurrentUserSessionSettings.LanguageId := UserPersonalization."Language ID";
        CurrentUserSessionSettings.LocaleId := UserPersonalization."Locale ID";
        CurrentUserSessionSettings.Timezone := UserPersonalization."Time Zone";

        CurrentUserSessionSettings.RequestSessionUpdate(true);
    end;
}
