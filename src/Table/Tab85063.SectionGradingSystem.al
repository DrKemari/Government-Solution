#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85063 "Section Grading System"
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
            TableRelation = Section.Code where (Part=field(Part),
                                                Course=field(Examination));
        }
        field(5;"Total No. of Papers";Integer)
        {
            CalcFormula = count(Papers where (Section=field(Section),
                                              Level=field(Part),
                                              Course=field(Examination)));
            FieldClass = FlowField;
        }
        field(6;"No. of Papers Qualified";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Grade Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grade Setup" where (Type=filter(Section));

            trigger OnValidate()
            var
                GradeSetup: Record "Grade Setup";
            begin
                GradeSetup.Reset;
                GradeSetup.SetRange(Code,"Grade Code");
                if GradeSetup.FindFirst then begin
                  Description:=GradeSetup.Description;
                  end
            end;
        }
        field(8;Description;Text[50])
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

