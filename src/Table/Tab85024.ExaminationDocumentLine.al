#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85024 "Examination Document Line"
{

    fields
    {
        field(1;"Template No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Examination Process";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Registration,Exemption,Renewal,Reactive,Defferment,Withdrawal';
            OptionMembers = Registration,Exemption,Renewal,Reactive,Defferment,Withdrawal;
        }
        field(4;"Examination Document Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Document Type";

            trigger OnValidate()
            begin
                if ExaminationDocumentType.Get("Examination Document Type") then begin
                  Description:=ExaminationDocumentType.Description;
                end
            end;
        }
        field(5;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
        field(6;"Examiantion ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(7;"Examination Document";Text[50])
        {
            CalcFormula = lookup("Examination Document Type".Description where (Code=field("Examination Document Type")));
            FieldClass = FlowField;
        }
        field(8;Description;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,New,Existing,Both;
        }
    }

    keys
    {
        key(Key1;"Template No.","Entry No.","Examiantion ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ExaminationDocumentType: Record "Examination Document Type";
}

