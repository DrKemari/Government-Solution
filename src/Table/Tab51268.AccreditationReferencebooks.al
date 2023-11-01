#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51268 "Accreditation Reference books"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Domain Area Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Accreditation Domain";

            trigger OnValidate()
            begin
                AccreditationDomain.Reset;
                AccreditationDomain.SetRange(Code,"Domain Area Code");
                if AccreditationDomain.FindFirst then begin
                  "Domain Area":=AccreditationDomain.Description;
                end
            end;
        }
        field(3;"Domain Area";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Estimated number";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Estimated total value";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. of Recomm books";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.","Domain Area Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AccreditationDomain: Record "Accreditation Domain";
}

