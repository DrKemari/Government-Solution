#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85076 "Case Categories"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Block Period";DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Category;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Disciplinary Case,Verdict';
            OptionMembers = "Disciplinary Case",Verdict;
        }
        field(6;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Examination,CRM';
            OptionMembers = Examination,CRM;
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

