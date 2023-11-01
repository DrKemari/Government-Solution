#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85059 "Center Re-Allocation Entries"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Re-Allocation Voucher No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Initial Center Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";

            trigger OnValidate()
            begin
                if ExamCenter.Get("Initial Center Code") then
                  "Initial Center Name":=ExamCenter.Name;
            end;
        }
        field(4;"Initial Center Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Total Student Booked";Integer)
        {
            CalcFormula = count("Exam Booking Entries" where ("Exam Center"=field("Initial Center Code")));
            FieldClass = FlowField;
        }
        field(6;"Last Modified Date Time";DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Re-Allocation Voucher No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ExamCenter: Record "Examination Centres";
}

