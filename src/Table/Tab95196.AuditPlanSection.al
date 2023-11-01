#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95196 "Audit Plan Section"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                AuditDoc.Reset;
                AuditDoc.SetRange("Audit Plan ID","Document No.");
                if AuditDoc.FindSet then
                  "Document No.":= AuditDoc."Audit Plan ID";
            end;
        }
        field(2;"Section Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Overview,Objective,Approach';
            OptionMembers = " ",Overview,Objective,Approach;
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Section Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditDoc: Record "Audit Plan";
}

