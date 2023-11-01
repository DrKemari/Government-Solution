#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56096 "Court Houses"
{
    DataCaptionFields = "Code",Name,"Name 2",Address;
    DrillDownPageID = "Court Houses";
    LookupPageID = "Court Houses";

    fields
    {
        field(1;"Code";Code[10])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(2;Name;Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3;"Name 2";Text[50])
        {
            Caption = 'Name 2';
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
            TableRelation = if ("Country/Region Code"=const('')) "Post Code".City
                            else if ("Country/Region Code"=filter(<>'')) "Post Code".City where ("Country/Region Code"=field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(7;"Phone No.";Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(8;"Phone No. 2";Text[30])
        {
            Caption = 'Phone No. 2';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(9;"Telex No.";Text[30])
        {
            Caption = 'Telex No.';
            DataClassification = ToBeClassified;
        }
        field(10;"Fax No.";Text[30])
        {
            Caption = 'Fax No.';
            DataClassification = ToBeClassified;
        }
        field(11;"Post Code";Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code"=const('')) "Post Code"
                            else if ("Country/Region Code"=filter(<>'')) "Post Code" where ("Country/Region Code"=field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(12;County;Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(13;"E-Mail";Text[80])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(14;"Home Page";Text[90])
        {
            Caption = 'Home Page';
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(15;"Country/Region Code";Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(16;"Court Judge";Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Judges";
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        MailManagement: Codeunit "Mail Management";
}

