#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72007 "Road Agency"
{
    Caption = 'Road Agency';

    fields
    {
        field(1;"Code";Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2;Description;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Address;Text[100])
        {
            Caption = 'Address';
        }
        field(5;"Address 2";Text[50])
        {
            Caption = 'Address 2';
        }
        field(6;City;Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code"=const('')) "Post Code".City
                            else if ("Country/Region Code"=filter(<>'')) "Post Code".City where ("Country/Region Code"=field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                //PostCode.LookupPostCode(City,"Post Code",County,"Country/Region Code");
            end;

            trigger OnValidate()
            begin
                //PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(7;"Post Code";Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code"=const('')) "Post Code"
                            else if ("Country/Region Code"=filter(<>'')) "Post Code" where ("Country/Region Code"=field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            // trigger OnLookup()
            // begin
            //     PostCode.LookupPostCode("Address 2",City,"Current Agency?","Post Code");
            // end;

            // trigger OnValidate()
            // begin
            //     //PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            // end;
        }
        field(8;"Country/Region Code";Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                //PostCode.CheckClearPostCodeCityCounty(City,"Post Code",County,"Country/Region Code",xRec."Country/Region Code");
            end;
        }
        field(9;"Phone No.";Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(10;"Fax No.";Text[30])
        {
            Caption = 'Fax No.';
        }
        field(11;"Name 2";Text[50])
        {
            Caption = 'Name 2';
        }
        field(12;Contact;Text[100])
        {
            Caption = 'Contact';
        }
        field(13;"E-Mail";Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                //MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(14;"Home Page";Text[90])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(15;"Current Agency?";Boolean)
        {
            DataClassification = ToBeClassified;
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
        fieldgroup(Brick;"Code",Description,"Home Page")
        {
        }
    }

    trigger OnDelete()
    begin
        //DimMgt.DeleteDefaultDim(DATABASE::"Responsibility Center",Code);
    end;

    trigger OnRename()
    begin
        //DimMgt.RenameDefaultDim(DATABASE::"Responsibility Center",xRec.Code,Code);
    end;

    var
        PostCode: Record "Post Code";
        DimMgt: Codeunit DimensionManagement;

    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        // DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        // DimMgt.SaveDefaultDim(DATABASE::"Responsibility Center",Code,FieldNumber,ShortcutDimCode);
        // MODIFY;
    end;
}

