#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85030 "Bulk Processing Header"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            NotBlank = false;

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::Registration then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Bulk Application Nos.");
                end else
                    if "Document Type" = "document type"::Booking then begin
                        if "No." <> xRec."No." then
                            NoSeriesMgt.TestManual(ExaminationSetup."Bulk Examination Booking Nos.");
                    end;
            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; "Document Type"; Option)
        {
            OptionMembers = Registration,Booking,Exemption,Withdrawal,Defferment;
        }
        field(4; "Institution No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                Cust.Reset;
                Cust.SetRange("No.", "Institution No.");
                if Cust.FindSet then begin
                    "Institution Name" := Cust.Name;
                    Address := Cust.Address;
                    "Post Code" := Cust."Post Code";
                    City := Cust.City;
                    "Currency Code" := Cust."Currency Code";
                    County := Cust.County;
                    "Phone No." := Cust."Phone No.";
                    Email := Cust."E-Mail";

                end
            end;
        }
        field(5; "Institution Name"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(10; "Currency Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(11; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(12; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(13; City; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(14; "Country/Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(15; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;

            // trigger OnValidate()
            // var
            //     Char: dotnet Char;
            //     i: Integer;
            // begin
            //     for i := 1 to StrLen("Phone No.") do
            //       if Char.IsLetter("Phone No."[i]) then
            //         Error(PhoneNoCannotContainLettersErr);
            // end;
        }
        field(16; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(17; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(18; Email; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; Created; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21; Portal; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Bulk Processing Lines".Amount where("Bulk Header No." = field("No.")));
            FieldClass = FlowField;
        }
        field(23; "Work Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Resource Price".Code where("Currency Code" = field("Currency Code"));

            trigger OnValidate()
            begin
                WorkType.Reset;
                WorkType.SetRange(Code, "Work Type");
                if WorkType.FindSet then begin
                    "Type Code" := WorkType."Work Type Code";
                end;
            end;
        }
        field(24; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Type Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Registration Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Registration Receipt No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Booking Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Booking Receipt No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Excemption Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Excemption Receipt No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Registration Invoice No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Booking Invoice No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Application Invoice"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Application Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Application Receipt"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(40; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ExaminationSetup.Get;
        if "Document Type" = "document type"::Registration then begin
            ExaminationSetup.TestField("Bulk Application Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Bulk Application Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Document Type" = "document type"::Booking then begin
            ExaminationSetup.TestField("Bulk Examination Booking Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Bulk Examination Booking Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        Date := Today;
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
    end;

    var
        Cust: Record Customer;
        PostCode: Record "Post Code";
        PhoneNoCannotContainLettersErr: label 'The phone cannot contain letters';
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        WorkType: Record "Resource Price";
}

