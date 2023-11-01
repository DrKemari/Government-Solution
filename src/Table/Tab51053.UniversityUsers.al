#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51053 "UniversityUsers"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"User Name";Text[60])
        {
            DataClassification = ToBeClassified;
            Description = 'User Names shall by default be email addresses. However, for scalability, we maintain a separate authentication email just in case we use a different User name';
        }
        field(3;"Full Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Authentication Email";Text[80])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("Authentication Email");
            end;
        }
        field(5;"Mobile Phone No.";Text[250])
        {
            DataClassification = ToBeClassified;

            // trigger OnValidate()
            // var
            //     Char: dotnet Char;
            //     i: Integer;
            // begin
            //     for i := 1 to StrLen("Mobile Phone No.") do
            //       if Char.IsLetter("Mobile Phone No."[i]) then
            //         Error(PhoneNoCannotContainLettersErr);
            // end;
        }
        field(6;State;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Enabled,Disabled';
            OptionMembers = Enabled,Disabled;
        }
        field(7;"Change Password";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Record Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Vendor,Customer,Employee';
            OptionMembers = ,Vendor,Customer,Employee;
        }
        field(9;"Record ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Password Value";Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Disbale Read rights to this field on NAV. Have the field masked. For first time batch user creation, the RANDOM string generation function on NAV shall be used';
            ExtendedDatatype = None;
        }
        field(11;"Last Modified Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;UniversityCode;Code[50])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if universities.Get(UniversityCode) then begin
                "University Name":=universities.Name;
                end;
            end;
        }
        field(14;"University Name";Text[100])
        {
        }
        field(15;PasswordChanged;Boolean)
        {
        }
        field(16;Notified;Boolean)
        {
        }
        field(17;"Notification Date";DateTime)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Last Modified Date":=Today;
    end;

    var
        universities: Record Customer;
        PhoneNoCannotContainLettersErr: label 'The phone number cannot contain letters';
}

