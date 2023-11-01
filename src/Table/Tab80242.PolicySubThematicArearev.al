#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80242 "Policy Sub Thematic Area rev"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Thematic Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Code";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Introduction;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Purpose;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Scope;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Application;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Policy statement";Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Policy Guideline";Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Revision No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Thematic Code","Code","Revision No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

