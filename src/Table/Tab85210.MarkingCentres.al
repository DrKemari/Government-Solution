#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85210 "Marking Centres"
{
    DataCaptionFields = "Code";
    DrillDownPageID = "Marking Centres";
    LookupPageID = "Marking Centres";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
                TXT001: label 'You do not have sufficient rights to block this center,contact the system administrator';
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                UserSetup.SetRange("Examination Admin", true);
                if UserSetup.FindFirst then begin
                    if Blocked = true then begin
                        Status := Status::Inactive;
                        Modify(true);
                    end
                end else
                    Error(TXT001);
            end;
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(7; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(8; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(9; "Phone No. 2"; Text[30])
        {
            Caption = 'Phone No. 2';
            ExtendedDatatype = PhoneNo;
        }
        field(10; "Telex No."; Text[30])
        {
            Caption = 'Telex No.';
        }
        field(11; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(12; Contact; Text[100])
        {
            Caption = 'Contact';
        }
        field(13; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
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
        field(14; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
        }
        field(15; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(16; "Home Page"; Text[90])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(17; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(18; "Exam Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Regions";
        }
        field(19; "Exam Route"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Route";
        }
        field(20; "Exam Zone"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Zones";
        }
        field(21; "Maximum Capacity Per Session"; Integer)
        {
        }
        field(22; "Training Institution"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Customer Type" = filter(Funder));

            trigger OnValidate()
            begin
                if Customer.Get("Training Institution") then begin
                    Institution := Customer.Name;
                end
            end;
        }
        field(23; Institution; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Total Booked Students"; Integer)
        {
            CalcFormula = count("Center Booking Entries" where("Exam Center Code" = field(Code),
                                                                Status = filter(Allocated)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Disability Friendly"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Inactive';
            OptionMembers = Active,Inactive;
        }
        field(27; "Computer Based Friendly"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Exam Buffer Zone"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Neutral Buffer Zone"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "KISEB Centers"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Code No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(32; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Local,Foreign';
            OptionMembers = " ","Local",Foreign;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Name)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        TransferRoute: Record "Transfer Route";
        WhseEmployee: Record "Warehouse Employee";
        WorkCenter: Record "Work Center";
        StockkeepingUnit: Record "Stockkeeping Unit";
    begin
        CalendarManagement.DeleteCustomizedBaseCalendarData(CustomizedCalendarChange."source type"::Location, Code);
    end;

    trigger OnRename()
    begin
        CalendarManagement.RenameCustomizedBaseCalendarData(CustomizedCalendarChange."source type"::Location, Code, xRec.Code);
    end;

    var
        Bin: Record Bin;
        PostCode: Record "Post Code";
        WhseSetup: Record "Warehouse Setup";
        InvtSetup: Record "Inventory Setup";
        Location: Record Location;
        CustomizedCalendarChange: Record "Customized Calendar Change";
        Text000: label 'You cannot delete the %1 %2, because they contain items.';
        Text001: label 'You cannot delete the %1 %2, because one or more Warehouse Activity Lines exist for this %1.';
        Text002: label '%1 must be Yes, because the bins contain items.';
        Text003: label 'Cancelled.';
        Text004: label 'The total quantity of items in the warehouse is 0, but the Adjustment Bin contains a negative quantity and other bins contain a positive quantity.\';
        Text005: label 'Do you still want to delete this %1?';
        Text006: label 'You cannot change the %1 until the inventory stored in %2 %3 is 0.';
        Text007: label 'You have to delete all Adjustment Warehouse Journal Lines first before you can change the %1.';
        Text008: label '%1 must be %2, because one or more %3 exist.';
        Text009: label 'You cannot change %1 because there are one or more open ledger entries on this location.';
        Text010: label 'Checking item ledger entries for open entries...';
        Text011: label 'You cannot change the %1 to %2 until the inventory stored in this bin is 0.';
        Text012: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        Text013: label 'You cannot delete %1 because there are one or more ledger entries on this location.';
        Text014: label 'You cannot change %1 because one or more %2 exist.';
        CannotDeleteLocSKUExistErr: label 'You cannot delete %1 because one or more stockkeeping units exist at this location.', Comment = '%1: Field(Code)';
        CalendarManagement: Codeunit "Calendar Management";
        UnspecifiedLocationLbl: label '(Unspecified Location)';
        Customer: Record Customer;

    procedure DisplayMap()
    var
        MapPoint: Record "Online Map Setup";
        MapMgt: Codeunit "Online Map Management";
    begin
        if MapPoint.FindFirst then
            MapMgt.MakeSelection(Database::Location, GetPosition)
        else
            Message(Text012);
    end;
}
