#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51320 "SAR Template Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"Task Type";Option)
        {
            OptionCaption = 'Institution Quality Audit,Programme Quality Audit';
            OptionMembers = "Institution Quality Audit","Programme Quality Audit";
        }
        field(4;"No. of Sections";Integer)
        {
            CalcFormula = count("SAR  Template Line" where ("Header No."=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;"No. of Questions";Integer)
        {
            CalcFormula = count("SAR  Template Line" where ("Header No."=field(Code)));
            Editable = false;
            FieldClass = FlowField;
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

