table 54418 "User Setup Permissions"
{
    Caption = 'User Setup Permissions';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            trigger OnValidate()
            var
                UserRec: Record User;
            begin
                UserRec.Reset();
                UserRec.SetRange("User Name", "User ID");
                if UserRec.Find('-') then
                    "User Name" := UserRec."Full Name";
            end;
        }
        field(2; "Can Modify User Setup"; Boolean)
        {
            Caption = 'Can Modify User Setup';
        }
        field(3; "Can Change Profile"; Boolean)
        {
            Caption = 'Can Change Profile';
        }
        field(4; "User Name"; Text[250])
        {
            Caption = 'User Name';
        }
    }
    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
    }
}
