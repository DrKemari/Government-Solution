#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85085 "Exemption Qualifications"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Qualification Type"=const(Course)) Courses
                            else if ("Qualification Type"=const(Diploma)) "Exemptions Qualifications" where ("Qualification Type"=filter(Diploma))
                            else if ("Qualification Type"=const(Degree)) "Exemptions Qualifications" where ("Qualification Type"=filter(Degree));

            trigger OnValidate()
            begin
                if "Qualification Type"="qualification type"::Course then
                begin
                  Courses.Reset;
                  Courses.SetRange(Code,"Qualification Code");
                  if Courses.FindFirst then begin
                    Qualification:=Courses.Description;
                  end;
                end else begin
                  ExemptionsQualifications.Reset;
                  ExemptionsQualifications.SetRange(Code,"Qualification Code");
                  if ExemptionsQualifications.FindFirst then begin
                    Qualification:=ExemptionsQualifications.Qualification;
                  end;
                end;
            end;
        }
        field(4;"Qualification Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Degree,Diploma,Course';
            OptionMembers = Degree,Diploma,Course;
        }
        field(5;Qualification;Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Document No.","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ExemptionsQualifications: Record "Exemptions Qualifications";
        Courses: Record Courses;
}

