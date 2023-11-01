#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69403 "Evacuation Event"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[440])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Hazard Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Hazard Type".Code where (Blocked=filter(false));
        }
        field(4;"No. of Planned Emerge Drills";Integer)
        {
            Description = 'No. of Planned Emerge Drills';
            Editable = false;
            FieldClass = Normal;
        }
        field(5;"No. of Conducted Emerge Drills";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Conducted Emerge Drills';
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
