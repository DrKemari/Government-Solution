#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69603 "Positions Responsibility"
{
    DrillDownPageID = "Position Responsibilities";
    LookupPageID = "Position Responsibilities";

    fields
    {
        field(1;"Position ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[700])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Category;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Responsibility,Job Dimensions';
            OptionMembers = Responsibility,"Job Dimensions";
        }
    }

    keys
    {
        key(Key1;"Position ID","Line No",Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

