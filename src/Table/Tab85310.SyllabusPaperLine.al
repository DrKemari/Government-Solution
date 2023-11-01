#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85310 "Syllabus Paper Line"
{

    fields
    {
        field(1;"Syllabus No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Paper Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Syllabus Papers";
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Line Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'General Objective,Intended Outcome,Content';
            OptionMembers = "General Objective","Intended Outcome",Content;
        }
        field(5;Title;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Details;Text[2040])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Paper Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Part";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Section/Level";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Course Id";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Syllabus,Draft,Version';
            OptionMembers = Syllabus,Draft,Version;
        }
    }

    keys
    {
        key(Key1;"Syllabus No.","Paper Code","Line No.","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Paper Code"<>'' then begin
          SyllabusPapers.Reset;
          SyllabusPapers.SetRange("Paper Code","Paper Code");
          if SyllabusPapers.FindFirst then begin
            "Paper Name":=SyllabusPapers.Description;
            "Section/Level":=SyllabusPapers.Section;
            Part:=SyllabusPapers.Part;
            "Course Id":=SyllabusPapers.Course;
            end
          end
    end;

    var
        SyllabusPapers: Record "Syllabus Papers";
}

