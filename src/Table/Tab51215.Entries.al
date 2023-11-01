#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51215 "Entries"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Programme Accreditation No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Accreditation Description";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Institution No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Institution Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Evaluation No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Evaluation Verdict";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Minor Revamp","Re-Design","Major Revamp";
        }
        field(8;"Verdict Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Score;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Application Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Completeness Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Complete,Incomplete';
            OptionMembers = " ",Complete,Incomplete;
        }
        field(14;"Feedback Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Completeness Resubmission Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Payment Submission Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Payment Reference No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Çompleteness,Evaluation,Rejection';
            OptionMembers = "Çompleteness",Evaluation,Rejection;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

