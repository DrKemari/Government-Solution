#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70233 "FA Reclass Lines"
{

    fields
    {
        field(1;"Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Account Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(4;"Account No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Account Type"=filter("Fixed Asset")) "Fixed Asset" where ("Asset Purchase Groups"=filter(false),
                                                                                           "FA Subclass Code"=field("FA SubClass"));

            trigger OnValidate()
            begin
                FixedAsset.Reset;
                FixedAsset.SetRange("No.","Account No.");
                if FixedAsset.FindFirst then begin
                  "Account Name":=FixedAsset.Description;
                  "Posting Group":=FixedAsset."FA Posting Group";
                end
            end;
        }
        field(5;"Account Name";Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Reclass. Acq Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Reclass. Acq Amount %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Depreciation Book";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Posting Group";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "FA Posting Group";
        }
        field(10;"FA SubClass";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Header No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        // FAReclassificationHeader.RESET;
        // FAReclassificationHeader.SETRANGE("No.","Header No.");
        // IF FAReclassificationHeader.FIND ('-') THEN BEGIN
        //    "FA SubClass":=FAReclassificationHeader."FA SubClass";
        //   MODIFY;
        // END;
    end;

    var
        FixedAsset: Record "Fixed Asset";
        FAReclassificationHeader: Record "FA Reclassification Header";
}

