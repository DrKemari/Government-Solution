#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51202 "AccTask Notifications Schedule"
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;"Task Code";Code[30])
        {
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Job No."));
        }
        field(3;"Job No.";Code[30])
        {
            TableRelation = Job;
        }
        field(4;"End Date";Date)
        {
        }
        field(5;Blocked;Boolean)
        {
        }
        field(6;"Start Date";Date)
        {
        }
        field(7;Frequency;DateFormula)
        {
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
    }
}

