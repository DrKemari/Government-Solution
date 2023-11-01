#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85045 "Staff Template Line"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Staff Template ID";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staffing Template";
        }
        field(3;"Staff Role Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staff Role Codes";
        }
        field(4;Examination;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(5;"Team Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(6;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = "Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(7;Desciption;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Min. No. of Recommended Staff";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Staff Template ID",Examination)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

