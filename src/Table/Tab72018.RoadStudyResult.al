#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72018 "Road Study Result"
{
    DrillDownPageID = "Road Study Result";
    LookupPageID = "Road Study Result";

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Study ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Study Task ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Result Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Finding,Conclusion,Recommendation';
            OptionMembers = " ",Finding,Conclusion,Recommendation;
        }
        field(5;"Report Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Draft/Interim,Final';
            OptionMembers = " ","Draft/Interim",Final;
        }
        field(6;Description;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Study ID","Study Task ID","Result Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

