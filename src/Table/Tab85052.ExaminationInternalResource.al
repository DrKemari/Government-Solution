#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85052 "Examination Internal Resource"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Termination Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Role Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Resource No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Name;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Project Manager";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"User ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = "Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(10;"Termination Details";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Termination Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Project Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Project End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Appointment Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Termination Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Normal Staff Exit,Contract Expiry,Project Demobilization';
            OptionMembers = "Normal Staff Exit","Contract Expiry","Project Demobilization";
        }
        field(16;Designation;Text[30])
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

