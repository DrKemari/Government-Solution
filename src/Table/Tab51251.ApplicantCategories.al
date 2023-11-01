#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51251 "Applicant Categories"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Campus,Branch';
            OptionMembers = " ",Campus,Branch;
        }
        field(3;Name;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Address;Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(5;"Address 2";Text[50])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(6;City;Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnLookup()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.LookupPostCode(City,"Post Code",County,Country);
            end;

            trigger OnValidate()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.ValidateCity(City,"Post Code",County,Country,(CurrFieldNo <> 0) and GuiAllowed);
                //IF (Country/Region Code=CONST()) "Post Code".City ELSE IF (Country/Region Code=FILTER(<>'')) "Post Code".City WHERE (Country/Region Code=FIELD(Country/Region Code))
            end;
        }
        field(7;Contact;Text[100])
        {
            Caption = 'Contact';
            DataClassification = ToBeClassified;

            trigger OnLookup()
            var
                ContactBusinessRelation: Record "Contact Business Relation";
                Cont: Record Contact;
                TempCust: Record Customer temporary;
            begin
            end;
        }
        field(8;"Phone No.";Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;

            // trigger OnValidate()
            // var
            //     Char: dotnet Char;
            //     i: Integer;
            //     PhoneNoCannotContainLettersErr: label 'Phone Cannot contain Letters';
            // begin
            //     for i := 1 to StrLen("Phone No.") do
            //       if Char.IsLetter("Phone No."[i]) then
            //         Error(PhoneNoCannotContainLettersErr);
            // end;
        }
        field(9;Country;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Post Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;County;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

