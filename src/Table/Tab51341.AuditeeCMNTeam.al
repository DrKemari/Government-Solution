#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51341 "Auditee CMN Team"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Document No.";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Engagement ID";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Resource No.";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Resource No.") then begin
                  Resource.TestField("E-Mail");
                  Name:=Resource.Name;
                  "Phone No.":=Resource.Address;
                  "Job Title":=Resource."Job Title";
                  end;
            end;
        }
        field(5;Name;Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Engagement Role";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Roles";
        }
        field(7;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Job Title";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Phone No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Email;Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
}

