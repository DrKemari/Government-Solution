#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85092 "Student Renewal Entries"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Course Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3;"Document  No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Renewal Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Stud. Cust No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Stud. Reg. No";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                ExaminationAccount: Record "Examination Account";
            begin
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.","Stud. Reg. No");
                if ExaminationAccount.FindFirst then begin
                  "Stud. Cust No.":=ExaminationAccount."Student Cust No.";
                end
            end;
        }
        field(8;"Last Modified Date Time";DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;Year;Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
        key(Key2;"Course Id","Stud. Reg. No","Stud. Cust No.")
        {
        }
    }

    fieldgroups
    {
    }
}

