#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85048 "Appointment Role"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Appointment Header";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Appointment Header";
        }
        field(3;"Staff  Role Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = "Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(5;Designation;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Recommended No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Actual Appointed No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

