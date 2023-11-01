#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85062 "Papers Grading System"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3;"Part";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level.Code where (Course=field(Examination));
        }
        field(4;Section;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section.Code where (Course=field(Examination),
                                                Part=field(Part));
        }
        field(5;Paper;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers.Code where (Course=field(Examination),
                                               Level=field(Part),
                                               Section=field(Section));
        }
        field(6;Category;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Grade Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grade Setup" where (Type=filter(Paper));

            trigger OnValidate()
            var
                GradeSetup: Record "Grade Setup";
            begin
                GradeSetup.Reset;
                GradeSetup.SetRange(Code,"Grade Code");
                if GradeSetup.FindFirst then begin
                  "Grade Description":=GradeSetup.Description;
                  end
            end;
        }
        field(8;"Grade Description";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"From Marks";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"To Marks";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Range;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;Failed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13;Blocked;Boolean)
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
    }

    fieldgroups
    {
    }
}

