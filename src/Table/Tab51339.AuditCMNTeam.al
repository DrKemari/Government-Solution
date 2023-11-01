#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51339 "Audit CMN Team"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Audit Commencement Notice,Auditee Notice Response,Audit Entrace Meeting,Pre-Audit Survey Invitation,Pre-Audit Survey Response,Audit Plan';
            OptionMembers = " ","Audit Commencement Notice","Auditee Notice Response","Audit Entrace Meeting","Pre-Audit Survey Invitation","Pre-Audit Survey Response","Audit Plan";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Audit Requisition Header".Code;
        }
        field(3;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Resource No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),Blocked=filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Resource No.") then begin
              //    Resource.TestField(e);
                  Name:=Resource.Name;
                  //"Phone No.":=Resource.te;
                  Email:=Resource."E-Mail";
                  "Job Title":=AuditeeRoles.Description;
                  end;
            end;
        }
        field(5;Name;Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Engagement Role";Code[20])
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
        field(10;"Phone No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Email;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(12;Approved;Boolean)
        {
        }
        field(13;"Reason for Rejection";Text[250])
        {
        }
        field(14;"Line No";Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
        AuditeeRoles: Record "Audit Roles";
}

