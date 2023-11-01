#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85012 "Withdrawal Reasons"
{
    DrillDownPageID = "Withdrawal Reasons";
    LookupPageID = "Withdrawal Reasons";

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Reason Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Defferement,Withdrawal';
            OptionMembers = Defferement,Withdrawal;
        }
        field(3;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"% of Refund";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Administrative %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. of Entries";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Blocked;Boolean)
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

