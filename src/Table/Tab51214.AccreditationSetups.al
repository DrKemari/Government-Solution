#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51214 "Accreditation Setups"
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Resource;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(3;"Inst. Onboarding Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(4;"Inst Accreditation Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(5;"Customer Posting Group";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Posting Group".Code;
        }
        field(6;"Gen. Bus. Posting Group";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Business Posting Group".Code;
        }
        field(7;"Proposal Document Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(8;"Programme Accreditation Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(9;"Programme Accreditation Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Programme Evaluation Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(11;"Resources Expense Account";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(12;"Programme Inspection Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(13;"Data Sheet Path";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Completeness Voucher  Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(15;"Programme Closure Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(16;"Resource Allocation Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(17;"Resource Ammendment No.s";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(18;"HOD PA Emaill Address";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"DCS Accreditatio Email Address";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"HOD Finance Email Address";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Programme Version No.s";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(22;"Signatory ID";Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(23;"Peer Reviewers Portal Link";Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(24;"Self Evaluation No.";Code[30])
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

