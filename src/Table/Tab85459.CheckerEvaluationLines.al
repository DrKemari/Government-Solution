#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85459 "Checker Evaluation Lines"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; Criteria; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Rating; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Checker Evaluation Criterion".Code;

            trigger OnValidate()
            begin
                if CheckerEvaluationCriterion.Get(Rating) then begin
                    Score := CheckerEvaluationCriterion.Score;
                end;
            end;
        }
        field(5; Score; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Recommendation; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Line No", Criteria)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
        Paperss: Record Papers;
        CheckerEvaluationCriterion: Record "Checker Evaluation Criterion";
}
