#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85307 "Application Review Sources"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Source Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Review Resource";

            trigger OnValidate()
            begin
                SourceCategories.Reset;
                SourceCategories.SetRange(Code,"Source Type");
                if SourceCategories.FindFirst then begin
                  "Source Name":=SourceCategories.Description;
                  end
            end;
        }
        field(3;"Source Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Application No.","Source Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SourceCategories: Record "Review Resource";
}

