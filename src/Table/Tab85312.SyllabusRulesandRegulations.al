#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85312 "Syllabus Rules and Regulations"
{

    fields
    {
        field(1;"Syllabus No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Rule Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Rule Type";

            trigger OnValidate()
            begin
                RuleType.Reset;
                RuleType.SetRange(Code,"Rule Type");
                if RuleType.FindFirst then begin
                  "Rule Name":=RuleType.Description;
                end
            end;
        }
        field(4;"Rule Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;Details;Text[2040])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Syllabus,Draft,Version';
            OptionMembers = Syllabus,Draft,Version;
        }
    }

    keys
    {
        key(Key1;"Syllabus No.","Entry No.","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RuleType: Record "Rule Type";
}

