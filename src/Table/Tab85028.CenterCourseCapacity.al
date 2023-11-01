#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85028 "Center Course Capacity"
{
    Caption = 'Center Course Capacity';

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                  "Course Id":=Code;
                  if Courses.Get("Course Id") then
                   "Course Description":=Courses.Description;
            end;
        }
        field(2;"Centre Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";

            trigger OnValidate()
            begin
                Center.Reset;
                Center.SetRange(Code,"Centre Code");
                if Center.FindSet then begin
                  "Zone Code":=Center."Exam Zone";
                  "Exam Region":=Center."Exam Region";
                  "Centre Name":=Center.Name;
                  end;
            end;
        }
        field(3;"Zone Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Zones".Code;
        }
        field(4;"Exam Region";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Regions";
        }
        field(5;"Maximum Capacity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Exam Route";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Route";
        }
        field(7;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Course Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                Courses.Reset;
                Courses.SetRange(Code,"Course Id");
                if Courses.FindFirst then begin
                  "Course Description":=Courses.Description;
                end
            end;
        }
        field(9;"Course Description";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Centre Name";Text[150])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Centre Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Courses: Record Courses;
        Center: Record "Examination Centres";
}

