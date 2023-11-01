#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70232 "FA Reclassification Header"
{

    fields
    {
        field(1;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            NotBlank = false;
        }
        field(2;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Account Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(5;"Account No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Account Type"=filter("Fixed Asset")) "Fixed Asset" where ("Asset Purchase Groups"=filter(true));

            trigger OnValidate()
            begin
                FixedAsset.Reset;
                FixedAsset.SetRange("No.","Account No.");
                if FixedAsset.FindFirst then begin
                  "Account Name":=FixedAsset.Description;
                  "FA SubClass":=FixedAsset."FA Subclass Code";
                  FADepreciationBook.Reset;
                  FADepreciationBook.SetRange("FA No.","Account No.");
                  if FADepreciationBook.FindFirst then begin
                    FADepreciationBook.CalcFields("Book Value");
                   "Total Amount":=FADepreciationBook."Book Value";
                 end;
                end
            end;
        }
        field(6;"Account Name";Text[70])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Posted By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Posted Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Total Amount";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Total ReClass Amount";Decimal)
        {
            CalcFormula = sum("FA Reclass Lines"."Reclass. Acq Amount" where ("Header No."=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(15;"FA SubClass";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        FASetup.Get();
          FASetup.TestField("Reclass. Voucher Nos.");
          if "No."='' then
          NoSeriesMgt.InitSeries(FASetup."Reclass. Voucher Nos.",xRec."No. Series",0D,"No.","No. Series");
        "Created By":=UserId;
    end;

    var
        FASetup: Record "FA Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FixedAsset: Record "Fixed Asset";
        FADepreciationBook: Record "FA Depreciation Book";
}

