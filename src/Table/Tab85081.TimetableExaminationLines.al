#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85081 "Timetable Examination Lines"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Timetable Planner Header";
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Examination;Code[150])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                Courses.Reset;
                Courses.SetRange(Code,Examination);
                if Courses.FindFirst then begin
                  Description:=Courses.Description;
                  end
            end;
        }
        field(4;Description;Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Planned Papers";Integer)
        {
            CalcFormula = count("Timetable Planner Lines" where (Examination=field(Examination),
                                                                 Code=field(Code)));
            Caption = 'Planned Papers';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;"Total Capacity";Integer)
        {
            CalcFormula = count("Exam Booking Entries" where (Examination=field(Examination)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Code","Line No.")
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

