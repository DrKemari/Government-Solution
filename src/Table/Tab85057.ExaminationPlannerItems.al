#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85057 "Examination Planner Items"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(2;Type;Option)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Resource,Item,G/L Account,Text';
            OptionMembers = Resource,Item,"G/L Account",Text;

            trigger OnValidate()
            var
                TempSalesLine: Record "Sales Line" temporary;
            begin
            end;
        }
        field(3;"No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = if (Type=filter("G/L Account")) "G/L Account"
                            else if (Type=filter(Resource)) Resource;
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                TempSalesLine: Record "Sales Line" temporary;
                FindRecordMgt: Codeunit "Find Record Management";
            begin
                if Type=Type::"G/L Account" then begin
                 if  GLAccount.Get("No.") then
                  Description:=GLAccount.Name;
                   GLAccount.TestField("Gen. Prod. Posting Group");
                end;
                if Type=Type::Item then begin
                  if Item.Get("No.") then begin
                    Item.TestField("Base Unit of Measure");
                    Item.TestField("Gen. Prod. Posting Group");
                    Description:=Item.Description;
                  "Unit of Measure":=Item."Base Unit of Measure";
                  end;
                  end;
                 if Type=Type::Resource then begin
                   if Resource.Get("No.") then begin
                     Resource.TestField("Base Unit of Measure");
                     Resource.TestField("Gen. Prod. Posting Group");
                     "Unit of Measure":=Resource."Base Unit of Measure";
                     Description:=Resource.Name;
                     end;
                   end;
            end;
        }
        field(4;"Location Code";Code[10])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location where ("Use As In-Transit"=const(false));

            trigger OnValidate()
            var
                Item: Record Item;
                IsHandled: Boolean;
            begin
            end;
        }
        field(5;"Posting Group";Code[20])
        {
            Caption = 'Posting Group';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = if (Type=const(Item)) "Inventory Posting Group";
        }
        field(6;Description;Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnValidate()
            var
                Item: Record Item;
                ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
                FindRecordMgt: Codeunit "Find Record Management";
                IdentityManagement: Codeunit "Identity Management";
                ReturnValue: Text[50];
                DescriptionIsNo: Boolean;
                DefaultCreate: Boolean;
                Confirmed: Boolean;
            begin
            end;
        }
        field(7;"Description 2";Text[50])
        {
            Caption = 'Description 2';
            DataClassification = ToBeClassified;
        }
        field(8;"Unit of Measure";Text[50])
        {
            Caption = 'Unit of Measure';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(9;Quantity;Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;

            trigger OnValidate()
            var
                Item: Record Item;
                ItemLedgEntry: Record "Item Ledger Entry";
            begin
            end;
        }
        field(10;"Unit Amount";Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Total Amount":="Unit Amount"*Quantity;
            end;
        }
        field(11;"Exam Planner No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Material Planner Header";
        }
        field(12;"Exam Planner Entry";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Total Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Exam Planner No.","Exam Planner Entry")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        Resource: Record Resource;
        Item: Record Item;
        FixedAsset: Record "Fixed Asset";
}

