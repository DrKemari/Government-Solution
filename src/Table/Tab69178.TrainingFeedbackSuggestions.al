#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69178 "Training Feedback Suggestions"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Training Application No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Comments;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Training Category";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Rating Category Setup".Code;
        }
        field(5;"Category Description";Text[100])
        {
            CalcFormula = lookup("Rating Category Setup".Description where (Code=field("Training Category")));
            FieldClass = FlowField;
        }
        field(6;Rating;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Category Rating Scale"."Rating Code" where ("Category Code"=field("Training Category"));

            trigger OnValidate()
            begin
                CategoryRatingScale.Reset;
                //CategoryRatingScale.SETRANGE("Category Code",CategoryRatingScale."Category Code");
                CategoryRatingScale.SetRange("Rating Code",Rating);
                if CategoryRatingScale.FindSet then begin
                  "Rating Description":=CategoryRatingScale."Category Description";
                  end;
            end;
        }
        field(7;"Rating Description";Text[250])
        {
            CalcFormula = lookup("Category Rating Scale"."Rating Description" where ("Rating Code"=field(Rating)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Training Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CategoryRatingScale: Record "Category Rating Scale";
}

