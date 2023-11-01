#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51322 "SAR Template Sub-Lines"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"SAR Template No.";Code[30])
        {
        }
        field(3;"Question ID";Integer)
        {
        }
        field(4;"Question Description";Text[250])
        {
        }
        field(5;"Question Type";Option)
        {
            OptionCaption = 'Open-Ended,Closed-Ended,Attachment,Date,Table';
            OptionMembers = "Open-Ended","Closed-Ended",Attachment,Date,"Table";
        }
        field(6;"Sub-Question ID";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"Line No.","SAR Template No.","Question Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

