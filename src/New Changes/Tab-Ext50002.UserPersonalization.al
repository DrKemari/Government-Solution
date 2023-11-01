tableextension 54002 "User Settings" extends "User Settings"
{
    fields
    {

    }
    trigger OnModify()
    var
        UserRec: record "User Setup Permissions";
    begin
        // ProfileID := "Profile ID";

        if UserRec.get(database.UserId) then begin
            IF UserRec."Can Change Profile" = FALSE then
                ERROR('Please note that you dont have the rights to change your Profile!');
        end else begin
            ERROR('Please note that you dont have the rights to change your Profile!');
        end;
    end;
}
