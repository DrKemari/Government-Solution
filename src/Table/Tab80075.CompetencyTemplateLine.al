#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80075 "Competency Template Line"
{

    fields
    {
        field(1;"Competency Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Competency Per Template".Code;
        }
        field(2;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Competency Code";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Competency."No.";

            trigger OnLookup()
            begin
                if Competency.Get("Competency Code") then begin
                  "Competency Description":=Competency.Description;
                end;
            end;
        }
        field(4;"Competency Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Competency Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Core/Required,Desired/Added Advantage';
            OptionMembers = "Core/Required","Desired/Added Advantage";
        }
        field(6;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Weight %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Competency Template ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Competency: Record Competency;
}

