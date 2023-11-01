#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51054 "StakeholderUsers"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Name;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Telephone No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Stakeholders TCode";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Type".Code where (Blocked=filter(false));

            trigger OnValidate()
            begin
                if stakeholderTypes.Get("Stakeholders TCode") then;
                "Stakeholder Type":=stakeholderTypes.Description;

            end;
        }
        field(6;Professional;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Password;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Stakeholder Type";Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        stakeholderTypes: Record "Stakeholder Type";
}

