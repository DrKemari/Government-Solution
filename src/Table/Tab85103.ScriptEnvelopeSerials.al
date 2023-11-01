#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85103 "Script Envelope Serials"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Paper Code";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
            end;
        }
        field(5;"Envelope Serial No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. of Scripts";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Marker Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Marker Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Allocated;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Dispatch Header No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Entry No","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

