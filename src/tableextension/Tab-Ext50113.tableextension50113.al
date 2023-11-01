#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50113 "tableextension50113" extends "Fixed Asset" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Description 2"(Field 4)".

        field(50001;"FA G/L Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50002;"Reference Number";Text[30])
        {
        }
        field(50020;"Shortcut Dimension 3 Code";Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));

            trigger OnValidate()
            begin
                ///ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021;"Shortcut Dimension 4 Code";Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022;"Shortcut Dimension 5 Code";Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50051;"Asset Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Money Market",Property,Equity,Mortgage,"Unit Trust";
        }
        field(50052;"Interest Rate Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Fixed",Floating;
        }
        field(52000;Barcode;Code[20])
        {
        }
        field(52001;"Main Location";Code[100])
        {
        }
        field(52002;"Sub Location";Code[100])
        {
        }
        field(52003;Room;Code[50])
        {
        }
        field(52004;user;Code[100])
        {
        }
        field(52005;Dep;Code[150])
        {
        }
        field(55000;"Lease/Tenant Spaces";Integer)
        {
            CalcFormula = count("Service Item" where ("Property Code"=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(55001;"Total Size in Sq Feet";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(55002;"Land Registration Number";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(55003;Direction;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(55004;"Location Description";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(55005;"Land size (Acres)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 2:4;
        }
        field(55006;"Title Number";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(55007;"Survey Plan Number";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(55008;"Development Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Developed,Pending Development,Under construction,Under Renovation';
            OptionMembers = " ",Developed,"Pending Development","Under construction","Under Renovation";
        }
        field(55009;"File Reference Number";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(55010;"Ownership Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Freehold,Leasehold,Vesting Order';
            OptionMembers = " ",Freehold,Leasehold,"Vesting Order";
        }
        field(55011;"Enviromental Assesment Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pending,Compliant';
            OptionMembers = " ",Pending,Compliant;
        }
        field(55012;"Lease Contracts";Integer)
        {
            CalcFormula = count("Service Contract Header" where ("Property Code"=field("No.")));
            FieldClass = FlowField;
        }
        field(55013;Redeemed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(55014;"Date Redeemed";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(55015;"Fund Description";Text[100])
        {
            CalcFormula = lookup("Dimension Value".Name where (Code=field("Global Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(55016;"Custodian Description";Text[100])
        {
            CalcFormula = lookup("Dimension Value".Name where (Code=field("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(56002;"Fixed Asset Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Vehicle,Others;
        }
        field(57021;"Vote Item";Code[20])
        {
            CalcFormula = lookup("FA Posting Group"."Acquisition Cost Account" where (Code=field("FA Subclass Code")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "G/L Account";
        }
        field(57022;"Research Center";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Research Center?"=const(true),
                                                           "Operating Unit Type"=const("Department/Center"));
        }
        field(59002;test;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(59003;"Record Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Fixed Asset,Road Asset';
            OptionMembers = " ","Fixed Asset","Road Asset";
        }
        field(59004;"Master Road Link ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59005;"Original Road ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59006;"Original Road Class";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class";
        }
        field(59007;"Original Road No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59008;"Orignal Road Agency";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Agency";
        }
        field(59009;"Road Label";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(59010;"Gazetted  Road Class";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class";
        }
        field(59011;Government;Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Government Level";
        }
        field(59012;"Constituency ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency;
        }
        field(59013;"County ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1;
        }
        field(59014;"Region ID";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Region));
        }
        field(59015;"Start Reference Point";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59016;"Start Point Coordinates";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59017;"End Reference Point";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59018;"End Point Coordinates";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59019;"Total Road Length(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10:10;
        }
        field(59020;"Total Paved Length(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10:10;
        }
        field(59021;"Donated Asset";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59022;"Start Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59023;"End Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59024;"Link Length(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59025;"Surface Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59026;"Administrative Boundary";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(70000;"Asset Purchase Groups";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70001;"Purchase Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70002;"Tag No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70003;Supplier;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "No." = '' THEN BEGIN
          FASetup.GET;
          FASetup.TESTFIELD("Fixed Asset Nos.");
          NoSeriesMgt.InitSeries(FASetup."Fixed Asset Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;

        "Main Asset/Component" := "Main Asset/Component"::" ";
        "Component of Main Asset" := '';

        DimMgt.UpdateDefaultDim(
          DATABASE::"Fixed Asset","No.",
          "Global Dimension 1 Code","Global Dimension 2 Code");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        // IF "No." = '' THEN BEGIN
        //  FASetup.GET;
        //  FASetup.TESTFIELD("Fixed Asset Nos.");
        //  NoSeriesMgt.InitSeries(FASetup."Fixed Asset Nos.",xRec."No. Series",0D,"No.","No. Series");
        // END;

        // "Main Asset/Component" := "Main Asset/Component"::" ";
        // "Component of Main Asset" := '';
        //
        // DimMgt.UpdateDefaultDim(
        //  DATABASE::"Fixed Asset","No.",
        //  "Global Dimension 1 Code","Global Dimension 2 Code");
        */
    //end;
}

