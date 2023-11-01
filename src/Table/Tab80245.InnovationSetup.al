#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80245 "Innovation Setup"
{

    fields
    {
        field(1;"Primary Key";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Idea Invitation Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4;"Idea Capture Form Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5;"Inno Committee Voucher Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6;"Inno Evaluation Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(7;"Inno Reward Nos.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(8;"Default Inno Email";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"No. of Innov Invitations";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"No. of Innov Ideas";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"No. of Innov Comm Appointments";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"No. of Innov Evaluations";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"No. of Innovation Rewards";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"No. of Innovation Projects";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Inno Template Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(16;"Inno Eval Committe  Nos.";Code[30])
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

