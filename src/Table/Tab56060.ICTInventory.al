#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56060 "ICT Inventory"
{
    DrillDownPageID = "ICT Inventory List";
    LookupPageID = "ICT Inventory List";

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Sub-Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Item,Fixed Asset,Resource';
            OptionMembers = Item,"Fixed Asset",Resource;
        }
        field(4; "Sub Type No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Sub-Type" = const("Fixed Asset")) "Fixed Asset"."No."
            else
            if ("Sub-Type" = const(Item)) Item."No."
            else
            if ("Sub-Type" = const(Resource)) Resource."No.";

            trigger OnValidate()
            begin
                if "Sub-Type" = "sub-type"::"Fixed Asset" then begin
                    FixedAssets.Reset;
                    FixedAssets.SetRange("No.", "Sub Type No.");
                    if FixedAssets.FindSet then
                        "Sub Type Description" := FixedAssets.Description;
                    Description := FixedAssets.Description;
                    "Location Code" := FixedAssets."Location Code";
                    "Serial No." := FixedAssets."Serial No.";
                    "Warranty Date" := FixedAssets."Warranty Date";
                    "Maintenance Vendor No." := FixedAssets."Maintenance Vendor No.";
                    "Under Maintenance" := FixedAssets."Under Maintenance";
                    "FA Class Code" := FixedAssets."FA Class Code";
                    "FA Subclass Code" := FixedAssets."FA Subclass Code";
                    //Insured:=FixedAssets.Insured;
                    "Current Assigned Division/Unit" := FixedAssets."Research Center";
                    "Current Assigned Employee" := FixedAssets."Responsible Employee";
                    "Purchase date" := FixedAssets."Purchase Date";
                    Supplier := FixedAssets.Supplier;
                    "Tag No" := FixedAssets."Tag No";
                    //FixedAssets.CALCFIELDS()

                    //"Acquisition Cost":=FixedAssets.

                end;
                if "Sub-Type" = "sub-type"::Item then begin
                    Items.Reset;
                    Items.SetRange("No.", "Sub Type No.");
                    if Items.FindSet then
                        "Sub Type Description" := Items.Description;
                    Description := Items.Description;
                end;
                if "Sub-Type" = "sub-type"::Resource then begin
                    Resources.Reset;
                    Resources.SetRange("No.", "Sub Type No.");
                    if Resources.FindSet then
                        "Sub Type Description" := Resources.Name;
                    Description := Resources.Name;
                end;
            end;
        }
        field(5; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(6; "ICT Asset Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Asset Category".Code;

            trigger OnValidate()
            begin
                ICTAssetCategory.Reset;
                ICTAssetCategory.SetRange(Code, "ICT Asset Category");
                if ICTAssetCategory.FindSet then
                    "FA Class Code" := ICTAssetCategory."FA Class Code";
                "FA Subclass Code" := ICTAssetCategory."FA SubClass";
            end;
        }
        field(7; "Serial No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Warranty Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Maintenance Vendor No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(10; "Under Maintenance"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Sub Type Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "FA Class Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "FA Class".Code;
        }
        field(13; "FA Subclass Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "FA Subclass".Code where("FA Class Code" = field("FA Class Code"));
        }
        field(14; Insured; Boolean)
        {
            CalcFormula = exist("Ins. Coverage Ledger Entry" where("FA No." = field("Sub Type No."),
                                                                    "Disposed FA" = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Current Assigned Employee"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Current Assigned Employee");
                if Employee.FindSet then begin
                    "Current Assigned Division/Unit" := Employee."Department Code";
                end;
            end;
        }
        field(16; "Current Assigned Division/Unit"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));
        }
        field(17; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Acquisition Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "No Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "No. of Issues Raised"; Integer)
        {
            CalcFormula = count("ICT Helpdesk" where("ICT Inventory" = field(Code),
                                                      Status = filter(<> Open)));
            FieldClass = FlowField;
        }
        field(21; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Has Expiry Date" = false then
                    Error('Ensure Track Expiry Date field has been Ticked');
            end;
        }
        field(22; "Has Expiry Date"; Boolean)
        {
            Caption = 'Track Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(23; "Software Product key"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Total number of license"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26; Link; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Tag No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "IP address"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Make/model"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Disposed date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Manufactured date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Last Maintenance Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33; Manufacturer; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "ICT Asset subcategory"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Asset subcategory".Code;
        }
        field(35; Brand; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Brands".Code;
        }
        field(36; "Purchase date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(37; Status; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Inventory Status".Code;

            trigger OnValidate()
            begin
                if Confirm('Are You Sure to change the status') = true then
                    ICTInventoryStatusEntry.Init;
                ICTInventoryStatusEntry."ICT Inventory No" := Code;
                ICTInventoryStatusEntry.Status := Status;
                ICTInventoryStatusEntry."Conducted By" := UserId;
                ICTInventoryStatusEntry.Date := Today;
                ICTInventoryStatusEntry.Time := Time;
                // AnnualReportingCodes.RESET;
                // AnnualReportingCodes.SETRANGE("Current Year",TRUE);
                // IF AnnualReportingCodes.FINDFIRST THEN BEGIN
                //  FYcode:=AnnualReportingCodes.Code;
                //  ENDDAT:=AnnualReportingCodes."Reporting End Date";
                //  SATAR:=AnnualReportingCodes."Reporting Start Date";
                //  END;
                ICTInventoryStatusEntry.Insert(true);
            end;
        }
        field(38; "Next service date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(39; Supplier; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(40; Condition; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Good,Faulty,Retired';
            OptionMembers = Good,Faulty,Retired;
        }
        field(41; Comment; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Current Assigned Employee")
        {
        }
        key(Key3; "Current Assigned Division/Unit")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ICT.Get;
            ICT.TestField(ICT."ICT Inventory Nos");
            NoSeriesMgt.InitSeries(ICT."ICT Inventory Nos", xRec."No Series", 0D, Code, "No Series");
        end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ICT: Record "ICT Helpdesk Global Parameters";
        Resources: Record Resource;
        FixedAssets: Record "Fixed Asset";
        Items: Record Item;
        ICTAssetCategory: Record "ICT Asset Category";
        Employee: Record Employee;
        ICTInventoryStatusEntry: Record "ICT Inventory Status Entry";
        AnnualReportingCodes: Record "Annual Reporting Codes";
}

