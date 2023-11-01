#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85061 "Timetable Planner Lines"
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
        field(3;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(4;Section;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where (Course=field(Examination),
                                           Part=field(Part));
        }
        field(5;Paper;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers where (Course=field(Examination),
                                          Section=field(Section));

            trigger OnValidate()
            begin
                Papers.Reset;
                Papers.SetRange(Code,Paper);
                if Papers.FindFirst then begin
                  Description:=Papers.Description;
                end;
                TimetablePlannerHeader.Reset;
                TimetablePlannerHeader.SetRange(Code,Code);
                if TimetablePlannerHeader.FindFirst then  begin
                  "Exam Sitting ID":=TimetablePlannerHeader."Exam Sitting ID"
                end
            end;
        }
        field(6;Description;Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;Date;Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Day:= Format(Date,0,'<Weekday Text>');
            end;
        }
        field(8;"Start Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"End Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            var
                ExamShift: Record "Exam Shift";
            begin
                "Exam Duration":=Format(("End Time"-"Start Time")/3600000)+'Hrs';
            end;
        }
        field(10;Day;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Exam Duration";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Exam Sitting ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(13;"Part";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level.Code where (Course=field(Examination));
        }
        field(14;Session;Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Session Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Shift".Code;

            trigger OnValidate()
            var
                ExamShift: Record "Exam Shift";
            begin
                //get the correct session
                ExamShift.Reset;
                ExamShift.SetFilter(Code,"Session Code");
                if ExamShift.FindFirst then begin
                  Session:=ExamShift.Description;
                  "Start Time":=ExamShift."Default Start Time";
                  "End Time":=ExamShift."Default End Time";
                  Validate("End Time");
                end
            end;
        }
        field(16;"Planned Capacity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Total Capacity";Integer)
        {
            CalcFormula = count("Bank Account");
            Editable = false;
            FieldClass = FlowField;
        }
        field(18;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Exam Center Filter";Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = Courses.Code;
        }
        field(20;"Total No";Integer)
        {
            CalcFormula = count("Exam Booking Entries" where ("Exam Center"=field("Exam Center Filter"),
                                                              Paper=field(Paper),
                                                              Status=const(Open)));
            FieldClass = FlowField;
        }
        field(21;"Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(22;"Session Filter";Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "Exam Shift".Code;
        }
    }

    keys
    {
        key(Key1;"Code","Line No.",Examination,"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Papers: Record Papers;
        TimetablePlannerHeader: Record "Timetable Planner Header";
}

