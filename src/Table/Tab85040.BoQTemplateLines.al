#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85040 "BoQ Template Lines"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Boq Header";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Boq Template  Header";
        }
        field(3;Examination;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(4;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',G/L Account,Item,Charge(Item),Fixed Asset';
            OptionMembers = ,"G/L Account",Item,"Charge(Item)","Fixed Asset";
        }
        field(5;"No.";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=filter("G/L Account")) "G/L Account"
                            else if (Type=filter(Item)) Item
                            else if (Type=filter("Charge(Item)")) Item
                            else if (Type=filter("Fixed Asset")) "Fixed Asset";

            trigger OnValidate()
            begin
                  if Type=Type::"Charge(Item)" then
                  begin
                    if Item.Get("No.") then
                      Description:=Item.Description;
                  end;
                  if Type=Type::"G/L Account" then
                  begin
                    if GLAccount.Get("No.") then
                      Description:=GLAccount.Name;
                  end;

                  if Type=Type::Item then
                  begin
                    if Item.Get("No.") then
                      Description:=Item.Description;
                  end;

                   if Type=Type::"Fixed Asset" then
                  begin
                    if FixedAsset.Get("No.") then
                      Description:=FixedAsset.Description;
                  end;
            end;
        }
        field(6;Description;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Unit of Measure";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(8;"Amount Excl. VAT";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Shortcut Dimension 1 Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(10;"Shortcut Dimension 2 Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(11;Variant;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Dimension Set ID";Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Boq Header",Examination)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Item: Record Item;
        FixedAsset: Record "Fixed Asset";
        GLAccount: Record "G/L Account";
}

