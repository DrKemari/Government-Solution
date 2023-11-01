#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51266 "Application Question Nos."
{
    DrillDownPageID = "Question No. Setup";
    LookupPageID = "Question No. Setup";

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Chapter;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application Chapter";
        }
        field(3;"Question No.";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. Description";Text[1000])
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
        fieldgroup(DropDown;Chapter,"No. Description")
        {
        }
    }
}

