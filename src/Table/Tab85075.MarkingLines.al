#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85075 "Marking Lines"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Part";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level;
        }
        field(4;Section;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section;
        }
        field(5;Paper;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers where (Level=field(Part));

            trigger OnValidate()
            begin
                if Papers.Get(Paper) then begin
                  "Paper Name":=Papers.Description;
                end
            end;
        }
        field(6;"Paper Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(8;"Total Candidature";Integer)
        {
            CalcFormula = count("Exam Booking Entries" where (Paper=field(Paper),
                                                              Status=filter(Open),
                                                              Blocked=filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;"No. of Markers";Integer)
        {
            CalcFormula = count("Marker Task Allocation" where ("Paper ID"=field(Paper)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10;"No. of Team Leaders";Integer)
        {
            CalcFormula = count("Marker Task Allocation" where ("Paper ID"=field(Paper),
                                                                Role=const("Team Leader")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Papers: Record Papers;
}

