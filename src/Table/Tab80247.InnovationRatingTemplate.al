#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80247 "Innovation Rating Template"
{

    fields
    {
        field(1;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Template ID" <> xRec."Template ID" then begin
                    InnovationSetup.Get;
                    NoSeriesMgt.TestManual(InnovationSetup."Inno Template Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Innovation Category";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Category".Code;
        }
        field(4;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
          if "Template ID" = '' then begin
            InnovationSetup.Get;
            InnovationSetup.TestField("Inno Template Nos");
            NoSeriesMgt.InitSeries(InnovationSetup."Inno Template Nos",xRec."No. Series",0D,"Template ID","No. Series");
          end;
    end;

    var
        InnovationSetup: Record "Innovation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

