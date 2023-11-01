#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85038 "Exemptions Setup"
{
    DrillDownPageID = "Exemptions Setup";
    LookupPageID = "Exemptions Setup";

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Examination Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                if Examinations.Get("Examination Code") then begin
                  Examination:=Examinations.Description;
                end
            end;
        }
        field(3;Examination;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Exemption Subject Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            begin
                if Subjects.Get("Exemption Subject Code") then begin
                  "Exemption Subject":=Subjects.Description;
                  Examinations.Reset;
                  Examinations.SetRange(Code,Subjects.Course);
                  if Examinations.FindSet then begin
                      "Exemption Examination":=Examinations.Description;
                  end;
                  end;
                  //get the exemption amount
            end;
        }
        field(5;"Exemption Subject";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Exemption Examination";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Diploma,Degree,Course';
            OptionMembers = Diploma,Degree,Course;
        }
        field(8;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=filter(Course)) Courses
                            else if (Type=filter(Diploma)) "Exemptions Qualifications" where ("Qualification Type"=filter(Diploma))
                            else if (Type=filter(Degree)) "Exemptions Qualifications" where ("Qualification Type"=filter(Degree));
        }
    }

    keys
    {
        key(Key1;"Entry No.","Exemption Subject Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Exemption Subject Code","Exemption Subject")
        {
        }
    }

    var
        Examinations: Record Courses;
        Subjects: Record Papers;
        ResourcePrice: Record "Resource Price";
        ExemptionsQualifications: Record "Exemptions Qualifications";
}

