#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85068 "Examination Results Remarks"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Student Reg No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Part";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Section;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Paper;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Examination Sitting ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Remark;Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Exam Year";Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

