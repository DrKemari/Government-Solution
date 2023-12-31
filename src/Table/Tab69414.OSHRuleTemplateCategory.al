#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69414 "OSH Rule Template Category"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "OSH Rule Template"."Template ID";
        }
        field(2;"Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. of Rules & Regulations";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

