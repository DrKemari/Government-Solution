#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51267 "Accreditation Seating Capacity"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                Courses.Reset;
                Courses.SetRange(Code,Examination);
                if Courses.FindFirst then  begin
                  "Exam Description":=Courses.Description;
                  end
            end;
        }
        field(3;"Exam Description";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"No. of Classrooms";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Estimated Seating Space";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Largest Class Seating capacity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Smallest ClassSeating capacity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Total Seating capacity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.",Examination)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Courses: Record Courses;
}

