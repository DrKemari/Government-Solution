#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80261 "Innovation Reward Line"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Reward Voucher";
        }
        field(2;"Reward ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Reward Setup";
        }
        field(3;"Reward Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Cash Benefit,Non-Cash Benefit';
            OptionMembers = "Cash Benefit","Non-Cash Benefit";
        }
        field(4;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Payroll;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Earning Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Payroll=const(true)) EarningsX.Code;
        }
        field(7;"Amount (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Payroll Period";Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
    }

    keys
    {
        key(Key1;"Document No.","Reward ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

