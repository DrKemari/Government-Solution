#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51338 "Quality Audit Setup"
{

    fields
    {
        field(1;"Primary Key";Code[30])
        {
        }
        field(2;"Programme Audit Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(3;"Institution Audit Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(4;"Engagement Nos.";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(5;"Engagement Response Nos.";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(6;FilePath;Text[100])
        {
        }
        field(7;"Audit Plan Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(8;"SAR Response Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(9;Description;Text[250])
        {
        }
        field(10;"Organization Name";Text[100])
        {
        }
        field(11;"Default Chief Audit Executive";Text[100])
        {
        }
        field(12;"SAR Feedback Nos.";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(13;"Site Visit Nos.";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(14;"Audit Roadmap Nos.";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(15;"Audit Certificate Authorizer";Code[30])
        {
            TableRelation = "User Setup";
        }
        field(16;"Audit Requisition Nos.";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

