#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51252 "Acc Administrative Staff"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Category;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Division,Department';
            OptionMembers = " ",Division,Department;
        }
        field(3;"No. of Staff";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Highest Academic Qualification";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Qualification;
        }
        field(5;"Lowest Academic Qualification";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Qualification;
        }
        field(6;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

