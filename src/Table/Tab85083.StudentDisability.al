#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85083 "Student Disability"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Student No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=filter(Student)) Customer
                            else if (Type=filter(Applicant)) "Student Processing Header";
        }
        field(3;"Disability Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disability Code";

            trigger OnValidate()
            var
                DisabilityCode: Record "Disability Code";
            begin
                DisabilityCode.Reset;
                DisabilityCode.SetRange(Code,"Disability Type");
                if DisabilityCode.FindFirst then begin
                "Disability Name":=DisabilityCode.Description;
                  end
            end;
        }
        field(4;"Disability Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Applicant,Student';
            OptionMembers = Applicant,Student;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Student No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

