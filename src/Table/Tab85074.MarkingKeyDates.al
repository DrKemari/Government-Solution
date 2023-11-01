#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85074 "Marking Key Dates"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Marking,Packaging,Dispatch';
            OptionMembers = Marking,Packaging,Dispatch;
        }
        field(6;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Document No.",Examination)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

