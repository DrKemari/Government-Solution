#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80250 "Innovation Reward Setup"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Reward Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Cash Benefit,Non-Cash Benefit';
            OptionMembers = "Cash Benefit","Non-Cash Benefit";
        }
        field(3;Description;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Payroll;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Earning Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Payroll=const(true)) EarningsX.Code;
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

