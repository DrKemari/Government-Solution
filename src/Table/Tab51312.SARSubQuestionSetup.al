#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51312 "SAR Sub-Question Setup"
{
    DrillDownPageID = "Application Categories";
    LookupPageID = "Application Categories";

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;"Question Type";Option)
        {
            OptionCaption = 'Open-Ended,Closed-Ended,Attachment,Date,Table';
            OptionMembers = "Open-Ended","Closed-Ended",Attachment,Date,"Table";
        }
        field(3;Description;Text[200])
        {
        }
        field(4;"Question Code";Code[30])
        {
            TableRelation = "SAR Question Setup";
        }
    }

    keys
    {
        key(Key1;"Code","Question Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

