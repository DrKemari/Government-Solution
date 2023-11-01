#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69063 "Benefits Matrix Setup"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Benefit Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefits Types";

            trigger OnValidate()
            begin
                if BenefitsTypes.Get("Benefit Type") then
                  "Benefit Description":=BenefitsTypes.Description;
            end;
        }
        field(3;"Benefit Description";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Beneficiary Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Spouse,Primary Beneficiary,Child,Biological Parent';
            OptionMembers = Spouse,"Primary Beneficiary",Child,"Biological Parent";
        }
        field(5;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Benefit Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Benefit Description","Beneficiary Category")
        {
        }
    }

    var
        BenefitsTypes: Record "Benefits Types";
}

