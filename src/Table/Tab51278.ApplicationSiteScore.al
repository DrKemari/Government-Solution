#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51278 "Application Site Score"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Ápplication No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Chapter Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application Chapter";

            trigger OnValidate()
            begin
                ApplicationChapter.Reset;
                ApplicationChapter.SetRange(Code,"Chapter Code");
                if ApplicationChapter.FindFirst then begin
                  "Chapter Name":=ApplicationChapter."Component Description"
                end
            end;
        }
        field(4;"Chapter Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Actual Score";Integer)
        {
            Caption = '(Very Good-4,Good-3,Fair-2,Unsatisfactory-1)';
            DataClassification = ToBeClassified;
        }
        field(6;Score;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Very Good-4","Good-3","Fair-2","Unsatisfactory-1";

            trigger OnValidate()
            begin
                if Score=Score::"Fair-2" then
                  "Actual Score":=2;
                if Score=Score::"Unsatisfactory-1" then
                  "Actual Score":=1;
                if Score=Score::"Good-3" then
                  "Actual Score":=3;
                if Score=Score::"Very Good-4" then
                  "Actual Score":=4;
            end;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Ápplication No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ApplicationChapter: Record "Application Chapter";
}

