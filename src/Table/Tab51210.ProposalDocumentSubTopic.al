#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51210 "Proposal Document Sub-Topic"
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;"Topic Code";Code[30])
        {
            TableRelation = "Accreditation Comment Line";
        }
        field(3;Description;Text[250])
        {
        }
        field(4;Chapter;Code[250])
        {
            TableRelation = Entries;
            ValidateTableRelation = true;

            trigger OnValidate()
            begin
                /*Chapters.RESET;
                IF Chapters.GET("Topic Code") THEN
                 BEGIN Chapter:=Chapters.Description
                   END;*/
                

            end;
        }
        field(7;test;Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Chapters: Record "Proposal Document Chapter";
}

