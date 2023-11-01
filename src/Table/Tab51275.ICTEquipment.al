#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51275 "ICT Equipment"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Academic ICT Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Equipment Types" where (Category=field(Category));

            trigger OnValidate()
            begin
                ICTEquipmentTypes.Reset;
                ICTEquipmentTypes.SetRange(Code,"Academic ICT Type");
                if ICTEquipmentTypes.FindFirst then begin
                  "Academic Type Name":=ICTEquipmentTypes.Description;
                end
            end;
        }
        field(4;"Academic Type Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Number;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Type Available";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Category;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Item/Accessory,Connected to the LAN,Academic software';
            OptionMembers = "Item/Accessory","Connected to the LAN","Academic software";
        }
    }

    keys
    {
        key(Key1;"Application No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTEquipmentTypes: Record "ICT Equipment Types";
}

