#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51318 "Audit Requisition Lines"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Audit Requisition No.";Code[30])
        {
        }
        field(3;"SAR Template No.";Code[30])
        {
        }
        field(4;"Question ID";Code[30])
        {
        }
        field(5;"Question Description";Text[250])
        {
        }
        field(6;"Question Type";Option)
        {
            OptionCaption = 'Open-Ended,Closed-Ended,Attachment,Date';
            OptionMembers = "Open-Ended","Closed-Ended",Attachment,Date;
        }
        field(7;"Section ID";Code[30])
        {
        }
        field(8;"Section Description";Text[100])
        {
        }
        field(9;Published;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Line No.","Audit Requisition No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

