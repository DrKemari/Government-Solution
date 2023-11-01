#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69032 "Parent Company"
{
    DrillDownPageID = "Parent Companies";
    LookupPageID = "Parent Companies";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Payment,Deduction';
            OptionMembers = Payment,Deduction;
        }
        field(4;"Insurance Code";Boolean)
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

