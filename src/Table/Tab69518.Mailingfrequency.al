#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69518 "Mailing frequency"
{

    fields
    {
        field(1;"Report No.";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = AllObjWithCaption."Object ID" where ("Object Type"=const(Report));

            trigger OnValidate()
            begin
                if AllObjWithCaption.Get(AllObjWithCaption."object type"::Report,"Report No.") then
                  "Report Name":=AllObjWithCaption."Object Name";
                "Start Date":=Today;
                Validate("Mail Frequency");
            end;
        }
        field(2;"Report Name";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Mail Frequency";DateFormula)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Last Mail Date":=CalcDate("Mail Frequency","Start Date");
            end;
        }
        field(5;"Last Mail Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Attachments File Path";Text[250])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
    }

    keys
    {
        key(Key1;"Report No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AllObjWithCaption: Record AllObjWithCaption;
}

