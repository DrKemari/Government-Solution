#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51259 "Application Lines"
{

    fields
    {
        field(1;"Code";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Component Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application Topic";

            trigger OnValidate()
            begin
                //
                // IF "Document Type"="Document Type"::Accreditation THEN
                //  BEGIN
                    if ApplicationTopics.Get("Component Code") then begin
                  "Component Description":=ApplicationTopics.Description;
                      Chapters:=ApplicationTopics."Chapter Code";

                 end;
                // END ELSE BEGIN
                if SyllabusSections.Get("Component Code") then
                  "Component Description":=SyllabusSections.Description;
                //END
            end;
        }
        field(3;"Component Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Sub-Component Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = if ("Document Type"=filter(Accreditation|"Site Visit")) "Application SubTopics" where ("Component Code"=field("Component Code"))
                            else if ("Document Type"=filter(Development)) "Syllabus Papers" where ("Syllabus No."=field("Application No."));

            trigger OnValidate()
            begin

                //IF "Document Type"="Document Type"::Accreditation THEN BEGIN
                  if ApplicationSubTopics.Get("Sub-Component Code") then begin
                  "Sub-Component Description":=ApplicationSubTopics.Description;
                   "Maximum Score":=ApplicationSubTopics."Maximum Score";
                end;
                //END ELSE BEGIN
                SyllabusPapers.Reset;
                  SyllabusPapers.SetRange("Paper Code","Sub-Component Code");
                  if SyllabusPapers.FindFirst then begin
                    "Sub-Component Description":=SyllabusPapers.Description;
                    end
                //END
            end;
        }
        field(5;"Sub-Component Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Maximum Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Score;Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Score>"Maximum Score" then Error('Should not exceed the maximum score');
            end;
        }
        field(9;Strength;Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(10;Weakness;Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Recommendation;Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Evaluation Header No.";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                EvaluationHeader.Reset;
                EvaluationHeader.SetRange(Code,"Evaluation Header No.");
                if EvaluationHeader.FindFirst then begin
                  "Document Type":=EvaluationHeader."Document Type";

                  end
            end;
        }
        field(13;Comment;Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Accreditation,Development,Site Visit';
            OptionMembers = Accreditation,Development,"Site Visit";
        }
        field(15;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Evaluation,Site Visit';
            OptionMembers = Evaluation,"Site Visit";
        }
        field(16;Chapters;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application Chapter" where (Type=filter(Asssessment));
        }
    }

    keys
    {
        key(Key1;"Code","Evaluation Header No.","Document Type","Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ApplicationSubTopics: Record "Application SubTopics";
        ApplicationTopics: Record "Application Topic";
        EvaluationHeader: Record "Evaluation Header";
        SyllabusSections: Record "Syllabus Sections";
        SyllabusPapers: Record "Syllabus Papers";
}

