#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69445 "Safety Permit Completion Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Safe Work Permit Application","Safe Work Completion Report";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Safe Work Permit Header"."Document No.";
        }
        field(3;"Restricted Activity ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Safe Work Permit Header"."Permit Type" where ("Document No."=field("Document No."));
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Compliance Requirement";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Mandatory,Optional;
        }
        field(7;"Severity Level for Violation";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Incident Severity Level".Code;
        }
        field(8;"Compliance Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Compliant,"Non-Compliant","Not Applicable";
        }
        field(9;"Additional Compliance Notes";Text[2048])
        {
            DataClassification = ToBeClassified;
            Description = 'Additional Compliance Notes/Evidence/Explanations';
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Restricted Activity ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

