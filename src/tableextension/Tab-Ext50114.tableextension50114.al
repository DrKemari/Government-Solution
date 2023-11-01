#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50114 "tableextension50114" extends "FA Setup" 
{
    fields
    {
        field(11;"Insurance Expiry Period";DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(70000;"Reclass. Voucher Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70001;"ReClass Journal Template";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name where (Type=const(Assets));
        }
        field(70002;"ReClass Journal Batch";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where ("Journal Template Name"=field("ReClass Journal Template"));
        }
        field(70003;"Staff Insurance Nos.";Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70004;"Insurance Claim  Nos.";Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70005;"Gate Pass Nos.";Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70006;"Property Reports  Nos.";Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70007;"Maintenance Request  Nos.";Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}

