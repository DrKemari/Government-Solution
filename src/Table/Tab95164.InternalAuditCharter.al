#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95164 "Internal Audit Charter"
{
    DrillDownPageID = "Internal Audit Charters";
    LookupPageID = "Internal Audit Charters";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "External Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Overview; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "CAE ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Chief Audit Executive (CAE) ID\';
            TableRelation = "Risk & Audit Officer";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                AuditOfficers.Reset;
                AuditOfficers.SetRange("Employee No.", "CAE ID");
                if AuditOfficers.FindSet then begin
                    "CAE ID" := AuditOfficers."Employee No.";
                    "CAE Name" := AuditOfficers."Employee Name";
                end;
            end;
        }
        field(7; "CAE Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Risk & Audit Officer";
        }
        field(8; "CAE Directly Reports-To"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Role".Code where(Blocked = filter(false));
        }
        field(9; "CAE Indirectly Reports-To"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Role".Code where(Blocked = filter(false));
        }
        field(10; "Approved By"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false));
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CompanyJobs: Record "ManPower Planning Lines";
        AuditOfficers: Record "Risk & Audit Officer";
}

