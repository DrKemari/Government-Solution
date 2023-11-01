#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55022 "Board minutes"
{

    fields
    {
        field(1;"Register ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Meetings";
        }
        field(2;"Agenda Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Agenda";
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Item Discussed";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Summary Notes";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Referenced Section of Tender";Text[250])
        {
            Caption = 'Referenced Section of Tender Document';
            DataClassification = ToBeClassified;
            Description = 'Referenced Section of Tender Document';
        }
        field(7;"Referenced Clause of Tender";Text[100])
        {
            Caption = 'Referenced Clause of Tender Document';
            DataClassification = ToBeClassified;
            Description = 'Referenced Clause of Tender Document';
        }
        field(8;"Board Meeting";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"E-board Agenda";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Register ID","Agenda Code","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

